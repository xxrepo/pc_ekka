ALTER procedure [dbo].[spY_FilterSkladSkd](
                                 @ptov int,
                                 @pzero int,
                                 @porder int,
                                 @idu smallint=0,
                                 @nmFilter varchar(200)='',
                                 @dvFilter varchar(100)='',
                                 @dzFilter numeric(12,4)=0,
                                 @fvFilter varchar(100)='',
                                 @Ext tinyint=0,
                                 @Dnepr tinyint=0,
                                 @OptCena tinyint=0,
                                 @IsFilter tinyint=0,
                                 @IsPilot tinyint=0,
                                 @RaznOpt tinyint=0,
                                 @IsSpisAllOnly tinyint=0 
                                )
As
 begin

  set transaction isolation level read uncommitted
  
  if (select Count(*) from PereuchetActive (nolock) where Active=1)>0
   begin
    raiserror('Идет переучет! Просмотр остатков запрещен!',16,1)
    return
   end

  declare @cnt int, 
          @askl smallint, 
          @minskd numeric(8,2), 
          @dobr smallint,
          @IsNight tinyint,
          @NightKoef numeric(8,2),
          @NightKoefOgr numeric(8,2)

  exec spY_CheckIsNight @IsNight output

  set @askl=IsNull((select top 1 Value from Spr_Const (nolock) where Descr='AptekaSklad'),0)
  set @Dobr=IsNull((select top 1 Value from Spr_Const (nolock) where Descr='Dobraia'),0)

  set @NightKoef=   IsNull((select value from Spr_const where Descr='NightKoef'),1.30)
  set @NightKoefOgr=IsNull((select value from Spr_const where Descr='NightKoefOgr'),1.24)

  set @minskd=IsNull((select Min(skd) from Skd (nolock) where Type_Skd=1),0)

  if @askl=0 and (convert(varchar,getdate(),8)>(select top 1 Value from Spr_Const (nolock) where Descr='StartTime') or convert(varchar,getdate(),8)<(select top 1 Value from Spr_Const (nolock) where Descr='EndTime'))
   set @minskd=0

  declare @sFilt varchar(max)
  set @sFilt=''

  if @nmFilter<>''
   begin
    if (SubString(@nmFilter,1,1)='#') 
     set @sFilt='convert(varchar,p.art_code)='''+SubString(@nmFilter,2,Len(@nmFilter)-1)+''''
	else
     set @sFilt='((p.Names like ''%'+Replace(@nmFilter,' ','%'' and p.Names like ''%')+'%'')'+
                ' or '+
	            ' (p.NamesSite like ''%'+Replace(@nmFilter,' ','%'' and p.NamesSite like ''%')+'%''))'
   end

  --if @IsFilter=0
   begin
    delete from SprFilter where id_user=@idu and compname=host_name()
    set @cnt=0

    if /*@nmFilter<>'' or */ @dvFilter<>'' or @dzFilter<>0 or @fvFilter<>''
     begin
      insert into SprFilter(art_code,id_user,compname)
      select art_code,@idu,host_name()
      from SprTovar (nolock)
      where names like '%'+@nmFilter+'%' and
            (@dvFilter='' or (@dvFilter<>'' and art_code in (select art_code from Veshestva (nolock) where Descr=@dvFilter 
                                                              union
                                                             select art_code from Plist (nolock) where VeshestvoEN=@dvFilter) )) and
            (@dzFilter=0 or (@dzFilter<>0 and art_code in (select art_code from Veshestva (nolock) where Kol=@dzFilter) )) and
            (@fvFilter='' or (@fvFilter<>'' and art_code in (select art_code from Veshestva (nolock) where Forma=@fvFilter) ))
      set @cnt=@@rowcount

      if @cnt=0
       begin
        insert into SprFilter(art_code,id_user,compname) values(-9999,@idu,host_name())
        set @cnt=@@rowcount
       end
     end
   end /*else begin
             set @cnt=(select Count(*) from SprFilter where id_user=@idu and compname=host_name())
            end*/

  declare @ida int, @FirmID int, @sql varchar(max)
  set @ida=IsNull((select Max(Value) from Spr_Const (nolock) where Descr='ID_APTEKA'),0)
  set @FirmID=IsNull((select Max(Value) from Spr_Const (nolock) where Descr='FirmID'),0)

  set @sql=''
  if @FirmID=13
   set @sql=@sql+' 
    select s.art_code
    into #ExtList
    from SprTov s (nolock),
         Jmoves j (nolock),
         rTovar r (nolock)
    where s.kod_name=r.kod_name and
          r.iddoc=j.iddoc and
          j.Obl=1
    group by art_code '

  set @sql=@sql+'
  select p.Art_Code,
      Max(p.Names)' 

  if @Ext=1 or @OptCena=1 set @sql=@sql+' +IsNull(Max(p.NumSeriya),'''') '


  set @sql=@sql+' as Names,
      Max(p.F_NDS) as F_NDS,
      Max(p.type_tov) as Type_Tov,
      case when '+convert(varchar,@ida)+'=58 then Max(p.Cena)*0.01*(100-IsNull(case when '+convert(varchar,@minskd)+'>Max(p.skd) then Max(p.skd) else '+convert(varchar,@minskd)+' end,'+convert(varchar,@minskd)+'))
           else Max(p.Cena) end as Cena,
      IsNull(Max(p.Upak),1) as Upak,
      convert(numeric(8,2),case '+convert(varchar,@askl)+' when 1 then '

  if @RaznOpt=1 set @sql=@sql+' dbo.ZeroIfNegative(Max(p.cena)*IsNull(Max(p.Upak),1)- '
  set @sql=@sql+'                                 case when Max(l1.art_code) is not null or '+convert(varchar,@IsNight)+'=1
                                                   then Max(p.cena)
                                                  when (Max(kl.art_code) is not null and Max(IsNull(kl.IsOpt,0))=0 and Max(kl.kol)<IsNull(Max(p.Upak),1)*3)
                                                   then Max(p.cena)
                                                  when (Max(kl.art_code) is not null and (Max(p.skd)<=0)) or ('+convert(varchar,@Dobr)+'=1)
                                                   then Max(p.cena)
                                                  when Max(l0.art_code) is not null and Max(kl.art_code) is not null  
                                                   then Max(p.cena)*0.97
                                                  when Max(IsNull(p.cenaopt,0))>0 and Max(IsNull(p.cenaopt,0))<Max(p.cena)
                                                   then Max(IsNull(p.cenaopt,0))
                                                  when Max(IsNull(p.cenaopt,0))>=Max(p.cena)
                                                   then Max(p.cena)-0.1
                                                  when Max(p.cena)>Max(IsNull(p.cenap,0)) and Max(IsNull(p.cenap,0))>0 and IsNull(Max(p.skd),1)>0
                                                   then Max(0.5*(p.cena-p.cenap)+p.cenap)
                                                  else Max(p.cena)
                                             end*IsNull(Max(p.Upak),1) '
  if @RaznOpt=1 set @sql=@sql+              ')'

  set @sql=@sql+                             ' else Max(p.Cena)*IsNull(Max(p.Upak),1)*0.01*(100- IsNull(case when '+convert(varchar,@minskd)+'>Max(p.skd) then Max(p.skd) else '+convert(varchar,@minskd)+' end,'+convert(varchar,@minskd)+')) end) as Skd,

      Max(p.Cena)*IsNull(Max(p.Upak),1) as CenaUp,
      IsNull(Sum(p.Ostat),0) as Ostat,
      case when IsNull(convert(numeric(8,1),(Sum(p.Ostat))/convert(numeric(8,1),IsNull(Max(p.Upak),1))),0)>0. 
                then IsNull(convert(numeric(8,1),(Sum(p.Ostat))/convert(numeric(8,1),IsNull(Max(p.Upak),1))),0) 
           when IsNull(convert(numeric(8,2),(Sum(p.Ostat))/convert(numeric(8,2),IsNull(Max(p.Upak),1))),0)>0. 
                then IsNull(convert(numeric(8,2),(Sum(p.Ostat))/convert(numeric(8,2),IsNull(Max(p.Upak),1))),0) 
           else IsNull(convert(numeric(8,3),(Sum(p.Ostat))/convert(numeric(8,3),IsNull(Max(p.Upak),1))),0)
      end as OstatUp,

      IsNull(Max(p.SrokSkd),0) as SrokSkd,
      IsNull(Max(ns.art_code),0) as IsScan,
      
      Max(convert(smallint,p.IsMap)) as IsMap, 

      convert(int,null) as Gr,
      case Max(p.f_nds) when 1 then ''20%'' else ''7%'' end as Nds,
      case when Max(p.DtEndReg)<=convert(varchar,getdate(),23) then IsNull(Max(p.art_code),0) else 0 end as EndReg,
      IsNull(convert(numeric(8,1),(Max(p.Skl))/convert(numeric(8,1),IsNull(Max(p.Upak),1))),0) as OstatSklad,
      IsNull(convert(numeric(8,1),(Max(p.OstatAptek))/convert(numeric(8,1),IsNull(Max(p.Upak),1))),0) as OstatAptek,
      Max(p.InPrice) as InPrice,
      case when Max(p.MakeFrom)>0 then Max(p.MakeFrom) else p.Art_code end as MakeFrom,
      Max(b.P1) as P1,
      Max(b.P2) as P2,
      Max(b.P3) as P3,
      IsNull(convert(varchar,Max(b.P1)),'''')+IsNull(Max(b.L1),'''') as PL1,
      IsNull(convert(varchar,Max(b.P2)),'''')+IsNull(Max(b.L2),'''') as PL2,
      IsNull(convert(varchar,Max(b.P3)),'''')+IsNull(Max(b.L3),'''') as PL3,
      Max(p.IsAnnot) as IsAnnot,
      Max(IsNull(p.NoRecipt,0)) as IsRecipt,
      case Max(p.skd) when 100 then 11053311 when 3 then 11524263 when 5 then 7709439 when 0 then 8454143 else 0 end as Color,

      case when Max(k.Descr) is null then Max(p.NamesSite) else Max(k.Descr) end as Descr,'

	  if @Ext=1 or @OptCena=1 set @sql=@sql+' Max(p.NumSeriya) as NumSeriya, ' else
	                          set @sql=@sql+' convert(varchar(50),null) as NumSeriya, '

	  set @sql=@sql+'
      IsNull(Max(res.kol),0) as KolRes,

      convert(numeric(8,1),Max(tmp.kol)/IsNull(Max(p.Upak),1)) as KolPrih,
      convert(numeric(8,1),Max(tmp.cena)*IsNull(Max(p.Upak),1)) as CenaPrih,
      Max(tmp.NaklBox) as NaklBox,
      Max(p.TypeTov) as TypeTov,
      Max(p.NamesUA) as NamesUA,
      Max(p.IsSpisAll) as IsSpisAll,
	  (case when Max(IsNull(q.id_record,0)) != 0 then 1 end) as IsQuarantine
from (
            select s.art_code,
            s.names,
            s.f_nds,
            s.type_tov,
            NullIf(IsNull(s.Upak,1),0) as Upak,
            s.DtEndReg,
            s.Skl,
            s.OstatAptek,
            s.InPrice,
            s.MakeFrom,
            s.NoRecipt,
            s.IsAnnot,
            s.CenaP,
            s.CenaOpt,
            s.NamesSite,
            s.TypeTov,
            s.IsMap, '

 if @Ext=1 or @OptCena=1   
  set @sql=@sql+'
            t.NumSeriya,  
            t.cena, 
            t.Ostat, ' 
   else 
  set @sql=@sql+' 
            null as NumSeria,
            case when '+convert(varchar,@IsNight)+'=0 then s.cena_ else
                 case when s.cena_night*case s.IsNight when 0 then '+convert(varchar,@NightKoefOgr)+' else '+convert(varchar,@NightKoef)+' end<s.cena_
                      then s.cena_ 
                      else s.cena_night*case s.IsNight when 0 then '+convert(varchar,@NightKoefOgr)+' else '+convert(varchar,@NightKoef)+' end
                 end        
			end as cena, 

            s.Ostat_ as ostat, '
 set @sql=@sql+' 
            s.SrokSkd,
            s.Skd,
            s.NamesUA,
            s.IsSpisAll  
      from SprTovar s with (nolock) '
 if @Ext=1 or @OptCena=1 
  begin 
   set @sql=@sql+'
            left join
           (
            select t.art_code,
                   s.NumSeriya,  
                   Max(t.cena) as cena, 
                   Sum(t.ostat) as Ostat 
            from SprTov t (nolock)
                  left join
                 Serii s (nolock) on t.id_part8=s.id_part8 '
   if @pzero>=0 or @Ext=1  set @sql=@sql+' 
            where t.Ostat>0 '
   set @sql=@sql+
          ' group by t.art_code,s.NumSeriya 
           ) t on t.art_code=s.art_code  '
  end
 set @sql=@sql+' 
      where s.IsShow=1 or '

 if (@Ext=0) and @FirmID=13 set @sql=@sql+' (s.OstatAptek>0 and IsNull(s.TypeTov,0)<>2) ' else
                            set @sql=@sql+' (s.OstatAptek>0 or TypeTov=2) '
                            
 set @sql=@sql+' /* and IsNull(s.MakeFrom,0)=0  */
     ) p 
      left join
     Inform..SprReg b (nolock) on p.art_code=b.art_code
      left join
     (select Max(Descr) as Descr,art_map from KonkurAll (nolock) group by art_map) k on k.art_map=p.art_code
      left join
     SkdLimit0 l0 (nolock) on l0.art_code=p.art_code --and l0.IsSkd=0 убрал 10.02.2014 чтобы везде оптовые цены были одинаковые
      left join
     SprKol kl (nolock) on kl.art_code=p.art_code --and kl.IsOpt=0
      left join
     SkdLimit1 l1 (nolock) on l1.art_code=p.art_code 
      left join
     (
      select t.art_code, Sum(t.kol) as kol
      from DhRes h (nolock),
           DtRes t (nolock)
      where h.idres=t.idres and
            h.closed=0
      group by t.art_code
     ) res on p.art_code=res.art_code
      left join
     (
      select t.art_code,
             Sum(t.kol) as Kol,
             Max(t.cena) as Cena,
             Max(nn.numbox) as NaklBox 
      from TmpNakl t with (nolock)
            cross apply
		   (
		    select top 1 n.numbox,
                         n.date_nakl,
                         n.nn_nakl
			from NaklBox n with (nolock) 
		    where  t.nn_nakl=n.nn_nakl and
                   t.date_nakl=n.date_nakl and
                   t.art_code=n.art_code 
           ) nn
		    left join
		   Jmoves j (nolock) on j.date_nakl=nn.date_nakl and
		                        j.nn_nakl=nn.nn_nakl 
      where t.obl=0 and 
            j.date_nakl is null 
      group by t.art_code
     ) as tmp on tmp.art_code=p.art_code 
      left join
     NoScan ns (nolock) on ns.art_code=p.art_code
	  outer apply
     (select top 1 qq.id_record from quarantine qq where qq.art_code=p.art_code and qq.dt_restore is null) q
  where '
 if @askl=0 set @sql=@sql+' p.art_code not in (3,4,5,6,7,8,9,10,219700,219701) ' else
             set @sql=@sql+' p.art_code not in (1,2,3,4,5,6,8,9,10,219700,219701) '
 
 if @nmFilter<>'' set @sql=@sql+' and '+@sFilt

 -- if IsNull(@Mnn,'')<>'' set @sql=@sql+' and p.art_code in (select sp.art_code from SprPilot sp (nolock) where sp.Mnn='''+@Mnn+''') '

 if @pzero>=0 or @Ext=1  set @sql=@sql+' and p.Ostat>0 '
 if @Dnepr=1   set @sql=@sql+' and p.art_code in (select d.art_code from Dnepr d (nolock)) '

 if @FirmID=13
  begin
   if @Ext=0 set @sql=@sql+' and p.Art_Code not in (select art_code from #ExtList) ' else
   if @Ext=1 set @sql=@sql+' and p.Art_Code in (select art_code from #ExtList) '
  end
 if @cnt>0 set @sql=@sql+' and p.art_code in (select art_code from SprFilter with (nolock) where id_user='+convert(varchar,@idu)+' and compname=host_name()) '

 if @IsSpisAllOnly=1 set @sql=@sql+' and p.IsSpisAll=1 and p.Ostat>0 '

 set @sql=@sql+' 
  group by p.Art_Code '

 if @Ext=1 or @OptCena=1 set @sql=@sql+', p.NumSeriya ' 
 
 set @sql=@sql+' order by '
  
  if @nmFilter=''
   begin
    if @porder=0 set @sql=@sql+' p.Art_Code ' else
	             set @sql=@sql+' Max(p.Names) '
    if @Ext=1 or @OptCena=1 set @sql=@sql+', Max(p.NumSeriya) '
   end 
  else 
   begin
    set @sql=@sql+' case when Sum(p.Ostat)>0 then ''1'' else ''2'' end,  '

	set @sql=@sql+' replicate(''0'',5-Len(convert(varchar,CharIndex('''+@nmFilter+''',Max(p.Names)))))+convert(varchar,CharIndex('''+@nmFilter+''',Max(p.Names))) '
   end
  
--  declare @txt varchar(max) set @txt=(select top 1 txt from SqlTxt order by dt desc) select @txt
--  insert into SqlTxt(Txt,dt) values(@sql,getdate())
--  print(@sql)  
  exec(@sql)  

 end
