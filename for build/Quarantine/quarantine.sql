CREATE TABLE [quarantine](
	[id_record] [binary](16) NOT NULL,
	[dt_record] [datetime] NOT NULL,
	[kod_name] [int] NULL,
	[art_code] [int] NULL,
	[kol] [int] NULL,
	[cena] [numeric](8, 2) NULL,
	[f_nds] [smallint] NULL,
	[seria] [varchar](50) NULL,
	[dt_seria] [datetime] NULL,
	[id_gamma] [int] NULL,
	[dt_gamma] [datetime] NULL,
	[id_gamma1] [int] NULL,
	[dt_gamma1] [datetime] NULL,
	[IsUnload] [tinyint] NULL,
	[id_gamma_restore] [int] NULL,
	[dt_restore] [datetime] NULL,
 CONSTRAINT [PK_quarantine] PRIMARY KEY CLUSTERED 
(
	[id_record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
