USE [CodyMappingTraining]
GO
/****** Object:  UserDefinedFunction [dbo].[FnFormatSSN]    Script Date: 1/26/2023 12:20:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Pittman
-- Create date: 2022-01-24
-- Description:	Ensure that SSN is formatted as 000-00-0000
-- =============================================
CREATE FUNCTION [dbo].[FnFormatSSN] (@SSN varchar(12)) 
RETURNS varchar(12)
AS
BEGIN
	DECLARE @ResultVar varchar(12) = @SSN -- Will pass through SSN as it was if we can't make sense of it

	Declare @DigitsOnlySSN varchar(12) = dbo.FnStripCharacters(@SSN, '^0-9')

	If LEN(@DigitsOnlySSN) BETWEEN 7 AND 9 Begin
		Declare @PaddedSSN varchar(12) = RIGHT('00' + @DigitsOnlySSN, 9)

		Set @ResultVar = LEFT(@PaddedSSN, 3) + '-' + SUBSTRING(@PaddedSSN, 4, 2) + '-' + RIGHT(@PaddedSSN, 4)
	End

	RETURN @ResultVar
END
GO
