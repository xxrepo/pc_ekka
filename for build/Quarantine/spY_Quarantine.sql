ALTER procedure [dbo].[spY_Quarantine](
     @dt_from datetime,
     @dt_to datetime
    )
as
begin

  select 
    convert(uniqueidentifier,q.id_record) as id_record ,
    q.dt_record,
    q.kod_name,
    q.art_code,
    s.NAMES,
    q.kol,
    q.cena,
    (case q.f_nds when 1 then '20%' when 2 then '7%' end) as f_nds,
	q.f_nds as nds,
    q.seria,
    q.dt_seria,
    q.id_gamma,
    q.dt_gamma,
    q.id_gamma1,
    q.dt_gamma1,
    q.id_gamma_restore,
    q.dt_restore,
    u.users 
  from 
    APTEKA_NET.dbo.Quarantine q (nolock)
    left join APTEKA_NET.dbo.SPRTOV s (nolock) on s.KOD_NAME=q.kod_name
    left join APTEKA_NET.dbo.SPRUSER u (nolock) on u.id_gamma=q.id_gamma or u.id_gamma=q.id_gamma1
  where
    q.dt_record > @dt_from
    and q.dt_record <= @dt_to
	and (id_gamma_restore is null or dt_restore is null)
  group by
    q.id_record,
    q.dt_record,
    q.kod_name,
    q.art_code,
    s.NAMES,
    q.kol,
    q.cena,
    q.f_nds,
    q.seria,
    q.dt_seria,
    q.id_gamma,
    q.dt_gamma,
    q.id_gamma1,
    q.dt_gamma1,
    q.id_gamma_restore,
    q.dt_restore,
    u.users
  order by
    s.NAMES
end
