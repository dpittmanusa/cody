USE [CodyMappingTraining]
GO
/****** Object:  View [dbo].[vw_TranslatedPersons]    Script Date: 1/26/2023 12:28:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vw_TranslatedPersons]
AS
SELECT 100000 + pt.Id AS Recnum
     , pt.FirstName AS FName, pt.MiddleName AS MName, pt.LastName AS LName, pt.NameSufx AS Suffix
     , pt.Age
     , CAST(psa.House AS int) AS House, psa.Street, pt.City, ps.StateAbbreviation AS [State], pz.Zip, CAST(pz.ZipExtension AS int) AS ZipExtension
     , dbo.FnConvertInchesToHeight(ppft.Height) AS Height, ppft.[Weight]
     , cr.Race AS Ethnicity_Code, cr.[Description] AS Ethnicity_Desc
     , ce.Ethnicity AS Race_Code, ce.[Description] AS Race_Desc
     , cbt.DstCode AS Build_Code, cbt.DstDesc AS Build_Desc
     , cc.Complexion AS Complexion_Code, cc.[Description] AS Complexion_Desc
     , cec.Eye AS EyeColor_Code, cec.[Description] AS EyeColor_Desc
     , cs.Sex AS Sex_Code, cs.[Description] AS Sex_Desc
     , chc.Hair AS HairColor_Code, chc.[Description] AS HairColor_Desc
     , dbo.FnFormatSSN(pit.SSN) AS SSN
     , pit.DriversLicense AS DRLic, dls.StateAbbreviation AS DRLic_StateCode, dls.StateName AS DRLic_StateDesc
     , pit.Passport
     , dbo.FnFormatPhone(ppe1.Phone) AS Phone1, ppe1.Extension AS Phone1_Extension
     , dbo.FnFormatPhone(ppe2.Phone) AS Phone2, ppe2.Extension AS Phone2_Extension
     , dbo.FnFormatPhone(ppe3.Phone) AS Phone3, ppe3.Extension AS Phone3_Extension
FROM src.PersonTable pt
     LEFT JOIN dbo.States ps ON ps.StateName = pt.[State] -- Person States
     LEFT JOIN dbo.vw_CODY_PersonPhysicalFeatureTable cppft ON cppft.PersonId = pt.Id AND cppft.[Rank] = 1
     LEFT JOIN src.PersonPhysicalFeatureTable ppft ON ppft.Id = cppft.Id
     LEFT JOIN src.CodeBuild cb ON cb.Id = ppft.BuildId
     LEFT JOIN src.CodeEthnicity ce ON ce.Id = ppft.EthnicityId
     LEFT JOIN src.CodeRace cr ON cr.Id = ppft.RaceId
     LEFT JOIN src.CodeComplexion cc ON cc.Id = ppft.ComplexionId
     LEFT JOIN src.CodeEyeColor cec ON cec.Id = ppft.EyeColorId
     LEFT JOIN src.CodeSex cs ON cs.Id = ppft.SexId
     LEFT JOIN src.CodeHairColor chc ON chc.Id = ppft.HairColorId
     LEFT JOIN src.PersonIdentifierTable pit ON pit.PersonId = pt.Id
     LEFT JOIN dbo.states dls ON dls.StateName = pit.DriversLicenseState
     LEFT JOIN (VALUES ('MUSCULAR', 'MUSCLR', 'MUSCLR_BUILD')
                     , ('LIGHT', 'LIGHT', 'LIGHT_BUILD')
                     , ('MEDIUM', 'MEDIUM', 'MEDIUM_BUILD')
                     , ('HEAVY', 'HEAVY', 'HEAVY_BUILD')
               ) cbt (SrcCode, DstCode, DstDesc) ON cbt.SrcCode = cb.Build
     LEFT JOIN (SELECT pvt.PersonId, pvt.Home AS Phone1, pvt.Cell AS Phone2, pvt.Work AS Phone3
                FROM (SELECT p.PersonId, p.PhoneNumber, p.[Type]
                      FROM src.Phone p
                     ) src PIVOT (MAX(src.PhoneNumber) FOR src.[Type] IN (Home, Cell, Work)) pvt
               ) p ON p.PersonId = pt.Id -- Phones
     CROSS APPLY dbo.FnParseStreetAddress(pt.Street) psa
     CROSS APPLY dbo.FnParseZip(pt.Zip) pz
     CROSS APPLY dbo.FnParsePhoneExtension(p.Phone1) AS ppe1
     CROSS APPLY dbo.FnParsePhoneExtension(p.Phone2) AS ppe2
     CROSS APPLY dbo.FnParsePhoneExtension(p.Phone3) AS ppe3
GO
