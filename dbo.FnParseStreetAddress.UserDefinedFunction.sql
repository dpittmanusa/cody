USE [CodyMappingTraining]
GO
/****** Object:  UserDefinedFunction [dbo].[FnParseStreetAddress]    Script Date: 1/26/2023 12:20:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Piittman
-- Create date: 2022-10-24
-- Description:	Separates House # and Street Name from provided Street Address.
--              Returns NULLs if NULL is provided for StreetAddress parameter.
--              Empty string is returned for parts that are missing.
-- =============================================
CREATE FUNCTION [dbo].[FnParseStreetAddress] (@StreetAddress varchar(255))
RETURNS TABLE
AS
RETURN 
(
	SELECT IIF(idx.FirstIndexAfterHouse > 0, LEFT(@StreetAddress, idx.FirstIndexAfterHouse - 1), @StreetAddress) AS House
	     , IIF(idx.FirstIndexAfterHouse > 0, TRIM(SUBSTRING(@StreetAddress, idx.FirstIndexAfterHouse, 255)), LEFT(@StreetAddress, 0)) AS Street
	FROM (SELECT PATINDEX('%[^0-9]%', @StreetAddress) AS FirstIndexAfterHouse) idx
)
GO
