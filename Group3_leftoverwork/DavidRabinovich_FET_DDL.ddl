
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
	[CustomerAddress]    [address] ,
	[CustomerCity]       [city] ,
	[CustomerFirstName]  [firstname] ,
	[CustomerLastName]   [lastname] ,
	[CustomerState]      [state] ,
	[CustomerZipCode]    [zipcode] ,
	[CustomerEmail]      varchar  NULL ,
	[CustomerNumber]     integer  NOT NULL ,
	[CustomerGender]     [standardstring] 
)
go

CREATE TABLE [Movie]
( 
	[MovieTitle]         [title] ,
	[MovieDirector]      [director] ,
	[Description]        varchar(300)  NULL ,
	[Star1Name]          [firstname] ,
	[Rating]             varchar  NULL ,
	[Star2Name]          [firstname] ,
	[MovieNumber]        integer  NOT NULL ,
	[Genre]              char  NULL ,
	[MovieUrl]           varchar  NULL ,
	[MovieClip]          varbinary  NULL ,
	[MovieLength]        [standardnumber] 
)
go

CREATE TABLE [Payment]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[PaymentType]        char(18)  NULL ,
	[PaymentDate]        datetime  NULL ,
	[PaymentStatus]      varchar(1)  NULL ,
	[CreditCardNumber]   char(18)  NULL ,
	[CreditCardExp]      datetime  NULL ,
	[CreditCardType]     char(18)  NULL ,
	[TotalCost]          [standardnumber] ,
	[CustomerNumber]     integer  NOT NULL ,
	[ZelleName]          [standardstring] ,
	[PaypalName]         [standardstring] ,
	[VenmoName]          [standardstring] 
)
go

CREATE TABLE [StreamRecord]
( 
	[StrreamDate]        datetime  NOT NULL ,
	[Found]              [standardstring] ,
	[PercentageViewed]   [standardnumber] ,
	[Review]             [standardnumber] ,
	[MovieNumber]        integer  NULL ,
	[CustomerNumber]     integer  NOT NULL ,
	[TVShowNumber]       [standardnumber] 
)
go

CREATE TABLE [SubscriptionType]
( 
	[TotalCost]          [standardnumber]  NOT NULL ,
	[length]             [standardstring] ,
	[level]              [standardstring] ,
	[CustomerNumber]     integer  NOT NULL 
)
go

CREATE TABLE [TVShow]
( 
	[TVShowNumber]       [standardnumber]  NOT NULL ,
	[TVShowTitle]        varchar(40)  NULL ,
	[TVShowDirector]     [standardstring] ,
	[Description]        varchar(300)  NULL ,
	[Star1Name]          varchar(20)  NULL ,
	[Rating]             [standardstring] ,
	[Star2Name]          [standardstring] ,
	[Genre]              [standardstring] ,
	[TVShowUrl]          varchar(50)  NULL ,
	[TVShowClip]         varbinary  NULL ,
	[AverageEpisodeLength] [standardnumber] ,
	[AverageEpisodes]    [standardnumber] ,
	[Seasons]            [standardnumber] 
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

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XAK1Movie] UNIQUE ([MovieTitle]  ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC,[CustomerNumber] ASC)
go

ALTER TABLE [StreamRecord]
	ADD CONSTRAINT [XPKStreamRecord] PRIMARY KEY  CLUSTERED ([StrreamDate] ASC,[CustomerNumber] ASC)
go

ALTER TABLE [SubscriptionType]
	ADD CONSTRAINT [XPKSubscriptionType] PRIMARY KEY  CLUSTERED ([TotalCost] ASC,[CustomerNumber] ASC)
go

ALTER TABLE [TVShow]
	ADD CONSTRAINT [XPKTVShow] PRIMARY KEY  CLUSTERED ([TVShowNumber] ASC)
go


