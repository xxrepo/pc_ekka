ALTER procedure [dbo].[spY_AddToQuarantine](
     @id_user int,
	 @id_gamma int
    )
as
begin

  insert into APTEKA_NET.dbo.quarantine (id_record, dt_record, kod_name, art_code, kol, cena, f_nds, id_gamma,  dt_gamma)
                                  select NEWID(),   getdate(), KOD_NAME, ART_CODE, KOL, CENA, F_NDS, @id_gamma, getdate() 
	                              from 
	                                chek
								  where 
								    ID_USER = @id_user 
									and CompName = host_name()

  select count(*) as CountOfEmptySeria from quarantine where isnull(seria,'')='' or isnull(dt_seria,'1900-01-01 00:00:00')='1900-01-01 00:00:00'

end
