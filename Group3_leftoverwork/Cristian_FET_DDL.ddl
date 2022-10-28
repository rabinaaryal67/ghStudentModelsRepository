
CREATE TYPE [StandardString]
	FROM VARCHAR(40) NULL
go

CREATE TYPE [StandardNumber]
	FROM INTEGER NULL
go

CREATE TYPE [FirstName]
	FROM VARCHAR(40) NULL
go

CREATE TYPE [LastName]
	FROM VARCHAR(40) NULL
go

CREATE TYPE [Address]
	FROM VARCHAR(60) NULL
go

CREATE TYPE [Director]
	FROM VARCHAR(40) NULL
go

CREATE TYPE [Country]
	FROM VARCHAR(40) NULL
go

CREATE TYPE [Manager]
	FROM VARCHAR(40) NULL
go

CREATE TYPE [Language]
	FROM VARCHAR(40) NULL
go

CREATE TYPE [Title]
	FROM VARCHAR(40) NULL
go

CREATE TYPE [ZipCode]
	FROM INTEGER NULL
go

CREATE TYPE [Phone]
	FROM INTEGER NULL
go

CREATE TYPE [State]
	FROM CHAR(2) NULL
go

CREATE RULE [Moviegenre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')
go

CREATE TABLE [Customer]
( 
	[CustomerAddress]    [Address] ,
	[CustomerCity]       [Country] ,
	[CustomerFirstName]  [FirstName] ,
	[CustomerLastName]   [LastName] ,
	[CustomerState]      [State] ,
	[CustomerZipCode]    [ZipCode] ,
	[Email]              varchar  NULL ,
	[CustomerNumber]     integer  NOT NULL 
)
go

CREATE TABLE [CustomerCredit]
( 
	[CreditCard]         integer  NULL ,
	[CreditCardExp]      integer  NULL ,
	[StatusCode]         varchar(60)  NULL ,
	[CustomerNumber]     integer  NOT NULL 
)
go

CREATE TABLE [CustomerService]
( 
	[CustomerServiceManager] [Manager] ,
	[CustomerServiceAddress] [Address] ,
	[CustomerServiceAddress2] [Address] ,
	[CustomerServicePhone] [Phone] ,
	[CustomerServiceCountry] [Country] ,
	[CustomerServiceLanguage] [Language] ,
	[CustomerServiceZipCode] [ZipCode] ,
	[StoreNumber]        integer  NOT NULL 
)
go

CREATE TABLE [Electronic_Payment]
( 
	[Email]              char(50)  NULL ,
	[Password]           char(18)  NULL ,
	[PaymentTransactionNumber] integer  NULL ,
	[EPayment]           char(18)  NOT NULL 
)
go

CREATE TABLE [Employee]
( 
	[EmployeeFirstName]  [FirstName] ,
	[EmployeeAddress]    [Address] ,
	[EmployeePhone]      [Phone] ,
	[StoreNumber]        integer  NULL ,
	[EmployeeAddress2]   [Address] ,
	[Email]              varchar(60)  NULL ,
	[Salary]             integer  NULL ,
	[HireDate]           datetime  NULL ,
	[SocSecNumber]       integer  NULL ,
	[EmployeeNumber]     varchar(60)  NOT NULL ,
	[Supervisor]         varchar(60)  NOT NULL 
)
go

CREATE TABLE [Movie]
( 
	[MovieTitle]         [Title] ,
	[MovieDirector]      [Director] ,
	[Description]        varchar(60)  NULL ,
	[Star1Name]          [FirstName] ,
	[Rating]             varchar  NULL ,
	[Star2Name]          [FirstName] ,
	[MovieNumber]        integer  NOT NULL ,
	[Genre]              char  NULL ,
	[RentalRate]         numeric  NULL ,
	[MovieUrl]           varchar  NULL ,
	[MovieClip]          varbinary  NULL 
)
go

CREATE TABLE [Movie_Rental_Record]
( 
	[RentalDate]         datetime  NULL ,
	[DueDate]            datetime  NULL ,
	[RentalStatus]       varchar(60)  NULL ,
	[PaymentTransactionNumber] integer  NULL ,
	[OverdueCharge]      integer  NULL ,
	[RentalRate]         integer  NULL ,
	[EmployeePhone]      [Phone]  NOT NULL ,
	[SocSecNumber]       integer  NOT NULL ,
	[RentalRecordDate]   datetime  NOT NULL ,
	[MovieCopyNumber]    integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL ,
	[CustomerNumber]     integer  NOT NULL ,
	[EPayment]           integer  NOT NULL 
)
go

CREATE TABLE [MovieCopy]
( 
	[GeneralCondition]   varchar(60)  NULL ,
	[MovieFormat]        varchar(60)  NULL ,
	[MovieCopyNumber]    integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL 
)
go

CREATE TABLE [MovieStore]
( 
	[MovieNumber]        integer  NOT NULL ,
	[StoreNumber]        integer  NOT NULL 
)
go

CREATE TABLE [Payment]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[PaymentType]        char(18)  NULL ,
	[PaymentAmount]      numeric  NULL ,
	[PaymentDate]        datetime  NULL ,
	[PaymentStatus]      varchar(1)  NULL ,
	[EmployeeNumber]     varchar(60)  NOT NULL ,
	[CustomerNumber]     integer  NULL ,
	[Customer_No]        integer  NULL ,
	[CheckBankNumber]    integer  NULL ,
	[CheckNumber]        integer  NULL ,
	[EpayVendorNumber]   integer  NULL ,
	[EpayAccountNumber]  integer  NULL ,
	[CreditCardNumber]   char(18)  NULL ,
	[CreditCardExp]      datetime  NULL ,
	[CreditCardType]     char(18)  NULL 
)
go