exec sp_bindrule '[Moviegenre]', '[Movie].[Genre]'
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [FKPaymentSubscriptionType] FOREIGN KEY ([TotalCost],[CustomerNumber]) REFERENCES [SubscriptionType]([TotalCost],[CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FKPaymentCustomer] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [StreamRecord]
	ADD CONSTRAINT [FKStreamlRecordMovie] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [StreamRecord]
	ADD CONSTRAINT [FKStreamRecordCustomer] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [StreamRecord]
	ADD CONSTRAINT [FKStreamRecordTVShow] FOREIGN KEY ([TVShowNumber]) REFERENCES [TVShow]([TVShowNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [SubscriptionType]
	ADD CONSTRAINT [FKSubscriptionTypeCustomer] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer]([CustomerNumber])
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
    /* Customer  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00033766", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKPaymentCustomer", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  StreamRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamRecordCustomer", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,StreamRecord
      WHERE
        /*  %JoinFKPK(StreamRecord,deleted," = "," AND") */
        StreamRecord.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because StreamRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  SubscriptionType on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKSubscriptionTypeCustomer", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,SubscriptionType
      WHERE
        /*  %JoinFKPK(SubscriptionType,deleted," = "," AND") */
        SubscriptionType.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because SubscriptionType exists.'
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
  /* Customer  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00039c4f", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKPaymentCustomer", FK_COLUMNS="CustomerNumber" */
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
             @errmsg = 'Cannot update Customer because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  StreamRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamRecordCustomer", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamRecord
      WHERE
        /*  %JoinFKPK(StreamRecord,deleted," = "," AND") */
        StreamRecord.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because StreamRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  SubscriptionType on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKSubscriptionTypeCustomer", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,SubscriptionType
      WHERE
        /*  %JoinFKPK(SubscriptionType,deleted," = "," AND") */
        SubscriptionType.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because SubscriptionType exists.'
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
    /* Movie  StreamRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012207", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamlRecordMovie", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,StreamRecord
      WHERE
        /*  %JoinFKPK(StreamRecord,deleted," = "," AND") */
        StreamRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because StreamRecord exists.'
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
  /* Movie  StreamRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013caf", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamlRecordMovie", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamRecord
      WHERE
        /*  %JoinFKPK(StreamRecord,deleted," = "," AND") */
        StreamRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because StreamRecord exists.'
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
    /* Customer  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002e5db", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKPaymentCustomer", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerNumber = Customer.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Customer," = "," AND") */
            Payment.CustomerNumber = Customer.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* SubscriptionType  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SubscriptionType"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKPaymentSubscriptionType", FK_COLUMNS="CustomerNumber""TotalCost" */
    IF EXISTS (SELECT * FROM deleted,SubscriptionType
      WHERE
        /* %JoinFKPK(deleted,SubscriptionType," = "," AND") */
        deleted.TotalCost = SubscriptionType.TotalCost AND
        deleted.CustomerNumber = SubscriptionType.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,SubscriptionType," = "," AND") */
            Payment.TotalCost = SubscriptionType.TotalCost AND
            Payment.CustomerNumber = SubscriptionType.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because SubscriptionType exists.'
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
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000344ae", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKPaymentCustomer", FK_COLUMNS="CustomerNumber" */
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
             @errmsg = 'Cannot update Payment because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* SubscriptionType  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SubscriptionType"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKPaymentSubscriptionType", FK_COLUMNS="CustomerNumber""TotalCost" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TotalCost) OR
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,SubscriptionType
        WHERE
          /* %JoinFKPK(inserted,SubscriptionType) */
          inserted.TotalCost = SubscriptionType.TotalCost and
          inserted.CustomerNumber = SubscriptionType.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.TotalCost IS NULL AND
      inserted.CustomerNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because SubscriptionType does not exist.'
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




CREATE TRIGGER tD_StreamRecord ON StreamRecord FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on StreamRecord */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* TVShow  StreamRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003d085", PARENT_OWNER="", PARENT_TABLE="TVShow"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamRecordTVShow", FK_COLUMNS="TVShowNumber" */
    IF EXISTS (SELECT * FROM deleted,TVShow
      WHERE
        /* %JoinFKPK(deleted,TVShow," = "," AND") */
        deleted.TVShowNumber = TVShow.TVShowNumber AND
        NOT EXISTS (
          SELECT * FROM StreamRecord
          WHERE
            /* %JoinFKPK(StreamRecord,TVShow," = "," AND") */
            StreamRecord.TVShowNumber = TVShow.TVShowNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamRecord because TVShow exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  StreamRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamRecordCustomer", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerNumber = Customer.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM StreamRecord
          WHERE
            /* %JoinFKPK(StreamRecord,Customer," = "," AND") */
            StreamRecord.CustomerNumber = Customer.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamRecord because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  StreamRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamlRecordMovie", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM StreamRecord
          WHERE
            /* %JoinFKPK(StreamRecord,Movie," = "," AND") */
            StreamRecord.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamRecord because Movie exists.'
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


CREATE TRIGGER tU_StreamRecord ON StreamRecord FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on StreamRecord */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStrreamDate datetime, 
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* TVShow  StreamRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000465ff", PARENT_OWNER="", PARENT_TABLE="TVShow"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamRecordTVShow", FK_COLUMNS="TVShowNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TVShowNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,TVShow
        WHERE
          /* %JoinFKPK(inserted,TVShow) */
          inserted.TVShowNumber = TVShow.TVShowNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.TVShowNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamRecord because TVShow does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  StreamRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamRecordCustomer", FK_COLUMNS="CustomerNumber" */
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
             @errmsg = 'Cannot update StreamRecord because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  StreamRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamlRecordMovie", FK_COLUMNS="MovieNumber" */
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
    select @nullcnt = count(*) from inserted where
      inserted.MovieNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamRecord because Movie does not exist.'
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
    /* SubscriptionType  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000292f4", PARENT_OWNER="", PARENT_TABLE="SubscriptionType"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKPaymentSubscriptionType", FK_COLUMNS="CustomerNumber""TotalCost" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TotalCost = deleted.TotalCost AND
        Payment.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete SubscriptionType because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  SubscriptionType on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKSubscriptionTypeCustomer", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerNumber = Customer.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM SubscriptionType
          WHERE
            /* %JoinFKPK(SubscriptionType,Customer," = "," AND") */
            SubscriptionType.CustomerNumber = Customer.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last SubscriptionType because Customer exists.'
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
           @insTotalCost standardnumber, 
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* SubscriptionType  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002cfd5", PARENT_OWNER="", PARENT_TABLE="SubscriptionType"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKPaymentSubscriptionType", FK_COLUMNS="CustomerNumber""TotalCost" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TotalCost) OR
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TotalCost = deleted.TotalCost AND
        Payment.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update SubscriptionType because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  SubscriptionType on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKSubscriptionTypeCustomer", FK_COLUMNS="CustomerNumber" */
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
             @errmsg = 'Cannot update SubscriptionType because Customer does not exist.'
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




CREATE TRIGGER tD_TVShow ON TVShow FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on TVShow */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* TVShow  StreamRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012b62", PARENT_OWNER="", PARENT_TABLE="TVShow"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamRecordTVShow", FK_COLUMNS="TVShowNumber" */
    IF EXISTS (
      SELECT * FROM deleted,StreamRecord
      WHERE
        /*  %JoinFKPK(StreamRecord,deleted," = "," AND") */
        StreamRecord.TVShowNumber = deleted.TVShowNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete TVShow because StreamRecord exists.'
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


CREATE TRIGGER tU_TVShow ON TVShow FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on TVShow */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insTVShowNumber standardnumber,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* TVShow  StreamRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00014940", PARENT_OWNER="", PARENT_TABLE="TVShow"
    CHILD_OWNER="", CHILD_TABLE="StreamRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FKStreamRecordTVShow", FK_COLUMNS="TVShowNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TVShowNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamRecord
      WHERE
        /*  %JoinFKPK(StreamRecord,deleted," = "," AND") */
        StreamRecord.TVShowNumber = deleted.TVShowNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update TVShow because StreamRecord exists.'
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


