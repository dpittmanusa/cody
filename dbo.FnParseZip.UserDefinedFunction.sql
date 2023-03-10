USE [CodyMappingTraining]
GO
/****** Object:  UserDefinedFunction [dbo].[FnParseZip]    Script Date: 1/26/2023 12:20:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Pittman
-- Create date: 2022-01-24
-- Description:	Separates Zip from Zip Extension (if any)
--              Returns NULL for both parts if value of Zip parameter is NULL.
--              Returns NULL for ZipExtension if none is included.
-- =============================================
CREATE FUNCTION [dbo].[FnParseZip] (@Zip varchar(20))
RETURNS TABLE 
AS
RETURN 
(
	SELECT IIF(idx.IndexOfZipSeparator > 0, LEFT(@Zip, idx.IndexOfZipSeparator - 1), @Zip) AS Zip
	     , IIF(idx.IndexOfZipSeparator > 0, SUBSTRING(@Zip, idx.IndexOfZipSeparator + 1, 20), NULL) AS ZipExtension
	FROM (SELECT PATINDEX('%[^0-9]%', @Zip) AS IndexOfZipSeparator) idx
)
GO
