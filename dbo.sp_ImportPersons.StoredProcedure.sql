USE [CodyMappingTraining]
GO
/****** Object:  StoredProcedure [dbo].[sp_ImportPersons]    Script Date: 1/26/2023 12:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Pittman
-- Create date: 2022-01-24
-- Description:	Import 
-- =============================================
CREATE PROCEDURE [dbo].[sp_ImportPersons]
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dst.Mastname (Recnum, FName, MName, LName, Suffix, Age, House, Street, City, [State], Zip, ZipExtension, Height, [Weight], Ethnicity_Code, Ethnicity_Desc, Race_Code, Race_Desc, Build_Code, Build_Desc, Complexion_Code, Complexion_Desc, EyeColor_Code, EyeColor_Desc, Sex_Code, Sex_Desc, HairColor_Code, HairColor_Desc, SSN, DRLic, DRLic_StateCode, DRLic_StateDesc, Passport, Phone1, Phone1_Extension, Phone2, Phone2_Extension, Phone3, Phone3_Extension)
	SELECT Recnum, FName, MName, LName, Suffix, Age, House, Street, City, [State], Zip, ZipExtension, Height, [Weight], Ethnicity_Code, Ethnicity_Desc, Race_Code, Race_Desc, Build_Code, Build_Desc, Complexion_Code, Complexion_Desc, EyeColor_Code, EyeColor_Desc, Sex_Code, Sex_Desc, HairColor_Code, HairColor_Desc, SSN, DRLic, DRLic_StateCode, DRLic_StateDesc, Passport, Phone1, Phone1_Extension, Phone2, Phone2_Extension, Phone3, Phone3_Extension
	FROM dbo.vw_TranslatedPersons
END
GO
