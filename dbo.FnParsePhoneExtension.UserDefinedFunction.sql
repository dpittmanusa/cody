USE [CodyMappingTraining]
GO
/****** Object:  UserDefinedFunction [dbo].[FnParsePhoneExtension]    Script Date: 1/26/2023 12:20:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Pittman
-- Create date: 2022-01-24
-- Description:	Separates extension (if any) from rest of phone number
-- =============================================
CREATE FUNCTION [dbo].[FnParsePhoneExtension] (@PhoneNumber varchar(50))
RETURNS TABLE
AS
RETURN 
(
	SELECT IIF(idx.IndexOfExtensionSeparator > 0, TRIM(LEFT(@PhoneNumber, idx.IndexOfExtensionSeparator - 1)), @PhoneNumber) AS Phone
	     , IIF(idx.IndexOfExtensionSeparator > 0, TRIM(SUBSTRING(@PhoneNumber, idx.IndexOfExtensionSeparator + 1, 50)), NULL) AS Extension
	FROM (SELECT PATINDEX('%[x]%', @PhoneNumber) AS IndexOfExtensionSeparator) idx
)
GO
