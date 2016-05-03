-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin Dluzak
-- Create date: 5/1/2016
-- Description:	insert Address
-- =============================================
CREATE PROCEDURE [dbo].[addAddress]
	-- Add the parameters for the stored procedure here
	@AddressId int,
	@City varchar(18),
	@Zip varchar(18),
	@State varchar(18),
	@Street varchar(50)
AS
BEGIN
	DECLARE @err_message varchar(50)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
	IF EXISTS (Select City from Address where City= @City AND @State = State)
		BEGIN
		SET @err_message = 'error adding Address'
		RAISERROR (@err_message,10, 1) 	
		END
	ELSE
		BEGIN
		INSERT INTO Address
		VALUES	(@AddressId, @Zip, @Street, @State, @City);	
		END

END