
CREATE TABLE [Check]
( 
	[BankAccountID]      varchar(20)  NOT NULL ,
	[BankAccountNumber]  integer  NULL ,
	[CheckNumber]        integer  NULL ,
	[RoutingNumber]      integer  NULL ,
	[PaymentTransactionID] integer  NOT NULL ,
	[CustomerID]         integer  NOT NULL ,
	[SubscriberID]       integer  NOT NULL 
)
go

CREATE TABLE [CreditCard]
( 
	[CreditCardID]       integer  NOT NULL ,
	[CreditCardNumber]   integer  NULL ,
	[CreditCardExpirationDate] datetime  NULL ,
	[CreditCardCVV]      numeric()  NULL ,
	[PaymentTransactionID] integer  NOT NULL ,
	[CustomerID]         integer  NOT NULL ,
	[SubscriberID]       integer  NOT NULL 
)
go

CREATE TABLE [Customer]
( 
	[CustomerID]         integer  NOT NULL ,
	[CustomerFirstName]  char(18)  NULL ,
	[CustomerLastName]   char(18)  NULL ,
	[CustomerDateOfBirth] datetime  NULL ,
	[CustomerAddress]    varchar(20)  NULL ,
	[CustomerCity]       char(18)  NULL ,
	[CustomerZipCode]    integer  NULL ,
	[CustomerEmail]      varchar(20)  NULL ,
	[CustomerGender]     char  NULL ,
	[SubscriberID]       integer  NOT NULL 
)
go

CREATE TABLE [CustomerSupport]
( 
	[CustoemrSupportID]  integer  NOT NULL ,
	[CustomerSupportType] varchar(20)  NULL ,
	[CustomerSupportIssues] varchar(20)  NULL ,
	[Resolved]           bit  NULL ,
	[EmployeeID]         integer  NOT NULL ,
	[ServerID]           integer  NOT NULL ,
	[RegionID]           integer  NOT NULL ,
	[CustomerID]         integer  NOT NULL ,
	[SubscriberID]       integer  NOT NULL 
)
go

CREATE TABLE [Employee]
( 
	[EmployeeID]         integer  NOT NULL ,
	[EmployeeFirstName]  varchar(20)  NULL ,
	[EmployeeLastName]   varchar(20)  NULL ,
	[EmployeeAddress]    varchar(20)  NULL ,
	[EmployeeCity]       varchar(20)  NULL ,
	[EmployeeZipCode]    integer  NULL ,
	[EmployeeEmail]      varchar(20)  NULL ,
	[EmployeeSSN]        varchar(20)  NULL ,
	[EmployeeHireDate]   datetime  NULL ,
	[EmployeeSuperVisor] varchar(20)  NULL 
)
go

CREATE TABLE [Epay]
( 
	[EpayID]             integer  NOT NULL ,
	[EpayVendorID]       integer  NULL ,
	[PaymentTransactionID] integer  NOT NULL ,
	[CustomerID]         integer  NOT NULL ,
	[SubscriberID]       integer  NOT NULL 
)
go

CREATE TABLE [EpayType]
( 
	[EpayID]             integer  NOT NULL ,
	[PaymentTransactionID] integer  NOT NULL ,
	[CustomerID]         integer  NOT NULL ,
	[SubscriberID]       integer  NOT NULL ,
	[ZelleID]            integer  NULL ,
	[PaypalID]           integer  NULL ,
	[ApplePayID]         integer  NULL ,
	[GooglePayID]        integer  NULL 
)
go

CREATE TABLE [Movie]
( 
	[MovieID]            integer  NOT NULL ,
	[MovieName]          varchar(20)  NULL ,
	[MovieReleaseDate]   datetime  NULL ,
	[MovieDirector]      varchar(20)  NULL ,
	[MovieRating]        numeric  NULL ,
	[MovieLength]        float  NULL ,
	[MovieSubtitle]      text()  NULL ,
	[MovieCountry]       char()  NULL ,
	[MovieDescription]   varchar(20)  NULL ,
	[MovieStar1]         varchar(20)  NULL ,
	[MovieStar2]         varchar(20)  NULL ,
	[Genre]              char(18)  NULL ,
	[ServerID]           integer  NOT NULL ,
	[RegionID]           integer  NOT NULL ,
	[StreamingID]        integer  NOT NULL ,
	[CustomerID]         integer  NOT NULL ,
	[SubscriberID]       integer  NOT NULL 
)
go

CREATE TABLE [MovieGenre]
( 
	[MovieGenreID]       integer  NOT NULL ,
	[MovieGenre]         char(18)  NULL ,
	[MovieID]            integer  NOT NULL ,
	[ServerID]           integer  NOT NULL ,
	[RegionID]           integer  NOT NULL ,
	[StreamingID]        integer  NOT NULL ,
	[CustomerID]         integer  NOT NULL ,
	[SubscriberID]       integer  NOT NULL 
)
go

CREATE TABLE [Payment]
( 
	[PaymentTransactionID] integer  NOT NULL ,
	[PaymentType]        integer  NULL ,
	[PaymentAmount]      float  NULL ,
	[PaymentDate]        datetime  NULL ,
	[CustomerID]         integer  NOT NULL ,
	[SubscriberID]       integer  NOT NULL 
)
go

CREATE TABLE [PayrollID]
( 
	[EmployeeCheckingAccount] integer  NULL ,
	[EmployeeSalary]     float  NULL ,
	[PayrollID]          integer  NOT NULL ,
	[EmployeeID]         integer  NOT NULL ,
	[ServerID]           integer  NOT NULL ,
	[RegionID]           integer  NOT NULL 
)
go

CREATE TABLE [Region]
( 
	[RegionID]           integer  NOT NULL ,
	[RegionName]         varchar(18)  NULL 
)
go

CREATE TABLE [ServerLocation]
( 
	[ServerID]           integer  NOT NULL ,
	[RegionID]           integer  NOT NULL 
)
go

