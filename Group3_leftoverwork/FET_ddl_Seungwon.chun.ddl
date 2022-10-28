
CREATE TYPE [standard_string]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [standard_number]
	FROM INTEGER NULL
go

CREATE TYPE [first_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [last_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [address]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [director]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [city]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [manager]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [state]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [title]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [zip_code]
	FROM INTEGER NULL
go

CREATE TYPE [phone]
	FROM INTEGER NULL
go

CREATE TYPE [address_2]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Domain_782]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Domain_783]
	FROM INTEGER NULL
go

CREATE TYPE [Domain_784]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Domain_785]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Domain_786]
	FROM INTEGER NULL
go

CREATE TYPE [Domain_787]
	FROM VARCHAR(20) NULL
go

CREATE RULE [Movie_genre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')
go

CREATE TABLE [Customer]
( 
	[CustomerAddress]    [address] ,
	[CustomerCity]       [city] ,
	[CustomerFirstName]  [Domain_784] ,
	[CustomerLastName]   [Domain_785] ,
	[CustomerState]      [state] ,
	[CustomerZipCode]    [Domain_786] ,
	[CustomerEmail]      varchar  NULL ,
	[CustomerId]         integer  NOT NULL ,
	[CustomerSSN]        integer  NULL 
)
go

CREATE TABLE [CustomerCreditCard]
( 
	[CreditCardNumber]   integer(16)  NULL ,
	[CreditCardExp]      integer(4)  NULL ,
	[CreditCardCvv]      varchar(3)  NULL ,
	[CustomerId]         integer  NOT NULL ,
	[PaymentType]        char(18)  NULL ,
	[TransactionNumber]  integer  NOT NULL ,
	[RentalRecordDate]   datetime  NULL ,
	[MovieNumber]        integer  NULL ,
	[MovieCompanyId]     integer  NULL 
)
go

CREATE TABLE [Employee]
( 
	[EmployeeFirstName]  [Domain_784] ,
	[EmployeeAddress]    [address] ,
	[EmployeePhoneNumber] [phone] ,
	[StoreNumber]        integer  NULL ,
	[EmployeeAddress2]   [Domain_787] ,
	[EmployeeEmail]      varchar(20)  NULL ,
	[Salary]             integer  NULL ,
	[HireData]           datetime  NULL ,
	[EmployeeSsn]        integer  NULL ,
	[EmployeeId]         varchar(20)  NOT NULL ,
	[Supervisor]         varchar(20)  NOT NULL ,
	[EmployeeLastName]   char(18)  NULL 
)
go

CREATE TABLE [Epay]
( 
	[EpayAccountNumber]  integer  NULL ,
	[TransactionNumber]  integer  NOT NULL ,
	[EpayVendorId]       integer  NULL 
)
go

CREATE TABLE [Movie]
( 
	[MovieTitle]         [title] ,
	[MovieDirector]      [director] ,
	[Description]        varchar(20)  NULL ,
	[Star1Name]          [Domain_784] ,
	[Rating]             varchar  NULL ,
	[Star2Name]          [Domain_784] ,
	[MovieNumber]        integer  NOT NULL ,
	[Genre]              char  NULL ,
	[RentalRate]         numeric  NULL ,
	[MovieUrl]           varchar  NULL ,
	[MovieClip]          varbinary  NULL ,
	[MovieLength]        integer  NULL 
)
go

CREATE TABLE [MovieCopy]
( 
	[GeneralCondition]   varchar(20)  NULL ,
	[MovieFormat]        varchar(20)  NULL ,
	[MovieCompanyId]     integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL 
)
go

CREATE TABLE [MovieRentalRecord]
( 
	[RentalDate]         datetime  NULL ,
	[DueDate]            datetime  NULL ,
	[RentalStatus]       varchar(20)  NULL ,
	[TransactionNumber]  integer  NULL ,
	[OverdueCharge]      integer  NULL ,
	[RentalRate]         integer  NULL ,
	[RentalRecordDate]   datetime  NOT NULL ,
	[MovieCompanyId]     integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL ,
	[CustomerId]         integer  NOT NULL 
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
	[TransactionNumber]  integer  NOT NULL ,
	[PaymentType]        char(18)  NULL ,
	[PaymentAmount]      numeric  NULL ,
	[PaymentDue]         datetime  NULL ,
	[PaymentStatus]      varchar(1)  NULL ,
	[EmployeeId]         varchar(20)  NOT NULL ,
	[CustomerId]         integer  NULL ,
	[EpayVendorId]       integer  NULL 
)
go

CREATE TABLE [PersonalCheck]
( 
	[CheckBankNumber]    integer  NULL ,
	[CheckNumber]        integer  NULL ,
	[TransactionNumber]  integer  NOT NULL ,
	[RoutingNumber]      integer  NULL 
)
go

CREATE TABLE [Store]
( 
	[StoreManager]       [manager] ,
	[StoreAddress]       [address] ,
	[StoreAddress2]      [Domain_787] ,
	[StorePhoneNumber]   [phone] ,
	[StoreCity]          [city] ,
	[StoreState]         [state] ,
	[StoreZipCode]       [Domain_786] ,
	[StoreNumber]        integer  NOT NULL 
)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustomerId] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XAK1Customer] UNIQUE ([CustomerAddress]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Customer] ON [Customer]
( 
	[CustomerLastName]    ASC
)
go