CREATE TABLE [Subcriptions]
( 
	[SubscriptionRecordDate] datetime  NOT NULL ,
	[MoviesIncluded]     integer  NOT NULL ,
	[MoviesNumber]       integer  NOT NULL ,
	[SubscriptionDate]   datetime  NULL ,
	[DueDate]            datetime  NULL ,
	[SubscriptionStatus] varchar(60)  NULL ,
	[PaymentTranscationNumber] integer  NULL ,
	[OverdueChanges]     integer  NULL ,
	[SubscriptionNumber] integer  NOT NULL ,
	[CustomerNumber]     integer  NOT NULL ,
	[EPayment]           char(18)  NOT NULL ,
	[MovieNumber]        integer  NOT NULL 
)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustomerNumber] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XAK1Customer] UNIQUE ([CustomerAddress]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Customer] ON [Customer]
( 
	[CustomerLastName]    ASC
)
go

ALTER TABLE [CustomerCredit]
	ADD CONSTRAINT [XPKCustomerCredit] PRIMARY KEY  CLUSTERED ([CustomerNumber] ASC)
go

ALTER TABLE [CustomerService]
	ADD CONSTRAINT [XPKCustomerService] PRIMARY KEY  CLUSTERED ([StoreNumber] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1CustomerService] ON [CustomerService]
( 
	[CustomerServiceManager]  ASC
)
go

ALTER TABLE [Electronic_Payment]
	ADD CONSTRAINT [XPKElectronicPayment] PRIMARY KEY  CLUSTERED ([EPayment] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([EmployeeNumber] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XAK1Employee] UNIQUE ([SocSecNumber]  ASC,[EmployeePhone]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Employee] ON [Employee]
( 
	[EmployeeFirstName]   ASC
)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XAK1Movie] UNIQUE ([MovieTitle]  ASC)
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [XPKMovieRentalRecord] PRIMARY KEY  CLUSTERED ([RentalRecordDate] ASC,[MovieCopyNumber] ASC,[MovieNumber] ASC,[SocSecNumber] ASC,[EmployeePhone] ASC,[CustomerNumber] ASC,[EPayment] ASC)
go

