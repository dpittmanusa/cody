USE [CodyMappingTraining]
GO
/****** Object:  UserDefinedFunction [dbo].[FnConvertInchesToHeight]    Script Date: 1/26/2023 12:20:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Pittman
-- Create date: 2022-01-24
-- Description:	Convert inches to a numeric format where the hundreds digit represents feet
--              and the tens and ones columns represent additional inches
-- =============================================
CREATE FUNCTION [dbo].[FnConvertInchesToHeight] (@Inches int)
RETURNS int
AS
BEGIN
	DECLARE @ResultVar int

	Set @ResultVar = @Inches/12*100 + @Inches%12

	RETURN @ResultVar
END
GO