CREATE TABLE [StreamingPlan]
( 
	[StreamingID]        integer  NOT NULL ,
	[StreamingPlanName]  varchar(20)  NULL ,
	[StreamingPlanRate]  varchar(20)  NULL ,
	[StreamingPlanLimit] integer  NULL ,
	[ServerID]           integer  NOT NULL ,
	[RegionID]           integer  NOT NULL 
)
go

CREATE TABLE [Subscriber]
( 
	[SubscriberID]       integer  NOT NULL ,
	[LoginName]          char(18)  NULL ,
	[LoginPassword]      varchar(20)  NULL 
)
go

CREATE TABLE [SubscriptionType]
( 
	[SubscriptionID]     integer  NOT NULL ,
	[TotalCost]          float  NULL ,
	[Period]             datetime  NULL ,
	[StreamingID]        integer  NOT NULL ,
	[ServerID]           integer  NOT NULL ,
	[RegionID]           integer  NOT NULL ,
	[SubscriberID]       integer  NOT NULL 
)
go

ALTER TABLE [Check]
	ADD CONSTRAINT [XPKCheck] PRIMARY KEY  CLUSTERED ([BankAccountID] ASC,[PaymentTransactionID] ASC,[CustomerID] ASC,[SubscriberID] ASC)
go

ALTER TABLE [CreditCard]
	ADD CONSTRAINT [XPKCreditCard] PRIMARY KEY  CLUSTERED ([CreditCardID] ASC,[PaymentTransactionID] ASC,[CustomerID] ASC,[SubscriberID] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustomerID] ASC,[SubscriberID] ASC)
go

ALTER TABLE [CustomerSupport]
	ADD CONSTRAINT [XPKCustomerSupport] PRIMARY KEY  CLUSTERED ([CustoemrSupportID] ASC,[EmployeeID] ASC,[ServerID] ASC,[RegionID] ASC,[CustomerID] ASC,[SubscriberID] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([EmployeeID] ASC)
go

ALTER TABLE [Epay]
	ADD CONSTRAINT [XPKEpay] PRIMARY KEY  CLUSTERED ([EpayID] ASC,[PaymentTransactionID] ASC,[CustomerID] ASC,[SubscriberID] ASC)
go

ALTER TABLE [EpayType]
	ADD CONSTRAINT [XPKEpayType] PRIMARY KEY  CLUSTERED ([EpayID] ASC,[PaymentTransactionID] ASC,[CustomerID] ASC,[SubscriberID] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieID] ASC,[ServerID] ASC,[RegionID] ASC,[StreamingID] ASC,[CustomerID] ASC,[SubscriberID] ASC)
go

ALTER TABLE [MovieGenre]
	ADD CONSTRAINT [XPKMovieGenre] PRIMARY KEY  CLUSTERED ([MovieGenreID] ASC,[MovieID] ASC,[ServerID] ASC,[RegionID] ASC,[StreamingID] ASC,[CustomerID] ASC,[SubscriberID] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionID] ASC,[CustomerID] ASC,[SubscriberID] ASC)
go

ALTER TABLE [PayrollID]
	ADD CONSTRAINT [XPKPayrollID] PRIMARY KEY  CLUSTERED ([PayrollID] ASC,[EmployeeID] ASC,[ServerID] ASC,[RegionID] ASC)
go

ALTER TABLE [Region]
	ADD CONSTRAINT [XPKRegion] PRIMARY KEY  CLUSTERED ([RegionID] ASC)
go

ALTER TABLE [ServerLocation]
	ADD CONSTRAINT [XPKServerLocation] PRIMARY KEY  CLUSTERED ([ServerID] ASC,[RegionID] ASC)
go

ALTER TABLE [StreamingPlan]
	ADD CONSTRAINT [XPKStreamingPlan] PRIMARY KEY  CLUSTERED ([StreamingID] ASC,[ServerID] ASC,[RegionID] ASC)
go

ALTER TABLE [Subscriber]
	ADD CONSTRAINT [XPKSubscriber] PRIMARY KEY  CLUSTERED ([SubscriberID] ASC)
go

ALTER TABLE [SubscriptionType]
	ADD CONSTRAINT [XPKSubscriptionType] PRIMARY KEY  CLUSTERED ([SubscriptionID] ASC,[StreamingID] ASC,[ServerID] ASC,[RegionID] ASC,[SubscriberID] ASC)
go