ALTER TABLE [MovieCopy]
	ADD CONSTRAINT [XPKMovieCopy] PRIMARY KEY  CLUSTERED ([MovieCopyNumber] ASC,[MovieNumber] ASC)
go

ALTER TABLE [MovieStore]
	ADD CONSTRAINT [XPKMovieStore] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC,[StoreNumber] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [Subcriptions]
	ADD CONSTRAINT [XPKSubcriptions] PRIMARY KEY  CLUSTERED ([SubscriptionRecordDate] ASC,[MoviesIncluded] ASC,[MoviesNumber] ASC,[SubscriptionNumber] ASC,[CustomerNumber] ASC,[EPayment] ASC,[MovieNumber] ASC)
go

CREATE VIEW [Customer_Invoice]([CreditCard],[CreditCardExp],[StatusCode],[CustomerNumber],[CustomerAddress],[Email],[CustomerCity],[CustomerFirstName],[CustomerLastName],[CustomerState],[CustomerZipCode],[RentalRecordDate],[MovieCopyNumber],[MovieNumber],[RentalDate],[DueDate],[RentalStatus],[OverdueCharge],[RentalRate],[MovieTitle],[Overdue_Charge_Rate])
AS
SELECT ALL [CustomerCredit].[CreditCard],[CustomerCredit].[CreditCardExp],[CustomerCredit].[StatusCode],[Customer].[CustomerNumber],[Customer].[CustomerAddress],[Customer].[Email],[Customer].[CustomerCity],[Customer].[CustomerFirstName],[Customer].[CustomerLastName],[Customer].[CustomerState],[Customer].[CustomerZipCode],[Movie_Rental_Record].[RentalRecordDate],[Movie_Rental_Record].[MovieCopyNumber],[Movie_Rental_Record].[MovieNumber],[Movie_Rental_Record].[RentalDate],[Movie_Rental_Record].[DueDate],[Movie_Rental_Record].[RentalStatus],[Movie_Rental_Record].[OverdueCharge],[Movie_Rental_Record].[RentalRate],[Movie].[MovieTitle],rental_rate * 1.5
	FROM [CustomerCredit],[Customer],[Movie_Rental_Record],[Movie]
go

CREATE VIEW [Overdue_Notice]([CreditCard],[CreditCardExp],[StatusCode],[Overdue_Charge_Rate],[CustomerNumber],[CustomerAddress],[Email],[CustomerCity],[CustomerFirstName],[CustomerLastName],[CustomerState],[CustomerZipCode],[RentalRecordDate],[MovieCopyNumber],[MovieNumber],[RentalDate],[DueDate],[RentalStatus],[OverdueCharge],[RentalRate])
AS
SELECT ALL [CustomerCredit].[CreditCard],[CustomerCredit].[CreditCardExp],[CustomerCredit].[StatusCode],rental_rate * 1.5,[Customer].[CustomerNumber],[Customer].[CustomerAddress],[Customer].[Email],[Customer].[CustomerCity],[Customer].[CustomerFirstName],[Customer].[CustomerLastName],[Customer].[CustomerState],[Customer].[CustomerZipCode],[Movie_Rental_Record].[RentalRecordDate],[Movie_Rental_Record].[MovieCopyNumber],[Movie_Rental_Record].[MovieNumber],[Movie_Rental_Record].[RentalDate],[Movie_Rental_Record].[DueDate],[Movie_Rental_Record].[RentalStatus],[Movie_Rental_Record].[OverdueCharge],[Movie_Rental_Record].[RentalRate]
	FROM [CustomerCredit],[Customer],[Movie_Rental_Record]
go