ALTER TABLE [CustomerCreditCard]
	ADD CONSTRAINT [XPKCustomerCreditCard] PRIMARY KEY  CLUSTERED ([CustomerId] ASC,[TransactionNumber] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([EmployeeId] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XAK1Employee] UNIQUE ([EmployeeSsn]  ASC,[EmployeePhoneNumber]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Employee] ON [Employee]
( 
	[EmployeeFirstName]   ASC
)
go

ALTER TABLE [Epay]
	ADD CONSTRAINT [XPKEpay] PRIMARY KEY  CLUSTERED ([TransactionNumber] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XAK1Movie] UNIQUE ([MovieTitle]  ASC)
go

ALTER TABLE [MovieCopy]
	ADD CONSTRAINT [XPKMovieCopy] PRIMARY KEY  CLUSTERED ([MovieCompanyId] ASC,[MovieNumber] ASC)
go

ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [XPKMovieRentalRecord] PRIMARY KEY  CLUSTERED ([RentalRecordDate] ASC,[MovieNumber] ASC,[CustomerId] ASC,[MovieCompanyId] ASC)
go

ALTER TABLE [MovieStore]
	ADD CONSTRAINT [XPKMovieStore] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC,[StoreNumber] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([TransactionNumber] ASC)
go

ALTER TABLE [PersonalCheck]
	ADD CONSTRAINT [XPKPersonalCheck] PRIMARY KEY  CLUSTERED ([TransactionNumber] ASC)
go

ALTER TABLE [Store]
	ADD CONSTRAINT [XPKStore] PRIMARY KEY  CLUSTERED ([StoreNumber] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Store] ON [Store]
( 
	[StoreManager]        ASC
)
go

CREATE VIEW [CustomerInvoice]([CustomerId],[CustomerEmail],[CustomerAddress],[CustomerCity],[CustomerFirstName],[CustomerLastName],[CustomerState],[CustomerZipCode],[MovieTitle],[MovieCompanyId],[MovieNumber],[RentalDate],[RentalRecordDate],[DueDate],[RentalStatus],[OverdueCharge],[RentalRate],[OverdueChargeRate])
AS
SELECT ALL [Customer].[CustomerId],[Customer].[CustomerEmail],[Customer].[CustomerAddress],[Customer].[CustomerCity],[Customer].[CustomerFirstName],[Customer].[CustomerLastName],[Customer].[CustomerState],[Customer].[CustomerZipCode],[Movie].[MovieTitle],[MovieRentalRecord].[MovieCompanyId],[MovieRentalRecord].[MovieNumber],[MovieRentalRecord].[RentalDate],[MovieRentalRecord].[RentalRecordDate],[MovieRentalRecord].[DueDate],[MovieRentalRecord].[RentalStatus],[MovieRentalRecord].[OverdueCharge],[MovieRentalRecord].[RentalRate],RentalRate * 1.5
	FROM [CustomerCreditCard],[Customer],[MovieRentalRecord],[Movie]
go

CREATE VIEW [OverdueNotice]([Overdue_Charge_Rate],[CustomerId],[CustomerFirstName],[CustomerLastName],[CustomerEmail],[MovieNumber],[RentalDate],[RentalRate],[OverdueCharge],[DueDate],[RentalStatus],[RentalRecordDate])
AS
SELECT ALL RentalRate * 1.5,[Customer].[CustomerId],[Customer].[CustomerFirstName],[Customer].[CustomerLastName],[Customer].[CustomerEmail],[Movie].[MovieNumber],[MovieRentalRecord].[RentalDate],[Movie].[RentalRate],[MovieRentalRecord].[OverdueCharge],[MovieRentalRecord].[DueDate],[MovieRentalRecord].[RentalStatus],[CustomerCreditCard].[RentalRecordDate]
	FROM [CustomerCreditCard],[Customer],[MovieRentalRecord],[Movie]
go


ALTER TABLE [CustomerCreditCard]
	ADD CONSTRAINT [FK_CustomerCreditCard_Payment] FOREIGN KEY ([TransactionNumber]) REFERENCES [Payment]([TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CustomerCreditCard]
	ADD CONSTRAINT [FK_CustomerCreditCard_MovieRentalRecord] FOREIGN KEY ([RentalRecordDate],[MovieNumber],[CustomerId],[MovieCompanyId]) REFERENCES [MovieRentalRecord]([RentalRecordDate],[MovieNumber],[CustomerId],[MovieCompanyId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Employee]
	ADD CONSTRAINT [FK_Employee_Store] FOREIGN KEY ([StoreNumber]) REFERENCES [Store]([StoreNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[Movie_genre]', '[Movie].[Genre]'
go


ALTER TABLE [MovieCopy]
	ADD CONSTRAINT [FK_MovieCopy_Movie] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [FK_MovieRentalRecord_MovieCopy] FOREIGN KEY ([MovieCompanyId],[MovieNumber]) REFERENCES [MovieCopy]([MovieCompanyId],[MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [FK_MovieRentalRecord_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [FK_MovieRentalRecord_Payment] FOREIGN KEY ([TransactionNumber]) REFERENCES [Payment]([TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieStore]
	ADD CONSTRAINT [FK_MovieStore_Movie] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStore]
	ADD CONSTRAINT [FK_MovieStore_Store] FOREIGN KEY ([StoreNumber]) REFERENCES [Store]([StoreNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_Epay] FOREIGN KEY ([TransactionNumber]) REFERENCES [Epay]([TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_PersonalCheck] FOREIGN KEY ([TransactionNumber]) REFERENCES [PersonalCheck]([TransactionNumber])
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
    /* ERWIN_RELATION:CHECKSUM="0002316a", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Customer", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer rents under MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_Customer", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because MovieRentalRecord exists.'
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
           @insCustomerId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer makes Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000263cf", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Customer", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer rents under MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_Customer", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because MovieRentalRecord exists.'
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




CREATE TRIGGER tD_CustomerCreditCard ON CustomerCreditCard FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerCreditCard */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieRentalRecord  CustomerCreditCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003bb41", PARENT_OWNER="", PARENT_TABLE="MovieRentalRecord"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_MovieRentalRecord", FK_COLUMNS="CustomerId""RentalRecordDate""MovieCompanyId""MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /* %JoinFKPK(deleted,MovieRentalRecord," = "," AND") */
        deleted.RentalRecordDate = MovieRentalRecord.RentalRecordDate AND
        deleted.MovieCompanyId = MovieRentalRecord.MovieCompanyId AND
        deleted.MovieNumber = MovieRentalRecord.MovieNumber AND
        deleted.CustomerId = MovieRentalRecord.CustomerId AND
        NOT EXISTS (
          SELECT * FROM CustomerCreditCard
          WHERE
            /* %JoinFKPK(CustomerCreditCard,MovieRentalRecord," = "," AND") */
            CustomerCreditCard.RentalRecordDate = MovieRentalRecord.RentalRecordDate AND
            CustomerCreditCard.MovieCompanyId = MovieRentalRecord.MovieCompanyId AND
            CustomerCreditCard.MovieNumber = MovieRentalRecord.MovieNumber AND
            CustomerCreditCard.CustomerId = MovieRentalRecord.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerCreditCard because MovieRentalRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment  CustomerCreditCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.TransactionNumber = Payment.TransactionNumber AND
        NOT EXISTS (
          SELECT * FROM CustomerCreditCard
          WHERE
            /* %JoinFKPK(CustomerCreditCard,Payment," = "," AND") */
            CustomerCreditCard.TransactionNumber = Payment.TransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerCreditCard because Payment exists.'
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


CREATE TRIGGER tU_CustomerCreditCard ON CustomerCreditCard FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerCreditCard */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerId integer, 
           @insTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieRentalRecord  CustomerCreditCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0003f408", PARENT_OWNER="", PARENT_TABLE="MovieRentalRecord"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_MovieRentalRecord", FK_COLUMNS="CustomerId""RentalRecordDate""MovieCompanyId""MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(RentalRecordDate) OR
    UPDATE(MovieCompanyId) OR
    UPDATE(MovieNumber) OR
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieRentalRecord
        WHERE
          /* %JoinFKPK(inserted,MovieRentalRecord) */
          inserted.RentalRecordDate = MovieRentalRecord.RentalRecordDate and
          inserted.MovieCompanyId = MovieRentalRecord.MovieCompanyId and
          inserted.MovieNumber = MovieRentalRecord.MovieNumber and
          inserted.CustomerId = MovieRentalRecord.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.RentalRecordDate IS NULL AND
      inserted.MovieCompanyId IS NULL AND
      inserted.MovieNumber IS NULL AND
      inserted.CustomerId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerCreditCard because MovieRentalRecord does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  CustomerCreditCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.TransactionNumber = Payment.TransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerCreditCard because Payment does not exist.'
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
    /* ERWIN_RELATION:CHECKSUM="0002471d", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Employee", FK_COLUMNS="EmployeeId" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Store employs is Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Store", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,Store
      WHERE
        /* %JoinFKPK(deleted,Store," = "," AND") */
        deleted.StoreNumber = Store.StoreNumber AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,Store," = "," AND") */
            Employee.StoreNumber = Store.StoreNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because Store exists.'
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
           @insEmployeeId varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee receives Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00029da3", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Employee", FK_COLUMNS="EmployeeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Store employs is Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Store", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Store
        WHERE
          /* %JoinFKPK(inserted,Store) */
          inserted.StoreNumber = Store.StoreNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StoreNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Employee because Store does not exist.'
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




CREATE TRIGGER tD_Epay ON Epay FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Epay */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Epay  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000111ad", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="TransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TransactionNumber = deleted.TransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Epay because Payment exists.'
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


CREATE TRIGGER tU_Epay ON Epay FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Epay */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Epay  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013b56", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="TransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TransactionNumber = deleted.TransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Epay because Payment exists.'
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
    /* Movie rents MovieStore on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00021811", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieStore_Movie", FK_COLUMNS="MovieNumber" */
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
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieCopy_Movie", FK_COLUMNS="MovieNumber" */
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
  /* Movie rents MovieStore on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00024f13", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieStore_Movie", FK_COLUMNS="MovieNumber" */
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
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieCopy_Movie", FK_COLUMNS="MovieNumber" */
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




CREATE TRIGGER tD_MovieCopy ON MovieCopy FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieCopy */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieCopy is rented under MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00029932", PARENT_OWNER="", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_MovieCopy", FK_COLUMNS="MovieCompanyId""MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.MovieCompanyId = deleted.MovieCompanyId AND
        MovieRentalRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieCopy because MovieRentalRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is rented as MovieCopy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieCopy_Movie", FK_COLUMNS="MovieNumber" */
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
           @insMovieCompanyId integer, 
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieCopy is rented under MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002f11b", PARENT_OWNER="", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_MovieCopy", FK_COLUMNS="MovieCompanyId""MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieCompanyId) OR
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.MovieCompanyId = deleted.MovieCompanyId AND
        MovieRentalRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieCopy because MovieRentalRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is rented as MovieCopy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieCopy_Movie", FK_COLUMNS="MovieNumber" */
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




CREATE TRIGGER tD_MovieRentalRecord ON MovieRentalRecord FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieRentalRecord */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieRentalRecord  CustomerCreditCard on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005f5ba", PARENT_OWNER="", PARENT_TABLE="MovieRentalRecord"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_MovieRentalRecord", FK_COLUMNS="CustomerId""RentalRecordDate""MovieCompanyId""MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerCreditCard
      WHERE
        /*  %JoinFKPK(CustomerCreditCard,deleted," = "," AND") */
        CustomerCreditCard.RentalRecordDate = deleted.RentalRecordDate AND
        CustomerCreditCard.MovieCompanyId = deleted.MovieCompanyId AND
        CustomerCreditCard.MovieNumber = deleted.MovieNumber AND
        CustomerCreditCard.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieRentalRecord because CustomerCreditCard exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment is made on MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_Payment", FK_COLUMNS="TransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.TransactionNumber = Payment.TransactionNumber AND
        NOT EXISTS (
          SELECT * FROM MovieRentalRecord
          WHERE
            /* %JoinFKPK(MovieRentalRecord,Payment," = "," AND") */
            MovieRentalRecord.TransactionNumber = Payment.TransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieRentalRecord because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer rents under MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_Customer", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM MovieRentalRecord
          WHERE
            /* %JoinFKPK(MovieRentalRecord,Customer," = "," AND") */
            MovieRentalRecord.CustomerId = Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieRentalRecord because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieCopy is rented under MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_MovieCopy", FK_COLUMNS="MovieCompanyId""MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MovieCopy
      WHERE
        /* %JoinFKPK(deleted,MovieCopy," = "," AND") */
        deleted.MovieCompanyId = MovieCopy.MovieCompanyId AND
        deleted.MovieNumber = MovieCopy.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MovieRentalRecord
          WHERE
            /* %JoinFKPK(MovieRentalRecord,MovieCopy," = "," AND") */
            MovieRentalRecord.MovieCompanyId = MovieCopy.MovieCompanyId AND
            MovieRentalRecord.MovieNumber = MovieCopy.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieRentalRecord because MovieCopy exists.'
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


CREATE TRIGGER tU_MovieRentalRecord ON MovieRentalRecord FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieRentalRecord */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRentalRecordDate datetime, 
           @insMovieCompanyId integer, 
           @insMovieNumber integer, 
           @insCustomerId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieRentalRecord  CustomerCreditCard on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00069293", PARENT_OWNER="", PARENT_TABLE="MovieRentalRecord"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_MovieRentalRecord", FK_COLUMNS="CustomerId""RentalRecordDate""MovieCompanyId""MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(RentalRecordDate) OR
    UPDATE(MovieCompanyId) OR
    UPDATE(MovieNumber) OR
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerCreditCard
      WHERE
        /*  %JoinFKPK(CustomerCreditCard,deleted," = "," AND") */
        CustomerCreditCard.RentalRecordDate = deleted.RentalRecordDate AND
        CustomerCreditCard.MovieCompanyId = deleted.MovieCompanyId AND
        CustomerCreditCard.MovieNumber = deleted.MovieNumber AND
        CustomerCreditCard.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieRentalRecord because CustomerCreditCard exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment is made on MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_Payment", FK_COLUMNS="TransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.TransactionNumber = Payment.TransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.TransactionNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieRentalRecord because Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer rents under MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_Customer", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerId = Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieRentalRecord because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieCopy is rented under MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_MovieCopy", FK_COLUMNS="MovieCompanyId""MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieCompanyId) OR
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieCopy
        WHERE
          /* %JoinFKPK(inserted,MovieCopy) */
          inserted.MovieCompanyId = MovieCopy.MovieCompanyId and
          inserted.MovieNumber = MovieCopy.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieRentalRecord because MovieCopy does not exist.'
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
    /* Store is in MovieStore on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00027fa1", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieStore_Store", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,Store
      WHERE
        /* %JoinFKPK(deleted,Store," = "," AND") */
        deleted.StoreNumber = Store.StoreNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStore
          WHERE
            /* %JoinFKPK(MovieStore,Store," = "," AND") */
            MovieStore.StoreNumber = Store.StoreNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStore because Store exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie rents MovieStore on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieStore_Movie", FK_COLUMNS="MovieNumber" */
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
  /* Store is in MovieStore on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b1a8", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieStore_Store", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Store
        WHERE
          /* %JoinFKPK(inserted,Store) */
          inserted.StoreNumber = Store.StoreNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStore because Store does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie rents MovieStore on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieStore_Movie", FK_COLUMNS="MovieNumber" */
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
    /* Payment  CustomerCreditCard on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0007419d", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerCreditCard
      WHERE
        /*  %JoinFKPK(CustomerCreditCard,deleted," = "," AND") */
        CustomerCreditCard.TransactionNumber = deleted.TransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because CustomerCreditCard exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment is made on MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_Payment", FK_COLUMNS="TransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.TransactionNumber = deleted.TransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because MovieRentalRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PersonalCheck  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PersonalCheck"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_PersonalCheck", FK_COLUMNS="TransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,PersonalCheck
      WHERE
        /* %JoinFKPK(deleted,PersonalCheck," = "," AND") */
        deleted.TransactionNumber = PersonalCheck.TransactionNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,PersonalCheck," = "," AND") */
            Payment.TransactionNumber = PersonalCheck.TransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because PersonalCheck exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Epay  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="TransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Epay
      WHERE
        /* %JoinFKPK(deleted,Epay," = "," AND") */
        deleted.TransactionNumber = Epay.TransactionNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Epay," = "," AND") */
            Payment.TransactionNumber = Epay.TransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Epay exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer makes Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Customer", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Customer," = "," AND") */
            Payment.CustomerId = Customer.CustomerId
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
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Employee", FK_COLUMNS="EmployeeId" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeId = Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Employee," = "," AND") */
            Payment.EmployeeId = Employee.EmployeeId
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
           @insTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  CustomerCreditCard on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00083ced", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerCreditCard
      WHERE
        /*  %JoinFKPK(CustomerCreditCard,deleted," = "," AND") */
        CustomerCreditCard.TransactionNumber = deleted.TransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because CustomerCreditCard exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment is made on MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_Payment", FK_COLUMNS="TransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.TransactionNumber = deleted.TransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because MovieRentalRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PersonalCheck  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PersonalCheck"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_PersonalCheck", FK_COLUMNS="TransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PersonalCheck
        WHERE
          /* %JoinFKPK(inserted,PersonalCheck) */
          inserted.TransactionNumber = PersonalCheck.TransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because PersonalCheck does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Epay  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="TransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Epay
        WHERE
          /* %JoinFKPK(inserted,Epay) */
          inserted.TransactionNumber = Epay.TransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Epay does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer makes Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Customer", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerId = Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL
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
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Employee", FK_COLUMNS="EmployeeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeId = Employee.EmployeeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeId IS NULL
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




CREATE TRIGGER tD_PersonalCheck ON PersonalCheck FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PersonalCheck */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PersonalCheck  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012150", PARENT_OWNER="", PARENT_TABLE="PersonalCheck"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_PersonalCheck", FK_COLUMNS="TransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TransactionNumber = deleted.TransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PersonalCheck because Payment exists.'
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


CREATE TRIGGER tU_PersonalCheck ON PersonalCheck FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PersonalCheck */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PersonalCheck  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001402d", PARENT_OWNER="", PARENT_TABLE="PersonalCheck"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_PersonalCheck", FK_COLUMNS="TransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TransactionNumber = deleted.TransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PersonalCheck because Payment exists.'
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




CREATE TRIGGER tD_Store ON Store FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Store */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Store is in MovieStore on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000218f9", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieStore_Store", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStore
      WHERE
        /*  %JoinFKPK(MovieStore,deleted," = "," AND") */
        MovieStore.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Store because MovieStore exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Store employs is Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Store", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Store because Employee exists.'
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


CREATE TRIGGER tU_Store ON Store FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Store */
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
  /* Store is in MovieStore on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00025205", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieStore_Store", FK_COLUMNS="StoreNumber" */
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
             @errmsg = 'Cannot update Store because MovieStore exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Store employs is Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Store", FK_COLUMNS="StoreNumber" */
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
             @errmsg = 'Cannot update Store because Employee exists.'
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