ALTER TABLE [Check]
	ADD CONSTRAINT [FK_Payment_Check] FOREIGN KEY ([PaymentTransactionID],[CustomerID],[SubscriberID]) REFERENCES [Payment]([PaymentTransactionID],[CustomerID],[SubscriberID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CreditCard]
	ADD CONSTRAINT [FK_Payment_CreditCard] FOREIGN KEY ([PaymentTransactionID],[CustomerID],[SubscriberID]) REFERENCES [Payment]([PaymentTransactionID],[CustomerID],[SubscriberID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Customer]
	ADD CONSTRAINT [FK_Subscriber_Customer] FOREIGN KEY ([SubscriberID]) REFERENCES [Subscriber]([SubscriberID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CustomerSupport]
	ADD CONSTRAINT [FK_Employee_CustomerSupport] FOREIGN KEY ([EmployeeID]) REFERENCES [Employee]([EmployeeID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CustomerSupport]
	ADD CONSTRAINT [FK_Customer_CustomerSupport] FOREIGN KEY ([CustomerID],[SubscriberID]) REFERENCES [Customer]([CustomerID],[SubscriberID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Employee]
	ADD CONSTRAINT [FK_ServerLocation_Employee] FOREIGN KEY ([ServerID],[RegionID]) REFERENCES [ServerLocation]([ServerID],[RegionID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Epay]
	ADD CONSTRAINT [FK_Payment_Epay] FOREIGN KEY ([PaymentTransactionID],[CustomerID],[SubscriberID]) REFERENCES [Payment]([PaymentTransactionID],[CustomerID],[SubscriberID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EpayType]
	ADD CONSTRAINT [FK_Epay_EpayType] FOREIGN KEY ([EpayID],[PaymentTransactionID],[CustomerID],[SubscriberID]) REFERENCES [Epay]([EpayID],[PaymentTransactionID],[CustomerID],[SubscriberID])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Movie]
	ADD CONSTRAINT [FK_ServerLocation_Movie] FOREIGN KEY ([ServerID],[RegionID]) REFERENCES [ServerLocation]([ServerID],[RegionID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [FK_StreamingPlan_Movie] FOREIGN KEY ([StreamingID],[ServerID],[RegionID]) REFERENCES [StreamingPlan]([StreamingID],[ServerID],[RegionID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [FK_Customer_Movie] FOREIGN KEY ([CustomerID],[SubscriberID]) REFERENCES [Customer]([CustomerID],[SubscriberID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieGenre]
	ADD CONSTRAINT [FK_Movie_MovieGenre] FOREIGN KEY ([MovieID],[ServerID],[RegionID],[StreamingID],[CustomerID],[SubscriberID]) REFERENCES [Movie]([MovieID],[ServerID],[RegionID],[StreamingID],[CustomerID],[SubscriberID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Customer_Payment] FOREIGN KEY ([CustomerID],[SubscriberID]) REFERENCES [Customer]([CustomerID],[SubscriberID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [PayrollID]
	ADD CONSTRAINT [FK_Employee_PayrollID] FOREIGN KEY ([EmployeeID]) REFERENCES [Employee]([EmployeeID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ServerLocation]
	ADD CONSTRAINT [FK_Region_ServerLocation] FOREIGN KEY ([RegionID]) REFERENCES [Region]([RegionID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [StreamingPlan]
	ADD CONSTRAINT [FK_ServerLocation_StreamingPlan] FOREIGN KEY ([ServerID],[RegionID]) REFERENCES [ServerLocation]([ServerID],[RegionID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [SubscriptionType]
	ADD CONSTRAINT [FK_StreamingPlan_SubscriptionType] FOREIGN KEY ([StreamingID],[ServerID],[RegionID]) REFERENCES [StreamingPlan]([StreamingID],[ServerID],[RegionID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [SubscriptionType]
	ADD CONSTRAINT [FK_Subscriber_SubscriptionType] FOREIGN KEY ([SubscriberID]) REFERENCES [Subscriber]([SubscriberID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_Check ON Check FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Check */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment  Check on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001bc0f", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionID = Payment.PaymentTransactionID AND
        deleted.CustomerID = Payment.CustomerID AND
        deleted.SubscriberID = Payment.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM Check
          WHERE
            /* %JoinFKPK(Check,Payment," = "," AND") */
            Check.PaymentTransactionID = Payment.PaymentTransactionID AND
            Check.CustomerID = Payment.CustomerID AND
            Check.SubscriberID = Payment.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Check because Payment exists.'
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


CREATE TRIGGER tU_Check ON Check FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Check */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBankAccountID varchar(20), 
           @insPaymentTransactionID integer, 
           @insCustomerID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  Check on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001c6b4", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionID = Payment.PaymentTransactionID and
          inserted.CustomerID = Payment.CustomerID and
          inserted.SubscriberID = Payment.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Check because Payment does not exist.'
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




CREATE TRIGGER tD_CreditCard ON CreditCard FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CreditCard */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment  CreditCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001da32", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CreditCard", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionID = Payment.PaymentTransactionID AND
        deleted.CustomerID = Payment.CustomerID AND
        deleted.SubscriberID = Payment.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM CreditCard
          WHERE
            /* %JoinFKPK(CreditCard,Payment," = "," AND") */
            CreditCard.PaymentTransactionID = Payment.PaymentTransactionID AND
            CreditCard.CustomerID = Payment.CustomerID AND
            CreditCard.SubscriberID = Payment.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CreditCard because Payment exists.'
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


CREATE TRIGGER tU_CreditCard ON CreditCard FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CreditCard */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCreditCardID integer, 
           @insPaymentTransactionID integer, 
           @insCustomerID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  CreditCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001d476", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CreditCard", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionID = Payment.PaymentTransactionID and
          inserted.CustomerID = Payment.CustomerID and
          inserted.SubscriberID = Payment.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CreditCard because Payment does not exist.'
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




CREATE TRIGGER tD_Customer ON Customer FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Customer */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer  CustomerSupport on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004a803", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerSupport", FK_COLUMNS="CustomerID""SubscriberID" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.CustomerID = deleted.CustomerID AND
        CustomerSupport.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because CustomerSupport exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Payment", FK_COLUMNS="CustomerID""SubscriberID" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerID = deleted.CustomerID AND
        Payment.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Movie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Movie", FK_COLUMNS="CustomerID""SubscriberID" */
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.CustomerID = deleted.CustomerID AND
        Movie.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Subscriber  Customer on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Subscriber"
    CHILD_OWNER="", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscriber_Customer", FK_COLUMNS="SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Subscriber
      WHERE
        /* %JoinFKPK(deleted,Subscriber," = "," AND") */
        deleted.SubscriberID = Subscriber.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM Customer
          WHERE
            /* %JoinFKPK(Customer,Subscriber," = "," AND") */
            Customer.SubscriberID = Subscriber.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Customer because Subscriber exists.'
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
           @insCustomerID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer  CustomerSupport on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005289d", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerSupport", FK_COLUMNS="CustomerID""SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.CustomerID = deleted.CustomerID AND
        CustomerSupport.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because CustomerSupport exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Payment", FK_COLUMNS="CustomerID""SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerID = deleted.CustomerID AND
        Payment.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Movie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Movie", FK_COLUMNS="CustomerID""SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.CustomerID = deleted.CustomerID AND
        Movie.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Movie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Subscriber  Customer on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Subscriber"
    CHILD_OWNER="", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscriber_Customer", FK_COLUMNS="SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Subscriber
        WHERE
          /* %JoinFKPK(inserted,Subscriber) */
          inserted.SubscriberID = Subscriber.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Customer because Subscriber does not exist.'
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




CREATE TRIGGER tD_CustomerSupport ON CustomerSupport FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerSupport */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer  CustomerSupport on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00033d6d", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerSupport", FK_COLUMNS="CustomerID""SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerID = Customer.CustomerID AND
        deleted.SubscriberID = Customer.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM CustomerSupport
          WHERE
            /* %JoinFKPK(CustomerSupport,Customer," = "," AND") */
            CustomerSupport.CustomerID = Customer.CustomerID AND
            CustomerSupport.SubscriberID = Customer.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerSupport because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee  CustomerSupport on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerSupport", FK_COLUMNS="EmployeeID""ServerID""RegionID" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeID = Employee.EmployeeID AND
        deleted.ServerID = Employee.ServerID AND
        deleted.RegionID = Employee.RegionID AND
        NOT EXISTS (
          SELECT * FROM CustomerSupport
          WHERE
            /* %JoinFKPK(CustomerSupport,Employee," = "," AND") */
            CustomerSupport.EmployeeID = Employee.EmployeeID AND
            CustomerSupport.ServerID = Employee.ServerID AND
            CustomerSupport.RegionID = Employee.RegionID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerSupport because Employee exists.'
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


CREATE TRIGGER tU_CustomerSupport ON CustomerSupport FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerSupport */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustoemrSupportID integer, 
           @insEmployeeID integer, 
           @insServerID integer, 
           @insRegionID integer, 
           @insCustomerID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer  CustomerSupport on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00034108", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerSupport", FK_COLUMNS="CustomerID""SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerID = Customer.CustomerID and
          inserted.SubscriberID = Customer.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerSupport because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee  CustomerSupport on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerSupport", FK_COLUMNS="EmployeeID""ServerID""RegionID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeID = Employee.EmployeeID and
          inserted.ServerID = Employee.ServerID and
          inserted.RegionID = Employee.RegionID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerSupport because Employee does not exist.'
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
    /* Employee  CustomerSupport on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00040054", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerSupport", FK_COLUMNS="EmployeeID""ServerID""RegionID" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.EmployeeID = deleted.EmployeeID AND
        CustomerSupport.ServerID = deleted.ServerID AND
        CustomerSupport.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because CustomerSupport exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee  PayrollID on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="PayrollID"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_PayrollID", FK_COLUMNS="EmployeeID""ServerID""RegionID" */
    IF EXISTS (
      SELECT * FROM deleted,PayrollID
      WHERE
        /*  %JoinFKPK(PayrollID,deleted," = "," AND") */
        PayrollID.EmployeeID = deleted.EmployeeID AND
        PayrollID.ServerID = deleted.ServerID AND
        PayrollID.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because PayrollID exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* ServerLocation  Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_Employee", FK_COLUMNS="ServerID""RegionID" */
    IF EXISTS (SELECT * FROM deleted,ServerLocation
      WHERE
        /* %JoinFKPK(deleted,ServerLocation," = "," AND") */
        deleted.ServerID = ServerLocation.ServerID AND
        deleted.RegionID = ServerLocation.RegionID AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,ServerLocation," = "," AND") */
            Employee.ServerID = ServerLocation.ServerID AND
            Employee.RegionID = ServerLocation.RegionID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because ServerLocation exists.'
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
           @insEmployeeID integer, 
           @insServerID integer, 
           @insRegionID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee  CustomerSupport on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00047842", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerSupport", FK_COLUMNS="EmployeeID""ServerID""RegionID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.EmployeeID = deleted.EmployeeID AND
        CustomerSupport.ServerID = deleted.ServerID AND
        CustomerSupport.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because CustomerSupport exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee  PayrollID on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="PayrollID"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_PayrollID", FK_COLUMNS="EmployeeID""ServerID""RegionID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PayrollID
      WHERE
        /*  %JoinFKPK(PayrollID,deleted," = "," AND") */
        PayrollID.EmployeeID = deleted.EmployeeID AND
        PayrollID.ServerID = deleted.ServerID AND
        PayrollID.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because PayrollID exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ServerLocation  Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_Employee", FK_COLUMNS="ServerID""RegionID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ServerLocation
        WHERE
          /* %JoinFKPK(inserted,ServerLocation) */
          inserted.ServerID = ServerLocation.ServerID and
          inserted.RegionID = ServerLocation.RegionID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Employee because ServerLocation does not exist.'
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
    /* Epay  EpayType on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0002d20b", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Epay_EpayType", FK_COLUMNS="EpayID""PaymentTransactionID""CustomerID""SubscriberID" */
    DELETE EpayType
      FROM EpayType,deleted
      WHERE
        /*  %JoinFKPK(EpayType,deleted," = "," AND") */
        EpayType.EpayID = deleted.EpayID AND
        EpayType.PaymentTransactionID = deleted.PaymentTransactionID AND
        EpayType.CustomerID = deleted.CustomerID AND
        EpayType.SubscriberID = deleted.SubscriberID

    /* erwin Builtin Trigger */
    /* Payment  Epay on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Epay"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionID = Payment.PaymentTransactionID AND
        deleted.CustomerID = Payment.CustomerID AND
        deleted.SubscriberID = Payment.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM Epay
          WHERE
            /* %JoinFKPK(Epay,Payment," = "," AND") */
            Epay.PaymentTransactionID = Payment.PaymentTransactionID AND
            Epay.CustomerID = Payment.CustomerID AND
            Epay.SubscriberID = Payment.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Epay because Payment exists.'
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
           @insEpayID integer, 
           @insPaymentTransactionID integer, 
           @insCustomerID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Epay  EpayType on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00041209", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Epay_EpayType", FK_COLUMNS="EpayID""PaymentTransactionID""CustomerID""SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EpayID) OR
    UPDATE(PaymentTransactionID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insEpayID = inserted.EpayID, 
             @insPaymentTransactionID = inserted.PaymentTransactionID, 
             @insCustomerID = inserted.CustomerID, 
             @insSubscriberID = inserted.SubscriberID
        FROM inserted
      UPDATE EpayType
      SET
        /*  %JoinFKPK(EpayType,@ins," = ",",") */
        EpayType.EpayID = @insEpayID,
        EpayType.PaymentTransactionID = @insPaymentTransactionID,
        EpayType.CustomerID = @insCustomerID,
        EpayType.SubscriberID = @insSubscriberID
      FROM EpayType,inserted,deleted
      WHERE
        /*  %JoinFKPK(EpayType,deleted," = "," AND") */
        EpayType.EpayID = deleted.EpayID AND
        EpayType.PaymentTransactionID = deleted.PaymentTransactionID AND
        EpayType.CustomerID = deleted.CustomerID AND
        EpayType.SubscriberID = deleted.SubscriberID
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Epay update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  Epay on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Epay"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionID = Payment.PaymentTransactionID and
          inserted.CustomerID = Payment.CustomerID and
          inserted.SubscriberID = Payment.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Epay because Payment does not exist.'
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




CREATE TRIGGER tD_EpayType ON EpayType FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EpayType */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Epay  EpayType on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001dace", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Epay_EpayType", FK_COLUMNS="EpayID""PaymentTransactionID""CustomerID""SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Epay
      WHERE
        /* %JoinFKPK(deleted,Epay," = "," AND") */
        deleted.EpayID = Epay.EpayID AND
        deleted.PaymentTransactionID = Epay.PaymentTransactionID AND
        deleted.CustomerID = Epay.CustomerID AND
        deleted.SubscriberID = Epay.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM EpayType
          WHERE
            /* %JoinFKPK(EpayType,Epay," = "," AND") */
            EpayType.EpayID = Epay.EpayID AND
            EpayType.PaymentTransactionID = Epay.PaymentTransactionID AND
            EpayType.CustomerID = Epay.CustomerID AND
            EpayType.SubscriberID = Epay.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EpayType because Epay exists.'
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


CREATE TRIGGER tU_EpayType ON EpayType FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EpayType */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEpayID integer, 
           @insPaymentTransactionID integer, 
           @insCustomerID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Epay  EpayType on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001de8f", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Epay_EpayType", FK_COLUMNS="EpayID""PaymentTransactionID""CustomerID""SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EpayID) OR
    UPDATE(PaymentTransactionID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Epay
        WHERE
          /* %JoinFKPK(inserted,Epay) */
          inserted.EpayID = Epay.EpayID and
          inserted.PaymentTransactionID = Epay.PaymentTransactionID and
          inserted.CustomerID = Epay.CustomerID and
          inserted.SubscriberID = Epay.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EpayType because Epay does not exist.'
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
    /* Movie  MovieGenre on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005eb45", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieGenre"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieGenre", FK_COLUMNS="ServerID""RegionID""MovieID""StreamingID""CustomerID""SubscriberID" */
    IF EXISTS (
      SELECT * FROM deleted,MovieGenre
      WHERE
        /*  %JoinFKPK(MovieGenre,deleted," = "," AND") */
        MovieGenre.MovieID = deleted.MovieID AND
        MovieGenre.ServerID = deleted.ServerID AND
        MovieGenre.RegionID = deleted.RegionID AND
        MovieGenre.StreamingID = deleted.StreamingID AND
        MovieGenre.CustomerID = deleted.CustomerID AND
        MovieGenre.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieGenre exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Movie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Movie", FK_COLUMNS="CustomerID""SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerID = Customer.CustomerID AND
        deleted.SubscriberID = Customer.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM Movie
          WHERE
            /* %JoinFKPK(Movie,Customer," = "," AND") */
            Movie.CustomerID = Customer.CustomerID AND
            Movie.SubscriberID = Customer.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingPlan  Movie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_StreamingPlan_Movie", FK_COLUMNS="StreamingID""ServerID""RegionID" */
    IF EXISTS (SELECT * FROM deleted,StreamingPlan
      WHERE
        /* %JoinFKPK(deleted,StreamingPlan," = "," AND") */
        deleted.StreamingID = StreamingPlan.StreamingID AND
        deleted.ServerID = StreamingPlan.ServerID AND
        deleted.RegionID = StreamingPlan.RegionID AND
        NOT EXISTS (
          SELECT * FROM Movie
          WHERE
            /* %JoinFKPK(Movie,StreamingPlan," = "," AND") */
            Movie.StreamingID = StreamingPlan.StreamingID AND
            Movie.ServerID = StreamingPlan.ServerID AND
            Movie.RegionID = StreamingPlan.RegionID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie because StreamingPlan exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* ServerLocation  Movie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_Movie", FK_COLUMNS="ServerID""RegionID" */
    IF EXISTS (SELECT * FROM deleted,ServerLocation
      WHERE
        /* %JoinFKPK(deleted,ServerLocation," = "," AND") */
        deleted.ServerID = ServerLocation.ServerID AND
        deleted.RegionID = ServerLocation.RegionID AND
        NOT EXISTS (
          SELECT * FROM Movie
          WHERE
            /* %JoinFKPK(Movie,ServerLocation," = "," AND") */
            Movie.ServerID = ServerLocation.ServerID AND
            Movie.RegionID = ServerLocation.RegionID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie because ServerLocation exists.'
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
           @insMovieID integer, 
           @insServerID integer, 
           @insRegionID integer, 
           @insStreamingID integer, 
           @insCustomerID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  MovieGenre on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00069568", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieGenre"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieGenre", FK_COLUMNS="RegionID""ServerID""MovieID""StreamingID""CustomerID""SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID) OR
    UPDATE(StreamingID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieGenre
      WHERE
        /*  %JoinFKPK(MovieGenre,deleted," = "," AND") */
        MovieGenre.MovieID = deleted.MovieID AND
        MovieGenre.ServerID = deleted.ServerID AND
        MovieGenre.RegionID = deleted.RegionID AND
        MovieGenre.StreamingID = deleted.StreamingID AND
        MovieGenre.CustomerID = deleted.CustomerID AND
        MovieGenre.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieGenre exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Movie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Movie", FK_COLUMNS="CustomerID""SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerID = Customer.CustomerID and
          inserted.SubscriberID = Customer.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingPlan  Movie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_StreamingPlan_Movie", FK_COLUMNS="StreamingID""ServerID""RegionID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StreamingID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,StreamingPlan
        WHERE
          /* %JoinFKPK(inserted,StreamingPlan) */
          inserted.StreamingID = StreamingPlan.StreamingID and
          inserted.ServerID = StreamingPlan.ServerID and
          inserted.RegionID = StreamingPlan.RegionID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie because StreamingPlan does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ServerLocation  Movie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_Movie", FK_COLUMNS="ServerID""RegionID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ServerLocation
        WHERE
          /* %JoinFKPK(inserted,ServerLocation) */
          inserted.ServerID = ServerLocation.ServerID and
          inserted.RegionID = ServerLocation.RegionID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie because ServerLocation does not exist.'
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




CREATE TRIGGER tD_MovieGenre ON MovieGenre FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieGenre */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  MovieGenre on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00022e7a", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieGenre"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieGenre", FK_COLUMNS="RegionID""ServerID""MovieID""StreamingID""CustomerID""SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieID = Movie.MovieID AND
        deleted.ServerID = Movie.ServerID AND
        deleted.RegionID = Movie.RegionID AND
        deleted.StreamingID = Movie.StreamingID AND
        deleted.CustomerID = Movie.CustomerID AND
        deleted.SubscriberID = Movie.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM MovieGenre
          WHERE
            /* %JoinFKPK(MovieGenre,Movie," = "," AND") */
            MovieGenre.MovieID = Movie.MovieID AND
            MovieGenre.ServerID = Movie.ServerID AND
            MovieGenre.RegionID = Movie.RegionID AND
            MovieGenre.StreamingID = Movie.StreamingID AND
            MovieGenre.CustomerID = Movie.CustomerID AND
            MovieGenre.SubscriberID = Movie.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieGenre because Movie exists.'
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


CREATE TRIGGER tU_MovieGenre ON MovieGenre FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieGenre */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieGenreID integer, 
           @insMovieID integer, 
           @insServerID integer, 
           @insRegionID integer, 
           @insStreamingID integer, 
           @insCustomerID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  MovieGenre on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00022635", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieGenre"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieGenre", FK_COLUMNS="ServerID""RegionID""MovieID""StreamingID""CustomerID""SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID) OR
    UPDATE(StreamingID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieID = Movie.MovieID and
          inserted.ServerID = Movie.ServerID and
          inserted.RegionID = Movie.RegionID and
          inserted.StreamingID = Movie.StreamingID and
          inserted.CustomerID = Movie.CustomerID and
          inserted.SubscriberID = Movie.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieGenre because Movie does not exist.'
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
    /* Payment  CreditCard on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00050fd6", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CreditCard", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
    IF EXISTS (
      SELECT * FROM deleted,CreditCard
      WHERE
        /*  %JoinFKPK(CreditCard,deleted," = "," AND") */
        CreditCard.PaymentTransactionID = deleted.PaymentTransactionID AND
        CreditCard.CustomerID = deleted.CustomerID AND
        CreditCard.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because CreditCard exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment  Epay on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Epay"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
    IF EXISTS (
      SELECT * FROM deleted,Epay
      WHERE
        /*  %JoinFKPK(Epay,deleted," = "," AND") */
        Epay.PaymentTransactionID = deleted.PaymentTransactionID AND
        Epay.CustomerID = deleted.CustomerID AND
        Epay.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because Epay exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment  Check on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
    IF EXISTS (
      SELECT * FROM deleted,Check
      WHERE
        /*  %JoinFKPK(Check,deleted," = "," AND") */
        Check.PaymentTransactionID = deleted.PaymentTransactionID AND
        Check.CustomerID = deleted.CustomerID AND
        Check.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because Check exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Payment", FK_COLUMNS="CustomerID""SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerID = Customer.CustomerID AND
        deleted.SubscriberID = Customer.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Customer," = "," AND") */
            Payment.CustomerID = Customer.CustomerID AND
            Payment.SubscriberID = Customer.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Customer exists.'
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
           @insPaymentTransactionID integer, 
           @insCustomerID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  CreditCard on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005bf1f", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CreditCard", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CreditCard
      WHERE
        /*  %JoinFKPK(CreditCard,deleted," = "," AND") */
        CreditCard.PaymentTransactionID = deleted.PaymentTransactionID AND
        CreditCard.CustomerID = deleted.CustomerID AND
        CreditCard.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because CreditCard exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  Epay on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Epay"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Epay
      WHERE
        /*  %JoinFKPK(Epay,deleted," = "," AND") */
        Epay.PaymentTransactionID = deleted.PaymentTransactionID AND
        Epay.CustomerID = deleted.CustomerID AND
        Epay.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because Epay exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  Check on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentTransactionID""CustomerID""SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionID) OR
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Check
      WHERE
        /*  %JoinFKPK(Check,deleted," = "," AND") */
        Check.PaymentTransactionID = deleted.PaymentTransactionID AND
        Check.CustomerID = deleted.CustomerID AND
        Check.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because Check exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Payment", FK_COLUMNS="CustomerID""SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerID) OR
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerID = Customer.CustomerID and
          inserted.SubscriberID = Customer.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Customer does not exist.'
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




CREATE TRIGGER tD_PayrollID ON PayrollID FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PayrollID */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Employee  PayrollID on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001a977", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="PayrollID"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_PayrollID", FK_COLUMNS="EmployeeID""ServerID""RegionID" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeID = Employee.EmployeeID AND
        deleted.ServerID = Employee.ServerID AND
        deleted.RegionID = Employee.RegionID AND
        NOT EXISTS (
          SELECT * FROM PayrollID
          WHERE
            /* %JoinFKPK(PayrollID,Employee," = "," AND") */
            PayrollID.EmployeeID = Employee.EmployeeID AND
            PayrollID.ServerID = Employee.ServerID AND
            PayrollID.RegionID = Employee.RegionID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PayrollID because Employee exists.'
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


CREATE TRIGGER tU_PayrollID ON PayrollID FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PayrollID */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPayrollID integer, 
           @insEmployeeID integer, 
           @insServerID integer, 
           @insRegionID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee  PayrollID on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001bf43", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="PayrollID"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_PayrollID", FK_COLUMNS="EmployeeID""ServerID""RegionID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeID = Employee.EmployeeID and
          inserted.ServerID = Employee.ServerID and
          inserted.RegionID = Employee.RegionID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PayrollID because Employee does not exist.'
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




CREATE TRIGGER tD_Region ON Region FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Region */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Region  ServerLocation on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011bb2", PARENT_OWNER="", PARENT_TABLE="Region"
    CHILD_OWNER="", CHILD_TABLE="ServerLocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Region_ServerLocation", FK_COLUMNS="RegionID" */
    IF EXISTS (
      SELECT * FROM deleted,ServerLocation
      WHERE
        /*  %JoinFKPK(ServerLocation,deleted," = "," AND") */
        ServerLocation.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Region because ServerLocation exists.'
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


CREATE TRIGGER tU_Region ON Region FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Region */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRegionID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Region  ServerLocation on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013741", PARENT_OWNER="", PARENT_TABLE="Region"
    CHILD_OWNER="", CHILD_TABLE="ServerLocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Region_ServerLocation", FK_COLUMNS="RegionID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(RegionID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,ServerLocation
      WHERE
        /*  %JoinFKPK(ServerLocation,deleted," = "," AND") */
        ServerLocation.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Region because ServerLocation exists.'
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




CREATE TRIGGER tD_ServerLocation ON ServerLocation FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ServerLocation */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ServerLocation  Movie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004a22b", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_Movie", FK_COLUMNS="ServerID""RegionID" */
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.ServerID = deleted.ServerID AND
        Movie.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete ServerLocation because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* ServerLocation  Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_Employee", FK_COLUMNS="ServerID""RegionID" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.ServerID = deleted.ServerID AND
        Employee.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete ServerLocation because Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* ServerLocation  StreamingPlan on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_StreamingPlan", FK_COLUMNS="ServerID""RegionID" */
    IF EXISTS (
      SELECT * FROM deleted,StreamingPlan
      WHERE
        /*  %JoinFKPK(StreamingPlan,deleted," = "," AND") */
        StreamingPlan.ServerID = deleted.ServerID AND
        StreamingPlan.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete ServerLocation because StreamingPlan exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Region  ServerLocation on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Region"
    CHILD_OWNER="", CHILD_TABLE="ServerLocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Region_ServerLocation", FK_COLUMNS="RegionID" */
    IF EXISTS (SELECT * FROM deleted,Region
      WHERE
        /* %JoinFKPK(deleted,Region," = "," AND") */
        deleted.RegionID = Region.RegionID AND
        NOT EXISTS (
          SELECT * FROM ServerLocation
          WHERE
            /* %JoinFKPK(ServerLocation,Region," = "," AND") */
            ServerLocation.RegionID = Region.RegionID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last ServerLocation because Region exists.'
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


CREATE TRIGGER tU_ServerLocation ON ServerLocation FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ServerLocation */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insServerID integer, 
           @insRegionID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ServerLocation  Movie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005308e", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_Movie", FK_COLUMNS="ServerID""RegionID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.ServerID = deleted.ServerID AND
        Movie.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update ServerLocation because Movie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ServerLocation  Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_Employee", FK_COLUMNS="ServerID""RegionID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.ServerID = deleted.ServerID AND
        Employee.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update ServerLocation because Employee exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ServerLocation  StreamingPlan on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_StreamingPlan", FK_COLUMNS="ServerID""RegionID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamingPlan
      WHERE
        /*  %JoinFKPK(StreamingPlan,deleted," = "," AND") */
        StreamingPlan.ServerID = deleted.ServerID AND
        StreamingPlan.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update ServerLocation because StreamingPlan exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Region  ServerLocation on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Region"
    CHILD_OWNER="", CHILD_TABLE="ServerLocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Region_ServerLocation", FK_COLUMNS="RegionID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(RegionID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Region
        WHERE
          /* %JoinFKPK(inserted,Region) */
          inserted.RegionID = Region.RegionID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ServerLocation because Region does not exist.'
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




CREATE TRIGGER tD_StreamingPlan ON StreamingPlan FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on StreamingPlan */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* StreamingPlan  SubscriptionType on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00041ccf", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_StreamingPlan_SubscriptionType", FK_COLUMNS="StreamingID""ServerID""RegionID" */
    IF EXISTS (
      SELECT * FROM deleted,SubscriptionType
      WHERE
        /*  %JoinFKPK(SubscriptionType,deleted," = "," AND") */
        SubscriptionType.StreamingID = deleted.StreamingID AND
        SubscriptionType.ServerID = deleted.ServerID AND
        SubscriptionType.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete StreamingPlan because SubscriptionType exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingPlan  Movie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_StreamingPlan_Movie", FK_COLUMNS="StreamingID""ServerID""RegionID" */
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.StreamingID = deleted.StreamingID AND
        Movie.ServerID = deleted.ServerID AND
        Movie.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete StreamingPlan because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* ServerLocation  StreamingPlan on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_StreamingPlan", FK_COLUMNS="ServerID""RegionID" */
    IF EXISTS (SELECT * FROM deleted,ServerLocation
      WHERE
        /* %JoinFKPK(deleted,ServerLocation," = "," AND") */
        deleted.ServerID = ServerLocation.ServerID AND
        deleted.RegionID = ServerLocation.RegionID AND
        NOT EXISTS (
          SELECT * FROM StreamingPlan
          WHERE
            /* %JoinFKPK(StreamingPlan,ServerLocation," = "," AND") */
            StreamingPlan.ServerID = ServerLocation.ServerID AND
            StreamingPlan.RegionID = ServerLocation.RegionID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamingPlan because ServerLocation exists.'
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


CREATE TRIGGER tU_StreamingPlan ON StreamingPlan FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on StreamingPlan */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStreamingID integer, 
           @insServerID integer, 
           @insRegionID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* StreamingPlan  SubscriptionType on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000470b0", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_StreamingPlan_SubscriptionType", FK_COLUMNS="StreamingID""ServerID""RegionID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StreamingID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,SubscriptionType
      WHERE
        /*  %JoinFKPK(SubscriptionType,deleted," = "," AND") */
        SubscriptionType.StreamingID = deleted.StreamingID AND
        SubscriptionType.ServerID = deleted.ServerID AND
        SubscriptionType.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update StreamingPlan because SubscriptionType exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingPlan  Movie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_StreamingPlan_Movie", FK_COLUMNS="StreamingID""ServerID""RegionID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StreamingID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.StreamingID = deleted.StreamingID AND
        Movie.ServerID = deleted.ServerID AND
        Movie.RegionID = deleted.RegionID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update StreamingPlan because Movie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ServerLocation  StreamingPlan on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ServerLocation"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ServerLocation_StreamingPlan", FK_COLUMNS="ServerID""RegionID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ServerLocation
        WHERE
          /* %JoinFKPK(inserted,ServerLocation) */
          inserted.ServerID = ServerLocation.ServerID and
          inserted.RegionID = ServerLocation.RegionID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamingPlan because ServerLocation does not exist.'
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




CREATE TRIGGER tD_Subscriber ON Subscriber FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Subscriber */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Subscriber  SubscriptionType on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00022c79", PARENT_OWNER="", PARENT_TABLE="Subscriber"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscriber_SubscriptionType", FK_COLUMNS="SubscriberID" */
    IF EXISTS (
      SELECT * FROM deleted,SubscriptionType
      WHERE
        /*  %JoinFKPK(SubscriptionType,deleted," = "," AND") */
        SubscriptionType.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Subscriber because SubscriptionType exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Subscriber  Customer on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Subscriber"
    CHILD_OWNER="", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscriber_Customer", FK_COLUMNS="SubscriberID" */
    IF EXISTS (
      SELECT * FROM deleted,Customer
      WHERE
        /*  %JoinFKPK(Customer,deleted," = "," AND") */
        Customer.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Subscriber because Customer exists.'
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


CREATE TRIGGER tU_Subscriber ON Subscriber FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Subscriber */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Subscriber  SubscriptionType on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00026382", PARENT_OWNER="", PARENT_TABLE="Subscriber"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscriber_SubscriptionType", FK_COLUMNS="SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SubscriberID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,SubscriptionType
      WHERE
        /*  %JoinFKPK(SubscriptionType,deleted," = "," AND") */
        SubscriptionType.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Subscriber because SubscriptionType exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Subscriber  Customer on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Subscriber"
    CHILD_OWNER="", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscriber_Customer", FK_COLUMNS="SubscriberID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SubscriberID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Customer
      WHERE
        /*  %JoinFKPK(Customer,deleted," = "," AND") */
        Customer.SubscriberID = deleted.SubscriberID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Subscriber because Customer exists.'
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




CREATE TRIGGER tD_SubscriptionType ON SubscriptionType FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on SubscriptionType */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Subscriber  SubscriptionType on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000339d1", PARENT_OWNER="", PARENT_TABLE="Subscriber"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscriber_SubscriptionType", FK_COLUMNS="SubscriberID" */
    IF EXISTS (SELECT * FROM deleted,Subscriber
      WHERE
        /* %JoinFKPK(deleted,Subscriber," = "," AND") */
        deleted.SubscriberID = Subscriber.SubscriberID AND
        NOT EXISTS (
          SELECT * FROM SubscriptionType
          WHERE
            /* %JoinFKPK(SubscriptionType,Subscriber," = "," AND") */
            SubscriptionType.SubscriberID = Subscriber.SubscriberID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last SubscriptionType because Subscriber exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingPlan  SubscriptionType on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_StreamingPlan_SubscriptionType", FK_COLUMNS="StreamingID""ServerID""RegionID" */
    IF EXISTS (SELECT * FROM deleted,StreamingPlan
      WHERE
        /* %JoinFKPK(deleted,StreamingPlan," = "," AND") */
        deleted.StreamingID = StreamingPlan.StreamingID AND
        deleted.ServerID = StreamingPlan.ServerID AND
        deleted.RegionID = StreamingPlan.RegionID AND
        NOT EXISTS (
          SELECT * FROM SubscriptionType
          WHERE
            /* %JoinFKPK(SubscriptionType,StreamingPlan," = "," AND") */
            SubscriptionType.StreamingID = StreamingPlan.StreamingID AND
            SubscriptionType.ServerID = StreamingPlan.ServerID AND
            SubscriptionType.RegionID = StreamingPlan.RegionID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last SubscriptionType because StreamingPlan exists.'
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


CREATE TRIGGER tU_SubscriptionType ON SubscriptionType FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on SubscriptionType */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSubscriptionID integer, 
           @insStreamingID integer, 
           @insServerID integer, 
           @insRegionID integer, 
           @insSubscriberID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Subscriber  SubscriptionType on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0003578f", PARENT_OWNER="", PARENT_TABLE="Subscriber"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscriber_SubscriptionType", FK_COLUMNS="SubscriberID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SubscriberID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Subscriber
        WHERE
          /* %JoinFKPK(inserted,Subscriber) */
          inserted.SubscriberID = Subscriber.SubscriberID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update SubscriptionType because Subscriber does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingPlan  SubscriptionType on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_StreamingPlan_SubscriptionType", FK_COLUMNS="StreamingID""ServerID""RegionID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StreamingID) OR
    UPDATE(ServerID) OR
    UPDATE(RegionID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,StreamingPlan
        WHERE
          /* %JoinFKPK(inserted,StreamingPlan) */
          inserted.StreamingID = StreamingPlan.StreamingID and
          inserted.ServerID = StreamingPlan.ServerID and
          inserted.RegionID = StreamingPlan.RegionID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update SubscriptionType because StreamingPlan does not exist.'
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