ALTER TABLE [Electronic_Payment]
	ADD CONSTRAINT [FK_Electronic_Payment_Payment] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [Payment]([PaymentTransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Employee]
	ADD CONSTRAINT [FK_Employee_Customer_Service] FOREIGN KEY ([StoreNumber]) REFERENCES [CustomerService]([StoreNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [FK_Employee_Employee] FOREIGN KEY ([Supervisor]) REFERENCES [Employee]([EmployeeNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[Moviegenre]', '[Movie].[Genre]'
go


ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [FK_Movie_Rental_Record_Employee] FOREIGN KEY ([SocSecNumber],[EmployeePhone]) REFERENCES [Employee]([SocSecNumber],[EmployeePhone])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [FK_Movie_Rental_Record_Movie_Copy] FOREIGN KEY ([MovieCopyNumber],[MovieNumber]) REFERENCES [MovieCopy]([MovieCopyNumber],[MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [FK_Movie_Rental_Record_Customer] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [FK_Movie_Rental_Record_Customer_Credit] FOREIGN KEY ([CustomerNumber]) REFERENCES [CustomerCredit]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [FK_Movie_Rental_Record_Payment] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [Payment]([PaymentTransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [FK_Movie_Rental_Record_Electronic_Payment] FOREIGN KEY ([EPayment]) REFERENCES [Electronic_Payment]([EPayment])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieCopy]
	ADD CONSTRAINT [FK_Movie_Copy_Movie] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieStore]
	ADD CONSTRAINT [FK_Movie_Store_Movie] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStore]
	ADD CONSTRAINT [FK_Movie_Store_Customer_Service] FOREIGN KEY ([StoreNumber]) REFERENCES [CustomerService]([StoreNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_Employee] FOREIGN KEY ([EmployeeNumber]) REFERENCES [Employee]([EmployeeNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_Customer] FOREIGN KEY ([Customer_No]) REFERENCES [Customer]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_Customer_Credit] FOREIGN KEY ([CustomerNumber]) REFERENCES [CustomerCredit]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Subcriptions]
	ADD CONSTRAINT [FK_Subcriptions_Customer_Credit] FOREIGN KEY ([CustomerNumber]) REFERENCES [CustomerCredit]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Subcriptions]
	ADD CONSTRAINT [FK_Subcriptions_Electronic_Payment] FOREIGN KEY ([EPayment]) REFERENCES [Electronic_Payment]([EPayment])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Subcriptions]
	ADD CONSTRAINT [FK_Subcriptions_Movie] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_Customer ON Customer FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Customer */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer makes Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00023861", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_Customer", FK_COLUMNS="Customer_No" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.Customer_No = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer rents under Movie_Rental_Record on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Customer", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Movie_Rental_Record exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Customer ON Customer FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Customer */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer makes Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002820d", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_Customer", FK_COLUMNS="Customer_No" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.Customer_No = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer rents under Movie_Rental_Record on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Customer", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Movie_Rental_Record exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CustomerCredit ON CustomerCredit FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerCredit */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerCredit  Subcriptions on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003729c", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Customer_Credit", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Subcriptions
      WHERE
        /*  %JoinFKPK(Subcriptions,deleted," = "," AND") */
        Subcriptions.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerCredit because Subcriptions exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit makes Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_Customer_Credit", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerCredit because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit rents under Movie_Rental_Record on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Customer_Credit", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerCredit because Movie_Rental_Record exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CustomerCredit ON CustomerCredit FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerCredit */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerCredit  Subcriptions on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003d806", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Customer_Credit", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Subcriptions
      WHERE
        /*  %JoinFKPK(Subcriptions,deleted," = "," AND") */
        Subcriptions.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerCredit because Subcriptions exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit makes Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_Customer_Credit", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerCredit because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit rents under Movie_Rental_Record on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Customer_Credit", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerCredit because Movie_Rental_Record exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CustomerService ON CustomerService FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerService */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerService is in MovieStore on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00023eb5", PARENT_OWNER="", PARENT_TABLE="CustomerService"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_Customer_Service", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStore
      WHERE
        /*  %JoinFKPK(MovieStore,deleted," = "," AND") */
        MovieStore.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerService because MovieStore exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerService employs is Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerService"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Employee_Customer_Service", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerService because Employee exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CustomerService ON CustomerService FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerService */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStoreNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerService is in MovieStore on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00026f03", PARENT_OWNER="", PARENT_TABLE="CustomerService"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_Customer_Service", FK_COLUMNS="StoreNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStore
      WHERE
        /*  %JoinFKPK(MovieStore,deleted," = "," AND") */
        MovieStore.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerService because MovieStore exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerService employs is Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerService"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Employee_Customer_Service", FK_COLUMNS="StoreNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerService because Employee exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Electronic_Payment ON Electronic_Payment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Electronic_Payment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Electronic_Payment  Subcriptions on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003caea", PARENT_OWNER="", PARENT_TABLE="Electronic_Payment"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Electronic_Payment", FK_COLUMNS="EPayment" */
    IF EXISTS (
      SELECT * FROM deleted,Subcriptions
      WHERE
        /*  %JoinFKPK(Subcriptions,deleted," = "," AND") */
        Subcriptions.EPayment = deleted.EPayment
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Electronic_Payment because Subcriptions exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Electronic_Payment  Movie_Rental_Record on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Electronic_Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Electronic_Payment", FK_COLUMNS="EPayment" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.EPayment = deleted.EPayment
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Electronic_Payment because Movie_Rental_Record exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment  Electronic_Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Electronic_Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Electronic_Payment_Payment", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionNumber = Payment.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM Electronic_Payment
          WHERE
            /* %JoinFKPK(Electronic_Payment,Payment," = "," AND") */
            Electronic_Payment.PaymentTransactionNumber = Payment.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Electronic_Payment because Payment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Electronic_Payment ON Electronic_Payment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Electronic_Payment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEPayment char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Electronic_Payment  Subcriptions on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00043e67", PARENT_OWNER="", PARENT_TABLE="Electronic_Payment"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Electronic_Payment", FK_COLUMNS="EPayment" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EPayment)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Subcriptions
      WHERE
        /*  %JoinFKPK(Subcriptions,deleted," = "," AND") */
        Subcriptions.EPayment = deleted.EPayment
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Electronic_Payment because Subcriptions exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Electronic_Payment  Movie_Rental_Record on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Electronic_Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Electronic_Payment", FK_COLUMNS="EPayment" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EPayment)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.EPayment = deleted.EPayment
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Electronic_Payment because Movie_Rental_Record exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  Electronic_Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Electronic_Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Electronic_Payment_Payment", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionNumber = Payment.PaymentTransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentTransactionNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Electronic_Payment because Payment does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Employee ON Employee FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Employee */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Employee receives Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000633cf", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_Employee", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmployeeNumber = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee reports to Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="Supervisor" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.Supervisor = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee completes Movie_Rental_Record on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Employee", FK_COLUMNS="SocSecNumber""EmployeePhone" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.EmployeePhone = deleted.EmployeePhone AND
        Movie_Rental_Record.SocSecNumber = deleted.SocSecNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because Movie_Rental_Record exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee reports to Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="Supervisor" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.Supervisor = Employee.EmployeeNumber AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,Employee," = "," AND") */
            Employee.Supervisor = Employee.EmployeeNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerService employs is Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerService"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Employee_Customer_Service", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,CustomerService
      WHERE
        /* %JoinFKPK(deleted,CustomerService," = "," AND") */
        deleted.StoreNumber = CustomerService.StoreNumber AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,CustomerService," = "," AND") */
            Employee.StoreNumber = CustomerService.StoreNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because CustomerService exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Employee ON Employee FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Employee */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeeNumber varchar(60),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee receives Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006f92d", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_Employee", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmployeeNumber = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee reports to Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="Supervisor" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.Supervisor = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because Employee exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee completes Movie_Rental_Record on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Employee", FK_COLUMNS="SocSecNumber""EmployeePhone" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.EmployeePhone = deleted.EmployeePhone AND
        Movie_Rental_Record.SocSecNumber = deleted.SocSecNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because Movie_Rental_Record exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee reports to Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="Supervisor" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Supervisor)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.Supervisor = Employee.EmployeeNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Supervisor IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Employee because Employee does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerService employs is Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerService"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Employee_Customer_Service", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerService
        WHERE
          /* %JoinFKPK(inserted,CustomerService) */
          inserted.StoreNumber = CustomerService.StoreNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StoreNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Employee because CustomerService does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Movie ON Movie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  Subcriptions on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00030faa", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Movie", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Subcriptions
      WHERE
        /*  %JoinFKPK(Subcriptions,deleted," = "," AND") */
        Subcriptions.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because Subcriptions exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie rents MovieStore on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_Movie", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStore
      WHERE
        /*  %JoinFKPK(MovieStore,deleted," = "," AND") */
        MovieStore.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieStore exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is rented as MovieCopy on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_Movie_Copy_Movie", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieCopy
      WHERE
        /*  %JoinFKPK(MovieCopy,deleted," = "," AND") */
        MovieCopy.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieCopy exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Movie ON Movie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Movie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  Subcriptions on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000380f9", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Movie", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Subcriptions
      WHERE
        /*  %JoinFKPK(Subcriptions,deleted," = "," AND") */
        Subcriptions.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because Subcriptions exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie rents MovieStore on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_Movie", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStore
      WHERE
        /*  %JoinFKPK(MovieStore,deleted," = "," AND") */
        MovieStore.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieStore exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is rented as MovieCopy on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_Movie_Copy_Movie", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieCopy
      WHERE
        /*  %JoinFKPK(MovieCopy,deleted," = "," AND") */
        MovieCopy.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieCopy exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Movie_Rental_Record ON Movie_Rental_Record FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie_Rental_Record */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Electronic_Payment  Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000973ab", PARENT_OWNER="", PARENT_TABLE="Electronic_Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Electronic_Payment", FK_COLUMNS="EPayment" */
    IF EXISTS (SELECT * FROM deleted,Electronic_Payment
      WHERE
        /* %JoinFKPK(deleted,Electronic_Payment," = "," AND") */
        deleted.EPayment = Electronic_Payment.EPayment AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,Electronic_Payment," = "," AND") */
            Movie_Rental_Record.EPayment = Electronic_Payment.EPayment
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because Electronic_Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment is made on Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Payment", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionNumber = Payment.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,Payment," = "," AND") */
            Movie_Rental_Record.PaymentTransactionNumber = Payment.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit rents under Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Customer_Credit", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,CustomerCredit
      WHERE
        /* %JoinFKPK(deleted,CustomerCredit," = "," AND") */
        deleted.CustomerNumber = CustomerCredit.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,CustomerCredit," = "," AND") */
            Movie_Rental_Record.CustomerNumber = CustomerCredit.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because CustomerCredit exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer rents under Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Customer", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerNumber = Customer.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,Customer," = "," AND") */
            Movie_Rental_Record.CustomerNumber = Customer.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieCopy is rented under Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Movie_Copy", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MovieCopy
      WHERE
        /* %JoinFKPK(deleted,MovieCopy," = "," AND") */
        deleted.MovieCopyNumber = MovieCopy.MovieCopyNumber AND
        deleted.MovieNumber = MovieCopy.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,MovieCopy," = "," AND") */
            Movie_Rental_Record.MovieCopyNumber = MovieCopy.MovieCopyNumber AND
            Movie_Rental_Record.MovieNumber = MovieCopy.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because MovieCopy exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee completes Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Employee", FK_COLUMNS="SocSecNumber""EmployeePhone" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeePhone = Employee.EmployeePhone AND
        deleted.SocSecNumber = Employee.SocSecNumber AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,Employee," = "," AND") */
            Movie_Rental_Record.EmployeePhone = Employee.EmployeePhone AND
            Movie_Rental_Record.SocSecNumber = Employee.SocSecNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because Employee exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Movie_Rental_Record ON Movie_Rental_Record FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Movie_Rental_Record */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeePhone Phone, 
           @insSocSecNumber integer, 
           @insRentalRecordDate datetime, 
           @insMovieCopyNumber integer, 
           @insMovieNumber integer, 
           @insCustomerNumber integer, 
           @insEPayment integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Electronic_Payment  Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0009bc38", PARENT_OWNER="", PARENT_TABLE="Electronic_Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Electronic_Payment", FK_COLUMNS="EPayment" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EPayment)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Electronic_Payment
        WHERE
          /* %JoinFKPK(inserted,Electronic_Payment) */
          inserted.EPayment = Electronic_Payment.EPayment
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Rental_Record because Electronic_Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment is made on Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Payment", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionNumber = Payment.PaymentTransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentTransactionNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Rental_Record because Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit rents under Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Customer_Credit", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerCredit
        WHERE
          /* %JoinFKPK(inserted,CustomerCredit) */
          inserted.CustomerNumber = CustomerCredit.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Rental_Record because CustomerCredit does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer rents under Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Customer", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerNumber = Customer.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Rental_Record because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieCopy is rented under Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Movie_Copy", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieCopyNumber) OR
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieCopy
        WHERE
          /* %JoinFKPK(inserted,MovieCopy) */
          inserted.MovieCopyNumber = MovieCopy.MovieCopyNumber and
          inserted.MovieNumber = MovieCopy.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Rental_Record because MovieCopy does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee completes Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Employee", FK_COLUMNS="SocSecNumber""EmployeePhone" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeePhone) OR
    UPDATE(SocSecNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeePhone = Employee.EmployeePhone and
          inserted.SocSecNumber = Employee.SocSecNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Rental_Record because Employee does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MovieCopy ON MovieCopy FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieCopy */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieCopy is rented under Movie_Rental_Record on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002b8b1", PARENT_OWNER="", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Movie_Copy", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.MovieCopyNumber = deleted.MovieCopyNumber AND
        Movie_Rental_Record.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieCopy because Movie_Rental_Record exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is rented as MovieCopy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_Movie_Copy_Movie", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MovieCopy
          WHERE
            /* %JoinFKPK(MovieCopy,Movie," = "," AND") */
            MovieCopy.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieCopy because Movie exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MovieCopy ON MovieCopy FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieCopy */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieCopyNumber integer, 
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieCopy is rented under Movie_Rental_Record on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002f548", PARENT_OWNER="", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Movie_Copy", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieCopyNumber) OR
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.MovieCopyNumber = deleted.MovieCopyNumber AND
        Movie_Rental_Record.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieCopy because Movie_Rental_Record exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is rented as MovieCopy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_Movie_Copy_Movie", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieCopy because Movie does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MovieStore ON MovieStore FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieStore */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerService is in MovieStore on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002a065", PARENT_OWNER="", PARENT_TABLE="CustomerService"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_Customer_Service", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,CustomerService
      WHERE
        /* %JoinFKPK(deleted,CustomerService," = "," AND") */
        deleted.StoreNumber = CustomerService.StoreNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStore
          WHERE
            /* %JoinFKPK(MovieStore,CustomerService," = "," AND") */
            MovieStore.StoreNumber = CustomerService.StoreNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStore because CustomerService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie rents MovieStore on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_Movie", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStore
          WHERE
            /* %JoinFKPK(MovieStore,Movie," = "," AND") */
            MovieStore.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStore because Movie exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MovieStore ON MovieStore FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieStore */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer, 
           @insStoreNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerService is in MovieStore on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002e830", PARENT_OWNER="", PARENT_TABLE="CustomerService"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_Customer_Service", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerService
        WHERE
          /* %JoinFKPK(inserted,CustomerService) */
          inserted.StoreNumber = CustomerService.StoreNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStore because CustomerService does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie rents MovieStore on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_Movie", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStore because Movie does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Payment ON Payment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Payment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment  Electronic_Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0006485c", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Electronic_Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Electronic_Payment_Payment", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Electronic_Payment
      WHERE
        /*  %JoinFKPK(Electronic_Payment,deleted," = "," AND") */
        Electronic_Payment.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because Electronic_Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment is made on Movie_Rental_Record on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Payment", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because Movie_Rental_Record exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit makes Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_Customer_Credit", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,CustomerCredit
      WHERE
        /* %JoinFKPK(deleted,CustomerCredit," = "," AND") */
        deleted.CustomerNumber = CustomerCredit.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,CustomerCredit," = "," AND") */
            Payment.CustomerNumber = CustomerCredit.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because CustomerCredit exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer makes Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_Customer", FK_COLUMNS="Customer_No" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.Customer_No = Customer.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Customer," = "," AND") */
            Payment.Customer_No = Customer.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee receives Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_Employee", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeNumber = Employee.EmployeeNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Employee," = "," AND") */
            Payment.EmployeeNumber = Employee.EmployeeNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Employee exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Payment ON Payment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Payment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  Electronic_Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00075f6e", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Electronic_Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Electronic_Payment_Payment", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Electronic_Payment
      WHERE
        /*  %JoinFKPK(Electronic_Payment,deleted," = "," AND") */
        Electronic_Payment.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because Electronic_Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment is made on Movie_Rental_Record on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_Movie_Rental_Record_Payment", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because Movie_Rental_Record exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit makes Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_Customer_Credit", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerCredit
        WHERE
          /* %JoinFKPK(inserted,CustomerCredit) */
          inserted.CustomerNumber = CustomerCredit.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because CustomerCredit does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer makes Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_Customer", FK_COLUMNS="Customer_No" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Customer_No)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.Customer_No = Customer.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Customer_No IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee receives Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_Employee", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeNumber = Employee.EmployeeNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Employee does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Subcriptions ON Subcriptions FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Subcriptions */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  Subcriptions on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00042919", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Movie", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM Subcriptions
          WHERE
            /* %JoinFKPK(Subcriptions,Movie," = "," AND") */
            Subcriptions.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Subcriptions because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Electronic_Payment  Subcriptions on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Electronic_Payment"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Electronic_Payment", FK_COLUMNS="EPayment" */
    IF EXISTS (SELECT * FROM deleted,Electronic_Payment
      WHERE
        /* %JoinFKPK(deleted,Electronic_Payment," = "," AND") */
        deleted.EPayment = Electronic_Payment.EPayment AND
        NOT EXISTS (
          SELECT * FROM Subcriptions
          WHERE
            /* %JoinFKPK(Subcriptions,Electronic_Payment," = "," AND") */
            Subcriptions.EPayment = Electronic_Payment.EPayment
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Subcriptions because Electronic_Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit  Subcriptions on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Customer_Credit", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,CustomerCredit
      WHERE
        /* %JoinFKPK(deleted,CustomerCredit," = "," AND") */
        deleted.CustomerNumber = CustomerCredit.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM Subcriptions
          WHERE
            /* %JoinFKPK(Subcriptions,CustomerCredit," = "," AND") */
            Subcriptions.CustomerNumber = CustomerCredit.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Subcriptions because CustomerCredit exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Subcriptions ON Subcriptions FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Subcriptions */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSubscriptionRecordDate datetime, 
           @insMoviesIncluded integer, 
           @insMoviesNumber integer, 
           @insSubscriptionNumber integer, 
           @insCustomerNumber integer, 
           @insEPayment char(18), 
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  Subcriptions on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000467a7", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Movie", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Subcriptions because Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Electronic_Payment  Subcriptions on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Electronic_Payment"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Electronic_Payment", FK_COLUMNS="EPayment" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EPayment)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Electronic_Payment
        WHERE
          /* %JoinFKPK(inserted,Electronic_Payment) */
          inserted.EPayment = Electronic_Payment.EPayment
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Subcriptions because Electronic_Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit  Subcriptions on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Subcriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subcriptions_Customer_Credit", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerCredit
        WHERE
          /* %JoinFKPK(inserted,CustomerCredit) */
          inserted.CustomerNumber = CustomerCredit.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Subcriptions because CustomerCredit does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


