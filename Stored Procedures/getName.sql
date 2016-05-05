CREATE PROCEDURE GetFirstName
	
	@CustomerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT firstName FROM Customer WHERE @CustomerId = @CustomerId
	END TRY

	BEGIN CATCH
		RAISERROR('Error getting name',2,2);
	END CATCH
END