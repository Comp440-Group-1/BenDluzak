
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Dluzak
-- Create date: 5/1/2016
-- Description:	Update Version
-- =============================================
CREATE PROCEDURE [dbo].[UpdateVersion] 
	-- Add the parameters for the stored procedure here
 @ProductID int,
 @VersionNumber float,
 @ReleaseDate date,
 @newVersion float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF EXISTS (Select * from Version where ProductId = @ProductId AND VersionNumber = @VersionNumber)
		BEGIN
		UPDATE Version
		SET ReleaseDate = @ReleaseDate, VersionNumber = @newVersion
		WHERE VersionNumber = @VersionNumber;
		END
	ELSE
		BEGIN
		SET @err_message = (@VersionNumber + 'Product or version does not exist')
				 RAISERROR (@err_message,10, 1) 	
		END
END
