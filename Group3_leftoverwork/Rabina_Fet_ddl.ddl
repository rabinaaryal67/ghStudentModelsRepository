
CREATE TYPE [standardstring]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [standardnumber]
	FROM INTEGER NULL
go

CREATE TYPE [firstname]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [lastname]
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

CREATE TYPE [zipcode]
	FROM INTEGER NULL
go

CREATE TYPE [phone]
	FROM INTEGER NULL
go

CREATE TYPE [address2]
	FROM VARCHAR(20) NULL
go

CREATE RULE [Moviegenre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')
go

CREATE TABLE [Customer]
( 
	[Customer_Address]   [address] ,
	[Customer_City]      [city] ,
	[Customer_First_Name] [firstname] ,
	[Customer_Last_Name] [lastname] ,
	[Customer_State]     [state] ,
	[Customer_Zip_Code]  [zipcode] ,
	[Email]              varchar  NULL ,
	[Customer_Number]    integer  NOT NULL 
)
go

CREATE TABLE [Customer_Credit]
( 
	[Credit_Card]        integer  NULL ,
	[Credit_Card_Exp]    integer  NULL ,
	[Status_Code]        varchar(20)  NULL ,
	[Customer_Number]    integer  NOT NULL 
)
go

CREATE TABLE [Employee]
( 
	[Employee_First_Name] [firstname] ,
	[Employee_Address]   [address] ,
	[Employee_Phone]     [phone] ,
	[StoreNumber]        integer  NULL ,
	[Employee_Address_2] [address2] ,
	[Email]              varchar(20)  NULL ,
	[Salary]             integer  NULL ,
	[Hire_Date]          datetime  NULL ,
	[Soc_Sec_Number]     integer  NULL ,
	[Employee_Number]    varchar(20)  NOT NULL ,
	[Supervisor]         varchar(20)  NOT NULL 
)
go

CREATE TABLE [Movie]
( 
	[Movie_Title]        [title] ,
	[Movie_Director]     [director] ,
	[Description]        varchar(20)  NULL ,
	[Star_1_Name]        [firstname] ,
	[Rating]             varchar  NULL ,
	[Star_2_Name]        [firstname] ,
	[Movie_Number]       integer  NOT NULL ,
	[Genre]              varchar(2)  NULL ,
	[Rental_Rate]        numeric  NULL ,
	[Movie_Url]          varchar  NULL ,
	[Movie_Clip]         varbinary  NULL 
)
go

CREATE TABLE [Movie_Copy]
( 
	[General_Condition]  varchar(20)  NULL ,
	[Movie_Format]       varchar(20)  NULL ,
	[Movie_Copy_Number]  integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL 
)
go

CREATE TABLE [Movie_Rental_Record]
( 
	[Rental_Date]        datetime  NULL ,
	[Due_Date]           datetime  NULL ,
	[Rental_Status]      varchar(20)  NULL ,
	[PaymentTransactionNumber] integer  NULL ,
	[Overdue_Charge]     integer  NULL ,
	[Rental_Rate]        integer  NULL ,
	[EmployeePhone]      [phone]  NOT NULL ,
	[SocSecNumber]       integer  NOT NULL ,
	[Rental_Record_Date] datetime  NOT NULL ,
	[MovieCopyNumber]    integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL ,
	[CustomerNumber]     integer  NOT NULL 
)
go

CREATE TABLE [Movie_Store]
( 
	[MovieNumber]        integer  NOT NULL ,
	[StoreNumber]        integer  NOT NULL 
)
go

CREATE TABLE [Payment]
( 
	[Payment_Transaction_Number] integer  NOT NULL ,
	[Payment_Type]       char(18)  NULL ,
	[Payment_Amount]     numeric  NULL ,
	[Payment_Date]       datetime  NULL ,
	[Payment_Status]     varchar(1)  NULL ,
	[EmployeeNumber]     varchar(20)  NOT NULL ,
	[CustomerNumber]     integer  NULL ,
	[Customer_No]        integer  NULL ,
	[Check_Bank_Number]  integer  NULL ,
	[Check_Number]       integer  NULL ,
	[Epay_Vendor_Number] integer  NULL ,
	[Epay_Account_Number] integer  NULL ,
	[Credit_Card_Number] char(18)  NULL ,
	[Credit_Card_Exp]    datetime  NULL ,
	[Credit_Card_Type]   char(18)  NULL 
)
go

CREATE TABLE [Store]
( 
	[Store_Manager]      [manager] ,
	[Store_Address]      [address] ,
	[Store_Address_2]    [address2] ,
	[Store_Phone]        [phone] ,
	[Store_City]         [city] ,
	[Store_State]        [state] ,
	[Store_Zip_Code]     [zipcode] ,
	[Store_Number]       integer  NOT NULL 
)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([Customer_Number] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XAK1Customer] UNIQUE ([Customer_Address]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Customer] ON [Customer]
( 
	[Customer_Last_Name]  ASC
)
go

ALTER TABLE [Customer_Credit]
	ADD CONSTRAINT [XPKCustomerCredit] PRIMARY KEY  CLUSTERED ([Customer_Number] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([Employee_Number] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XAK1Employee] UNIQUE ([Soc_Sec_Number]  ASC,[Employee_Phone]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Employee] ON [Employee]
( 
	[Employee_First_Name]  ASC
)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([Movie_Number] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XAK1Movie] UNIQUE ([Movie_Title]  ASC)
go

ALTER TABLE [Movie_Copy]
	ADD CONSTRAINT [XPKMovieCopy] PRIMARY KEY  CLUSTERED ([Movie_Copy_Number] ASC,[MovieNumber] ASC)
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [XPKMovieRentalRecord] PRIMARY KEY  CLUSTERED ([Rental_Record_Date] ASC,[MovieCopyNumber] ASC,[MovieNumber] ASC,[SocSecNumber] ASC,[EmployeePhone] ASC,[CustomerNumber] ASC)
go

ALTER TABLE [Movie_Store]
	ADD CONSTRAINT [XPKMovieStore] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC,[StoreNumber] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([Payment_Transaction_Number] ASC)
go

ALTER TABLE [Store]
	ADD CONSTRAINT [XPKStore] PRIMARY KEY  CLUSTERED ([Store_Number] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Store] ON [Store]
( 
	[Store_Manager]       ASC
)
go

CREATE VIEW [CUSTOMER_INVOICE]([Credit_Card],[Credit_Card_Exp],[Status_Code],[Customer_Number],[Customer_Address],[Email],[Customer_City],[Customer_First_Name],[Customer_Last_Name],[Customer_State],[Customer_Zip_Code],[Rental_Record_Date],[Movie_Copy_Number],[Movie_Number],[Rental_Date],[Due_Date],[Rental_Status],[Overdue_Charge],[Rental_Rate],[Movie_Title],[Overdue_Charge_Rate])
AS
SELECT ALL [Customer_Credit].[Credit_Card],[Customer_Credit].[Credit_Card_Exp],[Customer_Credit].[Status_Code],[Customer].[Customer_Number],[Customer].[Customer_Address],[Customer].[Email],[Customer].[Customer_City],[Customer].[Customer_First_Name],[Customer].[Customer_Last_Name],[Customer].[Customer_State],[Customer].[Customer_Zip_Code],[Movie_Rental_Record].[Rental_Record_Date],[Movie_Rental_Record].[MovieCopyNumber],[Movie_Rental_Record].[MovieNumber],[Movie_Rental_Record].[Rental_Date],[Movie_Rental_Record].[Due_Date],[Movie_Rental_Record].[Rental_Status],[Movie_Rental_Record].[Overdue_Charge],[Movie_Rental_Record].[Rental_Rate],[Movie].[Movie_Title],rental_rate * 1.5
	FROM [Customer_Credit],[Customer],[Movie_Rental_Record],[Movie]
go

CREATE VIEW [OVERDUE_NOTICE]([Credit_Card],[Credit_Card_Exp],[Status_Code],[Overdue_Charge_Rate],[Customer_Number],[Customer_Address],[Email],[Customer_City],[Customer_First_Name],[Customer_Last_Name],[Customer_State],[Customer_Zip_Code],[Rental_Record_Date],[Movie_Copy_Number],[Movie_Number],[Rental_Date],[Due_Date],[Rental_Status],[Overdue_Charge],[Rental_Rate])
AS
SELECT ALL [Customer_Credit].[Credit_Card],[Customer_Credit].[Credit_Card_Exp],[Customer_Credit].[Status_Code],rental_rate * 1.5,[Customer].[Customer_Number],[Customer].[Customer_Address],[Customer].[Email],[Customer].[Customer_City],[Customer].[Customer_First_Name],[Customer].[Customer_Last_Name],[Customer].[Customer_State],[Customer].[Customer_Zip_Code],[Movie_Rental_Record].[Rental_Record_Date],[Movie_Rental_Record].[MovieCopyNumber],[Movie_Rental_Record].[MovieNumber],[Movie_Rental_Record].[Rental_Date],[Movie_Rental_Record].[Due_Date],[Movie_Rental_Record].[Rental_Status],[Movie_Rental_Record].[Overdue_Charge],[Movie_Rental_Record].[Rental_Rate]
	FROM [Customer_Credit],[Customer],[Movie_Rental_Record]
go


ALTER TABLE [Employee]
	ADD CONSTRAINT [employs_is] FOREIGN KEY ([StoreNumber]) REFERENCES [Store]([Store_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [reports_to] FOREIGN KEY ([Supervisor]) REFERENCES [Employee]([Employee_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[Moviegenre]', '[Movie].[Genre]'
go


ALTER TABLE [Movie_Copy]
	ADD CONSTRAINT [is_rented_as] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([Movie_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [completes] FOREIGN KEY ([SocSecNumber],[EmployeePhone]) REFERENCES [Employee]([Soc_Sec_Number],[Employee_Phone])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [is_rented_under] FOREIGN KEY ([MovieCopyNumber],[MovieNumber]) REFERENCES [Movie_Copy]([Movie_Copy_Number],[MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [R_8_1] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer]([Customer_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [R_8_2] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer_Credit]([Customer_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Rental_Record]
	ADD CONSTRAINT [is_made_on] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [Payment]([Payment_Transaction_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Movie_Store]
	ADD CONSTRAINT [rents] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([Movie_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie_Store]
	ADD CONSTRAINT [isin] FOREIGN KEY ([StoreNumber]) REFERENCES [Store]([Store_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [receives] FOREIGN KEY ([EmployeeNumber]) REFERENCES [Employee]([Employee_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [R71] FOREIGN KEY ([Customer_No]) REFERENCES [Customer]([Customer_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [R72] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer_Credit]([Customer_Number])
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
    /* ERWIN_RELATION:CHECKSUM="0002378f", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R71", FK_COLUMNS="Customer_No" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.Customer_No = deleted.Customer_Number
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
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.CustomerNumber = deleted.Customer_Number
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
           @insCustomer_Number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer makes Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000270ef", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R71", FK_COLUMNS="Customer_No" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Customer_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.Customer_No = deleted.Customer_Number
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
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Customer_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.CustomerNumber = deleted.Customer_Number
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




CREATE TRIGGER tD_Customer_Credit ON Customer_Credit FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Customer_Credit */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer_Credit makes Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002550e", PARENT_OWNER="", PARENT_TABLE="Customer_Credit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R72", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerNumber = deleted.Customer_Number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer_Credit because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer_Credit rents under Movie_Rental_Record on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer_Credit"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.CustomerNumber = deleted.Customer_Number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer_Credit because Movie_Rental_Record exists.'
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


CREATE TRIGGER tU_Customer_Credit ON Customer_Credit FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Customer_Credit */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomer_Number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer_Credit makes Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00028640", PARENT_OWNER="", PARENT_TABLE="Customer_Credit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R72", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Customer_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerNumber = deleted.Customer_Number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer_Credit because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer_Credit rents under Movie_Rental_Record on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer_Credit"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Customer_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.CustomerNumber = deleted.Customer_Number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer_Credit because Movie_Rental_Record exists.'
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
    /* ERWIN_RELATION:CHECKSUM="0005bcf3", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmployeeNumber = deleted.Employee_Number
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
    FK_CONSTRAINT="reports_to", FK_COLUMNS="Supervisor" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.Supervisor = deleted.Employee_Number
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
    FK_CONSTRAINT="completes", FK_COLUMNS="SocSecNumber""EmployeePhone" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.EmployeePhone = deleted.Employee_Phone AND
        Movie_Rental_Record.SocSecNumber = deleted.Soc_Sec_Number
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
    FK_CONSTRAINT="reports_to", FK_COLUMNS="Supervisor" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.Supervisor = Employee.Employee_Number AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,Employee," = "," AND") */
            Employee.Supervisor = Employee.Employee_Number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Store employs is Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,Store
      WHERE
        /* %JoinFKPK(deleted,Store," = "," AND") */
        deleted.StoreNumber = Store.Store_Number AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,Store," = "," AND") */
            Employee.StoreNumber = Store.Store_Number
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
           @insEmployee_Number varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee receives Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006ac32", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Employee_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmployeeNumber = deleted.Employee_Number
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
    FK_CONSTRAINT="reports_to", FK_COLUMNS="Supervisor" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Employee_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.Supervisor = deleted.Employee_Number
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
    FK_CONSTRAINT="completes", FK_COLUMNS="SocSecNumber""EmployeePhone" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Employee_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.EmployeePhone = deleted.Employee_Phone AND
        Movie_Rental_Record.SocSecNumber = deleted.Soc_Sec_Number
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
    FK_CONSTRAINT="reports_to", FK_COLUMNS="Supervisor" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Supervisor)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.Supervisor = Employee.Employee_Number
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
  /* Store employs is Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Store
        WHERE
          /* %JoinFKPK(inserted,Store) */
          inserted.StoreNumber = Store.Store_Number
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




CREATE TRIGGER tD_Movie ON Movie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie rents Movie_Store on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000222b0", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie_Store"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Store
      WHERE
        /*  %JoinFKPK(Movie_Store,deleted," = "," AND") */
        Movie_Store.MovieNumber = deleted.Movie_Number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because Movie_Store exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is rented as Movie_Copy on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie_Copy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Copy
      WHERE
        /*  %JoinFKPK(Movie_Copy,deleted," = "," AND") */
        Movie_Copy.MovieNumber = deleted.Movie_Number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because Movie_Copy exists.'
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
           @insMovie_Number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie rents Movie_Store on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000252ff", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie_Store"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Movie_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Store
      WHERE
        /*  %JoinFKPK(Movie_Store,deleted," = "," AND") */
        Movie_Store.MovieNumber = deleted.Movie_Number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because Movie_Store exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is rented as Movie_Copy on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie_Copy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Movie_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Copy
      WHERE
        /*  %JoinFKPK(Movie_Copy,deleted," = "," AND") */
        Movie_Copy.MovieNumber = deleted.Movie_Number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because Movie_Copy exists.'
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




CREATE TRIGGER tD_Movie_Copy ON Movie_Copy FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie_Copy */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie_Copy is rented under Movie_Rental_Record on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002abd3", PARENT_OWNER="", PARENT_TABLE="Movie_Copy"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.MovieCopyNumber = deleted.Movie_Copy_Number AND
        Movie_Rental_Record.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie_Copy because Movie_Rental_Record exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is rented as Movie_Copy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie_Copy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.Movie_Number AND
        NOT EXISTS (
          SELECT * FROM Movie_Copy
          WHERE
            /* %JoinFKPK(Movie_Copy,Movie," = "," AND") */
            Movie_Copy.MovieNumber = Movie.Movie_Number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Copy because Movie exists.'
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


CREATE TRIGGER tU_Movie_Copy ON Movie_Copy FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Movie_Copy */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovie_Copy_Number integer, 
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie_Copy is rented under Movie_Rental_Record on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00030629", PARENT_OWNER="", PARENT_TABLE="Movie_Copy"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Movie_Copy_Number) OR
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.MovieCopyNumber = deleted.Movie_Copy_Number AND
        Movie_Rental_Record.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie_Copy because Movie_Rental_Record exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is rented as Movie_Copy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie_Copy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.Movie_Number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Copy because Movie does not exist.'
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
    /* Payment is made on Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0007e8d4", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionNumber = Payment.Payment_Transaction_Number AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,Payment," = "," AND") */
            Movie_Rental_Record.PaymentTransactionNumber = Payment.Payment_Transaction_Number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer_Credit rents under Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer_Credit"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer_Credit
      WHERE
        /* %JoinFKPK(deleted,Customer_Credit," = "," AND") */
        deleted.CustomerNumber = Customer_Credit.Customer_Number AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,Customer_Credit," = "," AND") */
            Movie_Rental_Record.CustomerNumber = Customer_Credit.Customer_Number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because Customer_Credit exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer rents under Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerNumber = Customer.Customer_Number AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,Customer," = "," AND") */
            Movie_Rental_Record.CustomerNumber = Customer.Customer_Number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie_Copy is rented under Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie_Copy"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie_Copy
      WHERE
        /* %JoinFKPK(deleted,Movie_Copy," = "," AND") */
        deleted.MovieCopyNumber = Movie_Copy.Movie_Copy_Number AND
        deleted.MovieNumber = Movie_Copy.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,Movie_Copy," = "," AND") */
            Movie_Rental_Record.MovieCopyNumber = Movie_Copy.Movie_Copy_Number AND
            Movie_Rental_Record.MovieNumber = Movie_Copy.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Rental_Record because Movie_Copy exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee completes Movie_Rental_Record on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="SocSecNumber""EmployeePhone" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeePhone = Employee.Employee_Phone AND
        deleted.SocSecNumber = Employee.Soc_Sec_Number AND
        NOT EXISTS (
          SELECT * FROM Movie_Rental_Record
          WHERE
            /* %JoinFKPK(Movie_Rental_Record,Employee," = "," AND") */
            Movie_Rental_Record.EmployeePhone = Employee.Employee_Phone AND
            Movie_Rental_Record.SocSecNumber = Employee.Soc_Sec_Number
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
           @insEmployeePhone phone, 
           @insSocSecNumber integer, 
           @insRental_Record_Date datetime, 
           @insMovieCopyNumber integer, 
           @insMovieNumber integer, 
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment is made on Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0008092a", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionNumber = Payment.Payment_Transaction_Number
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
  /* Customer_Credit rents under Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer_Credit"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer_Credit
        WHERE
          /* %JoinFKPK(inserted,Customer_Credit) */
          inserted.CustomerNumber = Customer_Credit.Customer_Number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Rental_Record because Customer_Credit does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer rents under Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerNumber = Customer.Customer_Number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Rental_Record because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie_Copy is rented under Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie_Copy"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieCopyNumber) OR
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie_Copy
        WHERE
          /* %JoinFKPK(inserted,Movie_Copy) */
          inserted.MovieCopyNumber = Movie_Copy.Movie_Copy_Number and
          inserted.MovieNumber = Movie_Copy.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Rental_Record because Movie_Copy does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee completes Movie_Rental_Record on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="SocSecNumber""EmployeePhone" */
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
          inserted.EmployeePhone = Employee.Employee_Phone and
          inserted.SocSecNumber = Employee.Soc_Sec_Number
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




CREATE TRIGGER tD_Movie_Store ON Movie_Store FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie_Store */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Store is in Movie_Store on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000277ee", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Movie_Store"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="isin", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,Store
      WHERE
        /* %JoinFKPK(deleted,Store," = "," AND") */
        deleted.StoreNumber = Store.Store_Number AND
        NOT EXISTS (
          SELECT * FROM Movie_Store
          WHERE
            /* %JoinFKPK(Movie_Store,Store," = "," AND") */
            Movie_Store.StoreNumber = Store.Store_Number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Store because Store exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie rents Movie_Store on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie_Store"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.Movie_Number AND
        NOT EXISTS (
          SELECT * FROM Movie_Store
          WHERE
            /* %JoinFKPK(Movie_Store,Movie," = "," AND") */
            Movie_Store.MovieNumber = Movie.Movie_Number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie_Store because Movie exists.'
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


CREATE TRIGGER tU_Movie_Store ON Movie_Store FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Movie_Store */
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
  /* Store is in Movie_Store on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002bfac", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Movie_Store"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="isin", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Store
        WHERE
          /* %JoinFKPK(inserted,Store) */
          inserted.StoreNumber = Store.Store_Number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Store because Store does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie rents Movie_Store on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie_Store"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.Movie_Number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie_Store because Movie does not exist.'
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
    /* Payment is made on Movie_Rental_Record on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000529da", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.PaymentTransactionNumber = deleted.Payment_Transaction_Number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because Movie_Rental_Record exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer_Credit makes Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer_Credit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R72", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer_Credit
      WHERE
        /* %JoinFKPK(deleted,Customer_Credit," = "," AND") */
        deleted.CustomerNumber = Customer_Credit.Customer_Number AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Customer_Credit," = "," AND") */
            Payment.CustomerNumber = Customer_Credit.Customer_Number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Customer_Credit exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer makes Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R71", FK_COLUMNS="Customer_No" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.Customer_No = Customer.Customer_Number AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Customer," = "," AND") */
            Payment.Customer_No = Customer.Customer_Number
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
    FK_CONSTRAINT="receives", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeNumber = Employee.Employee_Number AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Employee," = "," AND") */
            Payment.EmployeeNumber = Employee.Employee_Number
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
           @insPayment_Transaction_Number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment is made on Movie_Rental_Record on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005fb60", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Movie_Rental_Record"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Payment_Transaction_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Rental_Record
      WHERE
        /*  %JoinFKPK(Movie_Rental_Record,deleted," = "," AND") */
        Movie_Rental_Record.PaymentTransactionNumber = deleted.Payment_Transaction_Number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because Movie_Rental_Record exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer_Credit makes Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer_Credit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R72", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer_Credit
        WHERE
          /* %JoinFKPK(inserted,Customer_Credit) */
          inserted.CustomerNumber = Customer_Credit.Customer_Number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Customer_Credit does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer makes Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R71", FK_COLUMNS="Customer_No" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Customer_No)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.Customer_No = Customer.Customer_Number
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
    FK_CONSTRAINT="receives", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeNumber = Employee.Employee_Number
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




CREATE TRIGGER tD_Store ON Store FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Store */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Store is in Movie_Store on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000201b7", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Movie_Store"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="isin", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Movie_Store
      WHERE
        /*  %JoinFKPK(Movie_Store,deleted," = "," AND") */
        Movie_Store.StoreNumber = deleted.Store_Number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Store because Movie_Store exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Store employs is Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.StoreNumber = deleted.Store_Number
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
           @insStore_Number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Store is in Movie_Store on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000249f0", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Movie_Store"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="isin", FK_COLUMNS="StoreNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Store_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie_Store
      WHERE
        /*  %JoinFKPK(Movie_Store,deleted," = "," AND") */
        Movie_Store.StoreNumber = deleted.Store_Number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Store because Movie_Store exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Store employs is Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="StoreNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Store_Number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.StoreNumber = deleted.Store_Number
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


