USE [CodyMappingTraining]
GO
/****** Object:  UserDefinedFunction [dbo].[FnFormatPhone]    Script Date: 1/26/2023 12:20:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Pittman
-- Create date: 2022-01-24
-- Description:	Ensures that a provided phone number is in the format (000) 000-0000 for North American numbers,
--              or +0 000 000 0000 for international nummbers
-- =============================================
CREATE FUNCTION [dbo].[FnFormatPhone] (@PhoneNumber varchar(50))
RETURNS varchar(50)
AS
BEGIN
	DECLARE @ResultVar varchar(50) = @PhoneNumber -- Pass through original value if we can't make sense of it

	Declare @DigitsOnlyPhoneNumber varchar(50) = dbo.FnStripCharacters(@PhoneNumber, '^0-9')

	Declare @NumDigits int = LEN(@DigitsOnlyPhoneNumber)

	If @NumDigits IN (7, 10) OR (@NumDigits = 11 AND LEFT(@DigitsOnlyPhoneNumber, 1) = '1') -- North American
		Set @ResultVar = IIF(@NumDigits > 7, '(' + LEFT(RIGHT(@DigitsOnlyPhoneNumber, 10), 3) + ') ', '') + LEFT(RIGHT(@DigitsOnlyPhoneNumber, 7), 3) + '-' + RIGHT(@DigitsOnlyPhoneNumber, 4)
	Else If @NumDigits > 10 -- International
		Set @ResultVar = '+' + LEFT(@DigitsOnlyPhoneNumber, @NumDigits - 10) + ' ' + LEFT(RIGHT(@DigitsOnlyPhoneNumber, 10), 3) + ' ' + LEFT(RIGHT(@DigitsOnlyPhoneNumber, 7), 3) + ' ' + RIGHT(@DigitsOnlyPhoneNumber, 4)

	RETURN @ResultVar
END
GO
