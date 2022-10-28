
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

CREATE TABLE [CUST]
( 
	[CUSTID]             integer  NOT NULL ,
	[CUSTFirstName]      char(18)  NULL ,
	[CUSTLastName]       char(18)  NULL ,
	[CUSTDateOfBirth]    datetime  NULL ,
	[CUSTAddress]        varchar(20)  NULL ,
	[CUSTCity]           char(18)  NULL ,
	[CUSTZipCode]        integer  NULL ,
	[CUSTEmail]          varchar(20)  NULL ,
	[CUSTGender]         char  NULL 
)
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
	[CustomerSSN]        integer  NULL ,
	[CustomerDOB]        date  NULL ,
	[CustomerGender]     varchar(10)  NULL 
)
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
	[CustomerSSN]        integer  NULL ,
	[CustomerDOB]        date  NULL ,
	[CustomerGender]     varchar(10)  NULL 
)
go

CREATE TABLE [CustomerCreditCard]
( 
	[CreditCardNumber]   integer(16)  NULL ,
	[CreditCardExp]      integer(4)  NULL ,
	[CreditCardCvv]      varchar(3)  NULL ,
	[PaymentType]        char(18)  NULL ,
	[TransactionNumber]  integer  NOT NULL ,
	[CUSTID]             integer  NOT NULL 
)
go

CREATE TABLE [CustomerCreditCard]
( 
	[CreditCardNumber]   integer(16)  NULL ,
	[CreditCardExp]      integer(4)  NULL ,
	[CreditCardCvv]      varchar(3)  NULL ,
	[PaymentType]        char(18)  NULL ,
	[TransactionNumber]  integer  NOT NULL ,
	[EpayTypeId]         integer  NOT NULL ,
	[StreamingId]        integer  NOT NULL ,
	[CustomerId]         integer  NOT NULL 
)
go

CREATE TABLE [CustomerSupport]
( 
	[CustoemerSupportId] char(18)  NOT NULL ,
	[CustoemerSupportType] char(18)  NULL ,
	[CustoemerSupportIssue] char(18)  NULL ,
	[CustoemerSupportResolved] char(18)  NULL ,
	[EmployeeId]         varchar(20)  NOT NULL ,
	[CustomerId]         integer  NULL ,
	[CUSTID]             integer  NULL 
)
go

CREATE TABLE [CustomerSupport]
( 
	[CustoemerSupportId] char(18)  NOT NULL ,
	[CustoemerSupportType] char(18)  NULL ,
	[CustoemerSupportIssue] char(18)  NULL ,
	[CustoemerSupportResolved] char(18)  NULL ,
	[EmployeeId]         varchar(20)  NOT NULL ,
	[CUSTID]             integer  NULL 
)
go

CREATE TABLE [Employee]
( 
	[EmployeeFirstName]  [Domain_784] ,
	[EmployeeAddress]    [address] ,
	[EmployeePhoneNumber] [phone] ,
	[EmployeeAddress2]   [Domain_787] ,
	[EmployeeEmail]      varchar(20)  NULL ,
	[HireDate]           datetime  NULL ,
	[EmployeeSsn]        integer  NULL ,
	[EmployeeId]         varchar(20)  NOT NULL ,
	[Supervisor]         varchar(20)  NOT NULL ,
	[EmployeeLastName]   char(18)  NULL 
)
go

CREATE TABLE [Employee]
( 
	[EmployeeFirstName]  [Domain_784] ,
	[EmployeeAddress]    [address] ,
	[EmployeePhoneNumber] [phone] ,
	[EmployeeAddress2]   [Domain_787] ,
	[EmployeeEmail]      varchar(20)  NULL ,
	[HireDate]           datetime  NULL ,
	[EmployeeSsn]        integer  NULL ,
	[EmployeeId]         varchar(20)  NOT NULL ,
	[Supervisor]         varchar(20)  NOT NULL ,
	[EmployeeLastName]   char(18)  NULL 
)
go

CREATE TABLE [EmployeePayroll]
( 
	[PayrollId]          integer(10)  NOT NULL ,
	[EmployeeCheckingAccount] char(18)  NULL ,
	[EmployeeSalary]     integer(10)  NULL ,
	[EmployeeId]         varchar(20)  NOT NULL 
)
go

CREATE TABLE [EmployeePayroll]
( 
	[PayrollId]          integer(10)  NOT NULL ,
	[EmployeeCheckingAccount] char(18)  NULL ,
	[EmployeeSalary]     integer(10)  NULL ,
	[EmployeeId]         varchar(20)  NOT NULL 
)
go

CREATE TABLE [Epay]
( 
	[EmployeeId]         integer  NULL ,
	[TransactionNumber]  integer  NOT NULL ,
	[EpayVendorId]       integer  NULL ,
	[CustomerId]         integer  NULL ,
	[EpayId]             integer  NULL ,
	[EpayTypeId]         integer  NOT NULL 
)
go

CREATE TABLE [Epay]
( 
	[EmployeeId]         integer  NULL ,
	[TransactionNumber]  integer  NOT NULL ,
	[EpayVendorId]       integer  NULL ,
	[CustomerId]         integer  NULL ,
	[EpayId]             integer  NULL ,
	[EpayTypeId]         integer  NOT NULL 
)
go

CREATE TABLE [EpayType]
( 
	[EpayTypeId]         integer  NOT NULL ,
	[ZelleId]            integer  NULL ,
	[PaypalId]           integer  NULL ,
	[VenmoId]            integer  NULL ,
	[ApplePayId]         integer  NULL ,
	[SamsungPayId]       integer  NULL ,
	[TransactionNumber]  integer  NOT NULL 
)
go

CREATE TABLE [EpayType]
( 
	[EpayTypeId]         integer  NOT NULL ,
	[ZelleId]            integer  NULL ,
	[PaypalId]           integer  NULL ,
	[VenmoId]            integer  NULL ,
	[ApplePayId]         integer  NULL ,
	[SamsungPayId]       integer  NULL ,
	[TransactionNumber]  integer  NOT NULL 
)
go

CREATE TABLE [EpayType]
( 
	[TransactionNumber]  integer  NOT NULL ,
	[EpayTypeId]         integer  NOT NULL 
)
go

CREATE TABLE [LocationRegion]
( 
	[RegionId]           integer  NOT NULL ,
	[RegionName]         char(18)  NULL ,
	[CustomerId]         integer  NULL 
)
go

CREATE TABLE [LocationRegion]
( 
	[RegionId]           integer  NOT NULL ,
	[RegionName]         char(18)  NULL ,
	[CustomerId]         integer  NULL 
)
go

CREATE TABLE [LocationRegion]
( 
	[name]               char(18)  NULL 
)
go

CREATE TABLE [Movie]
( 
	[MovieId]            char(18)  NOT NULL ,
	[MovieName]          char(18)  NULL ,
	[MovieReleaseDate]   char(18)  NULL ,
	[MovieDirector]      char(18)  NULL ,
	[MovieRating]        char(18)  NULL ,
	[MovieLength]        char(18)  NULL ,
	[MovieSubstitle]     char(18)  NULL ,
	[MovieCounty]        char(18)  NULL ,
	[MovieDescription]   char(18)  NULL ,
	[MovieStar1]         char(18)  NULL ,
	[MovieStar2]         char(18)  NULL ,
	[MovieGenreId]       char(18)  NULL ,
	[MovieGenre]         char(18)  NULL ,
	[CustomerId]         integer  NULL ,
	[CUSTID]             integer  NULL 
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
	[EpayVendorId]       integer  NULL ,
	[EpayTypeId]         integer  NOT NULL ,
	[StreamingPlanId]    integer  NOT NULL ,
	[CUSTID]             integer  NOT NULL 
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
	[EpayVendorId]       integer  NULL ,
	[EpayTypeId]         integer  NOT NULL ,
	[StreamingId]        integer  NOT NULL ,
	[CustomerId]         integer  NOT NULL 
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

CREATE TABLE [PersonalCheck]
( 
	[CheckBankNumber]    integer  NULL ,
	[CheckNumber]        integer  NULL ,
	[TransactionNumber]  integer  NOT NULL ,
	[RoutingNumber]      integer  NULL 
)
go

CREATE TABLE [ServerLocation]
( 
	[ServerID]           integer  NOT NULL ,
	[RegionId]           integer  NOT NULL 
)
go

CREATE TABLE [Stream]
( 
	[CustomerId]         integer  NOT NULL ,
	[Date]               datetime  NULL ,
	[StreamLength]       datetime  NULL ,
	[SreamType]          varchar(20)  NULL ,
	[CUSTID]             integer  NOT NULL 
)
go

CREATE TABLE [StreamingPlan]
( 
	[StreamingPlanId]    integer  NOT NULL ,
	[StreamingPlanName]  char(18)  NULL ,
	[StreamingPlanRate]  char(18)  NULL ,
	[StreamingPlanLimit] char(18)  NULL ,
	[StreamingTotalCost] integer  NULL ,
	[Streaminglength]    integer  NULL ,
	[Streaminglevel]     char(18)  NULL ,
	[CUSTID]             integer  NOT NULL 
)
go

CREATE TABLE [StreamingPlan]
( 
	[StreamingId]        integer  NOT NULL ,
	[StreamingPlanName]  char(18)  NULL ,
	[StreamingPlanRate]  char(18)  NULL ,
	[StreamingPlanLimit] char(18)  NULL ,
	[SubscriptionId]     integer  NULL ,
	[StreamingTotalCost] integer  NULL ,
	[Streaminglength]    integer  NULL ,
	[Streaminglevel]     char(18)  NULL ,
	[CustomerId]         integer  NOT NULL 
)
go

CREATE TABLE [Subscription]
( 
	[StreamPlanId]       integer  NULL ,
	[LoginName]          char(18)  NULL ,
	[Password]           char(18)  NULL ,
	[CustomerId]         integer  NOT NULL ,
	[CUSTID]             integer  NOT NULL 
)
go

CREATE TABLE [TVShows]
( 
	[TVShowId]           char(18)  NOT NULL ,
	[TVShowTitle]        char(18)  NULL ,
	[TVShowDirector]     char(18)  NULL ,
	[TVShowStar1]        char(18)  NULL ,
	[TVShowStar2]        char(18)  NULL ,
	[TVShowRating]       char(18)  NULL ,
	[TVShowLength]       integer  NULL ,
	[TVShowEpisodes]     integer  NULL ,
	[TVShowSeason]       integer  NULL ,
	[TVShowGenre]        char(18)  NULL ,
	[TVShowStreamingDate] char(18)  NULL ,
	[CustomerId]         integer  NULL ,
	[CUSTID]             integer  NULL 
)
go

CREATE TABLE [TVShows]
( 
	[TVShowId]           char(18)  NOT NULL ,
	[TVShowTitle]        char(18)  NULL ,
	[TVShowDirector]     char(18)  NULL ,
	[TVShowStar1]        char(18)  NULL ,
	[TVShowStar2]        char(18)  NULL ,
	[TVShowRating]       char(18)  NULL ,
	[TVShowLength]       integer  NULL ,
	[TVShowEpisodes]     integer  NULL ,
	[TVShowSeason]       integer  NULL ,
	[TVShowGenre]        char(18)  NULL ,
	[StreamingId]        integer  NULL ,
	[TVShowStreamingDate] char(18)  NULL ,
	[CUSTID]             integer  NULL ,
	[CustomerId]         integer  NULL 
)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CUSTID] ASC)
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
	ADD CONSTRAINT [XPKCustomerCreditCard] PRIMARY KEY  CLUSTERED ([TransactionNumber] ASC,[CUSTID] ASC)
go

ALTER TABLE [CustomerCreditCard]
	ADD CONSTRAINT [XPKCustomerCreditCard] PRIMARY KEY  CLUSTERED ([TransactionNumber] ASC,[EpayTypeId] ASC,[StreamingId] ASC,[CustomerId] ASC)
go

ALTER TABLE [CustomerSupport]
	ADD CONSTRAINT [XPKCustomerSupport] PRIMARY KEY  CLUSTERED ([CustoemerSupportId] ASC,[EmployeeId] ASC)
go

ALTER TABLE [CustomerSupport]
	ADD CONSTRAINT [XPKCustomerSupport] PRIMARY KEY  CLUSTERED ([CustoemerSupportId] ASC,[EmployeeId] ASC)
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

ALTER TABLE [EmployeePayroll]
	ADD CONSTRAINT [XPKEmployeePayroll] PRIMARY KEY  CLUSTERED ([PayrollId] ASC,[EmployeeId] ASC)
go

ALTER TABLE [EmployeePayroll]
	ADD CONSTRAINT [XPKEmployeePayroll] PRIMARY KEY  CLUSTERED ([PayrollId] ASC,[EmployeeId] ASC)
go

ALTER TABLE [Epay]
	ADD CONSTRAINT [XPKEpay] PRIMARY KEY  CLUSTERED ([EpayTypeId] ASC,[TransactionNumber] ASC)
go

ALTER TABLE [Epay]
	ADD CONSTRAINT [XPKEpay] PRIMARY KEY  CLUSTERED ([EpayTypeId] ASC,[TransactionNumber] ASC)
go

ALTER TABLE [EpayType]
	ADD CONSTRAINT [XPKEpayType] PRIMARY KEY  CLUSTERED ([EpayTypeId] ASC,[TransactionNumber] ASC)
go

ALTER TABLE [EpayType]
	ADD CONSTRAINT [XPKEpayType] PRIMARY KEY  CLUSTERED ([EpayTypeId] ASC,[TransactionNumber] ASC)
go

ALTER TABLE [EpayType]
	ADD CONSTRAINT [XPKEpayType] PRIMARY KEY  CLUSTERED ([EpayTypeId] ASC,[TransactionNumber] ASC)
go

ALTER TABLE [LocationRegion]
	ADD CONSTRAINT [XPKLocationRegion] PRIMARY KEY  CLUSTERED ([RegionId] ASC)
go

ALTER TABLE [LocationRegion]
	ADD CONSTRAINT [XPKLocationRegion] PRIMARY KEY  CLUSTERED ([RegionId] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieId] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([TransactionNumber] ASC,[CUSTID] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([TransactionNumber] ASC,[EpayTypeId] ASC,[StreamingId] ASC,[CustomerId] ASC)
go

ALTER TABLE [PersonalCheck]
	ADD CONSTRAINT [XPKPersonalCheck] PRIMARY KEY  CLUSTERED ([TransactionNumber] ASC)
go

ALTER TABLE [PersonalCheck]
	ADD CONSTRAINT [XPKPersonalCheck] PRIMARY KEY  CLUSTERED ([TransactionNumber] ASC)
go

ALTER TABLE [ServerLocation]
	ADD CONSTRAINT [XPKServerLocation] PRIMARY KEY  CLUSTERED ([ServerID] ASC,[RegionId] ASC)
go

ALTER TABLE [Stream]
	ADD CONSTRAINT [XPKStream] PRIMARY KEY  CLUSTERED ([CustomerId] ASC,[CUSTID] ASC)
go

ALTER TABLE [StreamingPlan]
	ADD CONSTRAINT [XPKStreamingPlan] PRIMARY KEY  CLUSTERED ([StreamingPlanId] ASC,[CUSTID] ASC)
go

ALTER TABLE [StreamingPlan]
	ADD CONSTRAINT [XPKStreamingPlan] PRIMARY KEY  CLUSTERED ([StreamingId] ASC,[CustomerId] ASC)
go

ALTER TABLE [Subscription]
	ADD CONSTRAINT [XPKSubscription] PRIMARY KEY  CLUSTERED ([CustomerId] ASC,[CUSTID] ASC)
go

ALTER TABLE [TVShows]
	ADD CONSTRAINT [XPKTVShows] PRIMARY KEY  CLUSTERED ([TVShowId] ASC)
go

ALTER TABLE [TVShows]
	ADD CONSTRAINT [XPKTVShows] PRIMARY KEY  CLUSTERED ([TVShowId] ASC)
go


ALTER TABLE [CustomerCreditCard]
	ADD CONSTRAINT [FK_CustomerCreditCard_Payment] FOREIGN KEY ([TransactionNumber],[CUSTID]) REFERENCES [Payment]([TransactionNumber],[CUSTID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CustomerCreditCard]
	ADD CONSTRAINT [FK_CustomerCreditCard_Payment] FOREIGN KEY ([TransactionNumber],[EpayTypeId],[StreamingId],[CustomerId]) REFERENCES [Payment]([TransactionNumber],[EpayTypeId],[StreamingId],[CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CustomerSupport]
	ADD CONSTRAINT [R_51] FOREIGN KEY ([CustomerId],[CUSTID]) REFERENCES [Subscription]([CustomerId],[CUSTID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CustomerSupport]
	ADD CONSTRAINT [R_86] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CustomerSupport]
	ADD CONSTRAINT [R_85] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CustomerSupport]
	ADD CONSTRAINT [R_87] FOREIGN KEY ([CUSTID]) REFERENCES [CUST]([CUSTID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EmployeePayroll]
	ADD CONSTRAINT [FK_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EmployeePayroll]
	ADD CONSTRAINT [FK_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EpayType]
	ADD CONSTRAINT [FK_EPay_EpayType] FOREIGN KEY ([EpayTypeId],[TransactionNumber]) REFERENCES [Epay]([EpayTypeId],[TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EpayType]
	ADD CONSTRAINT [FK_EPay_EpayType] FOREIGN KEY ([EpayTypeId],[TransactionNumber]) REFERENCES [Epay]([EpayTypeId],[TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EpayType]
	ADD CONSTRAINT [R_73] FOREIGN KEY ([EpayTypeId],[TransactionNumber]) REFERENCES [Epay]([EpayTypeId],[TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [LocationRegion]
	ADD CONSTRAINT [R_52] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [LocationRegion]
	ADD CONSTRAINT [R_52] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Movie]
	ADD CONSTRAINT [R_91] FOREIGN KEY ([CustomerId],[CUSTID]) REFERENCES [Stream]([CustomerId],[CUSTID])
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
	ADD CONSTRAINT [FK_Payment_Epay] FOREIGN KEY ([EpayTypeId],[TransactionNumber]) REFERENCES [Epay]([EpayTypeId],[TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_PersonalCheck] FOREIGN KEY ([TransactionNumber]) REFERENCES [PersonalCheck]([TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [R_100] FOREIGN KEY ([StreamingPlanId],[CUSTID]) REFERENCES [StreamingPlan]([StreamingPlanId],[CUSTID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_Epay] FOREIGN KEY ([EpayTypeId],[TransactionNumber]) REFERENCES [Epay]([EpayTypeId],[TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [FK_Payment_PersonalCheck] FOREIGN KEY ([TransactionNumber]) REFERENCES [PersonalCheck]([TransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [R_109] FOREIGN KEY ([StreamingId],[CustomerId]) REFERENCES [StreamingPlan]([StreamingId],[CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ServerLocation]
	ADD CONSTRAINT [R_88] FOREIGN KEY ([RegionId]) REFERENCES [LocationRegion]([RegionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Stream]
	ADD CONSTRAINT [R_90] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Stream]
	ADD CONSTRAINT [R_93] FOREIGN KEY ([CUSTID]) REFERENCES [CUST]([CUSTID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [StreamingPlan]
	ADD CONSTRAINT [R_99] FOREIGN KEY ([CUSTID]) REFERENCES [CUST]([CUSTID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [StreamingPlan]
	ADD CONSTRAINT [R_108] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Subscription]
	ADD CONSTRAINT [R_97] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Subscription]
	ADD CONSTRAINT [R_98] FOREIGN KEY ([CUSTID]) REFERENCES [CUST]([CUSTID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [TVShows]
	ADD CONSTRAINT [R_92] FOREIGN KEY ([CustomerId],[CUSTID]) REFERENCES [Stream]([CustomerId],[CUSTID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [TVShows]
	ADD CONSTRAINT [R_94] FOREIGN KEY ([CustomerId],[CUSTID]) REFERENCES [Stream]([CustomerId],[CUSTID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_CUST ON CUST FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUST */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST  StreamingPlan on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003dfe9", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,StreamingPlan
      WHERE
        /*  %JoinFKPK(StreamingPlan,deleted," = "," AND") */
        StreamingPlan.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because StreamingPlan exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST  Subscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because Subscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST  Stream on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_93", FK_COLUMNS="CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,Stream
      WHERE
        /*  %JoinFKPK(Stream,deleted," = "," AND") */
        Stream.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because Stream exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST  CustomerSupport on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because CustomerSupport exists.'
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


CREATE TRIGGER tU_CUST ON CUST FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUST */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCUSTID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST  StreamingPlan on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000422ac", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamingPlan
      WHERE
        /*  %JoinFKPK(StreamingPlan,deleted," = "," AND") */
        StreamingPlan.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because StreamingPlan exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST  Subscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because Subscription exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST  Stream on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_93", FK_COLUMNS="CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Stream
      WHERE
        /*  %JoinFKPK(Stream,deleted," = "," AND") */
        Stream.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because Stream exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST  CustomerSupport on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because CustomerSupport exists.'
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
    /* Customer  StreamingPlan on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003f6c0", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_108", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,StreamingPlan
      WHERE
        /*  %JoinFKPK(StreamingPlan,deleted," = "," AND") */
        StreamingPlan.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because StreamingPlan exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Subscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Subscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Stream on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_90", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,Stream
      WHERE
        /*  %JoinFKPK(Stream,deleted," = "," AND") */
        Stream.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Stream exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  LocationRegion on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="LocationRegion"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,LocationRegion
      WHERE
        /*  %JoinFKPK(LocationRegion,deleted," = "," AND") */
        LocationRegion.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because LocationRegion exists.'
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
  /* Customer  StreamingPlan on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00044b87", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_108", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamingPlan
      WHERE
        /*  %JoinFKPK(StreamingPlan,deleted," = "," AND") */
        StreamingPlan.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because StreamingPlan exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Subscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Subscription exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Stream on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_90", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Stream
      WHERE
        /*  %JoinFKPK(Stream,deleted," = "," AND") */
        Stream.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Stream exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  LocationRegion on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="LocationRegion"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,LocationRegion
      WHERE
        /*  %JoinFKPK(LocationRegion,deleted," = "," AND") */
        LocationRegion.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because LocationRegion exists.'
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
    /* Customer  LocationRegion on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000206fe", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="LocationRegion"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,LocationRegion
      WHERE
        /*  %JoinFKPK(LocationRegion,deleted," = "," AND") */
        LocationRegion.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because LocationRegion exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer makes Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
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
  /* Customer  LocationRegion on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00024387", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="LocationRegion"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,LocationRegion
      WHERE
        /*  %JoinFKPK(LocationRegion,deleted," = "," AND") */
        LocationRegion.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because LocationRegion exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer makes Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
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
    /* Payment  CustomerCreditCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001a191", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber""CUSTID" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.TransactionNumber = Payment.TransactionNumber AND
        deleted.CUSTID = Payment.CUSTID AND
        NOT EXISTS (
          SELECT * FROM CustomerCreditCard
          WHERE
            /* %JoinFKPK(CustomerCreditCard,Payment," = "," AND") */
            CustomerCreditCard.TransactionNumber = Payment.TransactionNumber AND
            CustomerCreditCard.CUSTID = Payment.CUSTID
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
           @insTransactionNumber integer, 
           @insCUSTID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  CustomerCreditCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001ace3", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber""CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.TransactionNumber = Payment.TransactionNumber and
          inserted.CUSTID = Payment.CUSTID
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




CREATE TRIGGER tD_CustomerCreditCard ON CustomerCreditCard FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerCreditCard */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment  CustomerCreditCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00021056", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber""CustomerId""EpayTypeId""StreamingId" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.TransactionNumber = Payment.TransactionNumber AND
        deleted.EpayTypeId = Payment.EpayTypeId AND
        deleted.StreamingId = Payment.StreamingId AND
        deleted.CustomerId = Payment.CustomerId AND
        NOT EXISTS (
          SELECT * FROM CustomerCreditCard
          WHERE
            /* %JoinFKPK(CustomerCreditCard,Payment," = "," AND") */
            CustomerCreditCard.TransactionNumber = Payment.TransactionNumber AND
            CustomerCreditCard.EpayTypeId = Payment.EpayTypeId AND
            CustomerCreditCard.StreamingId = Payment.StreamingId AND
            CustomerCreditCard.CustomerId = Payment.CustomerId
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
           @insTransactionNumber integer, 
           @insEpayTypeId integer, 
           @insStreamingId integer, 
           @insCustomerId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  CustomerCreditCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001f262", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="CustomerId""TransactionNumber""EpayTypeId""StreamingId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId) OR
    UPDATE(StreamingId) OR
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.TransactionNumber = Payment.TransactionNumber and
          inserted.EpayTypeId = Payment.EpayTypeId and
          inserted.StreamingId = Payment.StreamingId and
          inserted.CustomerId = Payment.CustomerId
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




CREATE TRIGGER tD_CustomerSupport ON CustomerSupport FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerSupport */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Employee  CustomerSupport on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002c459", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_86", FK_COLUMNS="EmployeeId" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeId = Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM CustomerSupport
          WHERE
            /* %JoinFKPK(CustomerSupport,Employee," = "," AND") */
            CustomerSupport.EmployeeId = Employee.EmployeeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerSupport because Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Subscription  CustomerSupport on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Subscription"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="CustomerId""CUSTID" */
    IF EXISTS (SELECT * FROM deleted,Subscription
      WHERE
        /* %JoinFKPK(deleted,Subscription," = "," AND") */
        deleted.CustomerId = Subscription.CustomerId AND
        deleted.CUSTID = Subscription.CUSTID AND
        NOT EXISTS (
          SELECT * FROM CustomerSupport
          WHERE
            /* %JoinFKPK(CustomerSupport,Subscription," = "," AND") */
            CustomerSupport.CustomerId = Subscription.CustomerId AND
            CustomerSupport.CUSTID = Subscription.CUSTID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerSupport because Subscription exists.'
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
           @insCustoemerSupportId char(18), 
           @insEmployeeId varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee  CustomerSupport on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0003134d", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_86", FK_COLUMNS="EmployeeId" */
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
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerSupport because Employee does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Subscription  CustomerSupport on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Subscription"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="CustomerId""CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Subscription
        WHERE
          /* %JoinFKPK(inserted,Subscription) */
          inserted.CustomerId = Subscription.CustomerId and
          inserted.CUSTID = Subscription.CUSTID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL AND
      inserted.CUSTID IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerSupport because Subscription does not exist.'
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
    /* CUST  CustomerSupport on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00027adb", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CUSTID" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CUSTID = CUST.CUSTID AND
        NOT EXISTS (
          SELECT * FROM CustomerSupport
          WHERE
            /* %JoinFKPK(CustomerSupport,CUST," = "," AND") */
            CustomerSupport.CUSTID = CUST.CUSTID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerSupport because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee  CustomerSupport on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_85", FK_COLUMNS="EmployeeId" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeId = Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM CustomerSupport
          WHERE
            /* %JoinFKPK(CustomerSupport,Employee," = "," AND") */
            CustomerSupport.EmployeeId = Employee.EmployeeId
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
           @insCustoemerSupportId char(18), 
           @insEmployeeId varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST  CustomerSupport on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b9bd", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CUSTID = CUST.CUSTID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CUSTID IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerSupport because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee  CustomerSupport on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_85", FK_COLUMNS="EmployeeId" */
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
    /* ERWIN_RELATION:CHECKSUM="000310fd", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_85", FK_COLUMNS="EmployeeId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because CustomerSupport exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee  EmployeePayroll on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="EmployeePayroll"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeeId", FK_COLUMNS="EmployeeId" */
    IF EXISTS (
      SELECT * FROM deleted,EmployeePayroll
      WHERE
        /*  %JoinFKPK(EmployeePayroll,deleted," = "," AND") */
        EmployeePayroll.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because EmployeePayroll exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee receives Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
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
  /* Employee  CustomerSupport on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000371ac", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_85", FK_COLUMNS="EmployeeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because CustomerSupport exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee  EmployeePayroll on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="EmployeePayroll"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeeId", FK_COLUMNS="EmployeeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EmployeePayroll
      WHERE
        /*  %JoinFKPK(EmployeePayroll,deleted," = "," AND") */
        EmployeePayroll.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because EmployeePayroll exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee receives Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
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
    /* ERWIN_RELATION:CHECKSUM="00032ccb", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_86", FK_COLUMNS="EmployeeId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because CustomerSupport exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee  EmployeePayroll on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="EmployeePayroll"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeeId", FK_COLUMNS="EmployeeId" */
    IF EXISTS (
      SELECT * FROM deleted,EmployeePayroll
      WHERE
        /*  %JoinFKPK(EmployeePayroll,deleted," = "," AND") */
        EmployeePayroll.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because EmployeePayroll exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee receives Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
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
  /* Employee  CustomerSupport on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000376b8", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_86", FK_COLUMNS="EmployeeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because CustomerSupport exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee  EmployeePayroll on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="EmployeePayroll"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeeId", FK_COLUMNS="EmployeeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EmployeePayroll
      WHERE
        /*  %JoinFKPK(EmployeePayroll,deleted," = "," AND") */
        EmployeePayroll.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because EmployeePayroll exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee receives Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
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
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_EmployeePayroll ON EmployeePayroll FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EmployeePayroll */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Employee  EmployeePayroll on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016d9b", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="EmployeePayroll"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeeId", FK_COLUMNS="EmployeeId" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeId = Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM EmployeePayroll
          WHERE
            /* %JoinFKPK(EmployeePayroll,Employee," = "," AND") */
            EmployeePayroll.EmployeeId = Employee.EmployeeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EmployeePayroll because Employee exists.'
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


CREATE TRIGGER tU_EmployeePayroll ON EmployeePayroll FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EmployeePayroll */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPayrollId integer(10), 
           @insEmployeeId varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee  EmployeePayroll on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00016dee", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="EmployeePayroll"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeeId", FK_COLUMNS="EmployeeId" */
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
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EmployeePayroll because Employee does not exist.'
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




CREATE TRIGGER tD_EmployeePayroll ON EmployeePayroll FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EmployeePayroll */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Employee  EmployeePayroll on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016d9b", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="EmployeePayroll"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeeId", FK_COLUMNS="EmployeeId" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeId = Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM EmployeePayroll
          WHERE
            /* %JoinFKPK(EmployeePayroll,Employee," = "," AND") */
            EmployeePayroll.EmployeeId = Employee.EmployeeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EmployeePayroll because Employee exists.'
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


CREATE TRIGGER tU_EmployeePayroll ON EmployeePayroll FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EmployeePayroll */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPayrollId integer(10), 
           @insEmployeeId varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee  EmployeePayroll on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00016dee", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="EmployeePayroll"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeeId", FK_COLUMNS="EmployeeId" */
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
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EmployeePayroll because Employee does not exist.'
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
    /* Epay  EpayType on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000230de", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EPay_EpayType", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,EpayType
      WHERE
        /*  %JoinFKPK(EpayType,deleted," = "," AND") */
        EpayType.TransactionNumber = deleted.TransactionNumber AND
        EpayType.EpayTypeId = deleted.EpayTypeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Epay because EpayType exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Epay  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TransactionNumber = deleted.TransactionNumber AND
        Payment.EpayTypeId = deleted.EpayTypeId
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
           @insEpayTypeId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Epay  EpayType on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00029546", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EPay_EpayType", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EpayType
      WHERE
        /*  %JoinFKPK(EpayType,deleted," = "," AND") */
        EpayType.TransactionNumber = deleted.TransactionNumber AND
        EpayType.EpayTypeId = deleted.EpayTypeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Epay because EpayType exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Epay  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TransactionNumber = deleted.TransactionNumber AND
        Payment.EpayTypeId = deleted.EpayTypeId
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




CREATE TRIGGER tD_Epay ON Epay FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Epay */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Epay  EpayType on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00034105", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_73", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,EpayType
      WHERE
        /*  %JoinFKPK(EpayType,deleted," = "," AND") */
        EpayType.TransactionNumber = deleted.TransactionNumber AND
        EpayType.EpayTypeId = deleted.EpayTypeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Epay because EpayType exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Epay  EpayType on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EPay_EpayType", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,EpayType
      WHERE
        /*  %JoinFKPK(EpayType,deleted," = "," AND") */
        EpayType.TransactionNumber = deleted.TransactionNumber AND
        EpayType.EpayTypeId = deleted.EpayTypeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Epay because EpayType exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Epay  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TransactionNumber = deleted.TransactionNumber AND
        Payment.EpayTypeId = deleted.EpayTypeId
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
           @insEpayTypeId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Epay  EpayType on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003c3b4", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_73", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EpayType
      WHERE
        /*  %JoinFKPK(EpayType,deleted," = "," AND") */
        EpayType.TransactionNumber = deleted.TransactionNumber AND
        EpayType.EpayTypeId = deleted.EpayTypeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Epay because EpayType exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Epay  EpayType on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EPay_EpayType", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EpayType
      WHERE
        /*  %JoinFKPK(EpayType,deleted," = "," AND") */
        EpayType.TransactionNumber = deleted.TransactionNumber AND
        EpayType.EpayTypeId = deleted.EpayTypeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Epay because EpayType exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Epay  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.TransactionNumber = deleted.TransactionNumber AND
        Payment.EpayTypeId = deleted.EpayTypeId
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
    /* ERWIN_RELATION:CHECKSUM="000181a0", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EPay_EpayType", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Epay
      WHERE
        /* %JoinFKPK(deleted,Epay," = "," AND") */
        deleted.TransactionNumber = Epay.TransactionNumber AND
        deleted.EpayTypeId = Epay.EpayTypeId AND
        NOT EXISTS (
          SELECT * FROM EpayType
          WHERE
            /* %JoinFKPK(EpayType,Epay," = "," AND") */
            EpayType.TransactionNumber = Epay.TransactionNumber AND
            EpayType.EpayTypeId = Epay.EpayTypeId
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
           @insEpayTypeId integer, 
           @insTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Epay  EpayType on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001903c", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EPay_EpayType", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Epay
        WHERE
          /* %JoinFKPK(inserted,Epay) */
          inserted.TransactionNumber = Epay.TransactionNumber and
          inserted.EpayTypeId = Epay.EpayTypeId
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
    /* ERWIN_RELATION:CHECKSUM="000181a0", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EPay_EpayType", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Epay
      WHERE
        /* %JoinFKPK(deleted,Epay," = "," AND") */
        deleted.TransactionNumber = Epay.TransactionNumber AND
        deleted.EpayTypeId = Epay.EpayTypeId AND
        NOT EXISTS (
          SELECT * FROM EpayType
          WHERE
            /* %JoinFKPK(EpayType,Epay," = "," AND") */
            EpayType.TransactionNumber = Epay.TransactionNumber AND
            EpayType.EpayTypeId = Epay.EpayTypeId
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
           @insEpayTypeId integer, 
           @insTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Epay  EpayType on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001903c", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EPay_EpayType", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Epay
        WHERE
          /* %JoinFKPK(inserted,Epay) */
          inserted.TransactionNumber = Epay.TransactionNumber and
          inserted.EpayTypeId = Epay.EpayTypeId
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
    /* ERWIN_RELATION:CHECKSUM="00017bda", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_73", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Epay
      WHERE
        /* %JoinFKPK(deleted,Epay," = "," AND") */
        deleted.TransactionNumber = Epay.TransactionNumber AND
        deleted.EpayTypeId = Epay.EpayTypeId AND
        NOT EXISTS (
          SELECT * FROM EpayType
          WHERE
            /* %JoinFKPK(EpayType,Epay," = "," AND") */
            EpayType.TransactionNumber = Epay.TransactionNumber AND
            EpayType.EpayTypeId = Epay.EpayTypeId
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
           @insTransactionNumber integer, 
           @insEpayTypeId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Epay  EpayType on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00019cbc", PARENT_OWNER="", PARENT_TABLE="Epay"
    CHILD_OWNER="", CHILD_TABLE="EpayType"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_73", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Epay
        WHERE
          /* %JoinFKPK(inserted,Epay) */
          inserted.TransactionNumber = Epay.TransactionNumber and
          inserted.EpayTypeId = Epay.EpayTypeId
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




CREATE TRIGGER tD_LocationRegion ON LocationRegion FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on LocationRegion */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer  LocationRegion on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00014d80", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="LocationRegion"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM LocationRegion
          WHERE
            /* %JoinFKPK(LocationRegion,Customer," = "," AND") */
            LocationRegion.CustomerId = Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last LocationRegion because Customer exists.'
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


CREATE TRIGGER tU_LocationRegion ON LocationRegion FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on LocationRegion */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRegionId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer  LocationRegion on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000191d0", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="LocationRegion"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="CustomerId" */
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
             @errmsg = 'Cannot update LocationRegion because Customer does not exist.'
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




CREATE TRIGGER tD_LocationRegion ON LocationRegion FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on LocationRegion */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* LocationRegion  ServerLocation on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002699e", PARENT_OWNER="", PARENT_TABLE="LocationRegion"
    CHILD_OWNER="", CHILD_TABLE="ServerLocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_88", FK_COLUMNS="RegionId" */
    IF EXISTS (
      SELECT * FROM deleted,ServerLocation
      WHERE
        /*  %JoinFKPK(ServerLocation,deleted," = "," AND") */
        ServerLocation.RegionId = deleted.RegionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete LocationRegion because ServerLocation exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  LocationRegion on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="LocationRegion"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM LocationRegion
          WHERE
            /* %JoinFKPK(LocationRegion,Customer," = "," AND") */
            LocationRegion.CustomerId = Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last LocationRegion because Customer exists.'
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


CREATE TRIGGER tU_LocationRegion ON LocationRegion FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on LocationRegion */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRegionId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* LocationRegion  ServerLocation on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002bd70", PARENT_OWNER="", PARENT_TABLE="LocationRegion"
    CHILD_OWNER="", CHILD_TABLE="ServerLocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_88", FK_COLUMNS="RegionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(RegionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,ServerLocation
      WHERE
        /*  %JoinFKPK(ServerLocation,deleted," = "," AND") */
        ServerLocation.RegionId = deleted.RegionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update LocationRegion because ServerLocation exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  LocationRegion on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="LocationRegion"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="CustomerId" */
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
             @errmsg = 'Cannot update LocationRegion because Customer does not exist.'
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
    /* Stream  Movie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00015ba0", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_91", FK_COLUMNS="CustomerId""CUSTID" */
    IF EXISTS (SELECT * FROM deleted,Stream
      WHERE
        /* %JoinFKPK(deleted,Stream," = "," AND") */
        deleted.CustomerId = Stream.CustomerId AND
        deleted.CUSTID = Stream.CUSTID AND
        NOT EXISTS (
          SELECT * FROM Movie
          WHERE
            /* %JoinFKPK(Movie,Stream," = "," AND") */
            Movie.CustomerId = Stream.CustomerId AND
            Movie.CUSTID = Stream.CUSTID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie because Stream exists.'
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
           @insMovieId char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Stream  Movie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001a6be", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_91", FK_COLUMNS="CustomerId""CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Stream
        WHERE
          /* %JoinFKPK(inserted,Stream) */
          inserted.CustomerId = Stream.CustomerId and
          inserted.CUSTID = Stream.CUSTID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL AND
      inserted.CUSTID IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie because Stream does not exist.'
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
    /* ERWIN_RELATION:CHECKSUM="0007cfd4", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber""CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerCreditCard
      WHERE
        /*  %JoinFKPK(CustomerCreditCard,deleted," = "," AND") */
        CustomerCreditCard.TransactionNumber = deleted.TransactionNumber AND
        CustomerCreditCard.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because CustomerCreditCard exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingPlan  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_100", FK_COLUMNS="StreamingPlanId""CUSTID" */
    IF EXISTS (SELECT * FROM deleted,StreamingPlan
      WHERE
        /* %JoinFKPK(deleted,StreamingPlan," = "," AND") */
        deleted.StreamingPlanId = StreamingPlan.StreamingPlanId AND
        deleted.CUSTID = StreamingPlan.CUSTID AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,StreamingPlan," = "," AND") */
            Payment.StreamingPlanId = StreamingPlan.StreamingPlanId AND
            Payment.CUSTID = StreamingPlan.CUSTID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because StreamingPlan exists.'
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
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Epay
      WHERE
        /* %JoinFKPK(deleted,Epay," = "," AND") */
        deleted.TransactionNumber = Epay.TransactionNumber AND
        deleted.EpayTypeId = Epay.EpayTypeId AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Epay," = "," AND") */
            Payment.TransactionNumber = Epay.TransactionNumber AND
            Payment.EpayTypeId = Epay.EpayTypeId
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
           @insCUSTID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  CustomerCreditCard on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0008a9b1", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber""CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerCreditCard
      WHERE
        /*  %JoinFKPK(CustomerCreditCard,deleted," = "," AND") */
        CustomerCreditCard.TransactionNumber = deleted.TransactionNumber AND
        CustomerCreditCard.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because CustomerCreditCard exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingPlan  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_100", FK_COLUMNS="StreamingPlanId""CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StreamingPlanId) OR
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,StreamingPlan
        WHERE
          /* %JoinFKPK(inserted,StreamingPlan) */
          inserted.StreamingPlanId = StreamingPlan.StreamingPlanId and
          inserted.CUSTID = StreamingPlan.CUSTID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because StreamingPlan does not exist.'
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
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Epay
        WHERE
          /* %JoinFKPK(inserted,Epay) */
          inserted.TransactionNumber = Epay.TransactionNumber and
          inserted.EpayTypeId = Epay.EpayTypeId
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
    /* ERWIN_RELATION:CHECKSUM="0006dad8", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="CustomerId""TransactionNumber""EpayTypeId""StreamingId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerCreditCard
      WHERE
        /*  %JoinFKPK(CustomerCreditCard,deleted," = "," AND") */
        CustomerCreditCard.TransactionNumber = deleted.TransactionNumber AND
        CustomerCreditCard.EpayTypeId = deleted.EpayTypeId AND
        CustomerCreditCard.StreamingId = deleted.StreamingId AND
        CustomerCreditCard.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because CustomerCreditCard exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingPlan  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="CustomerId""StreamingId" */
    IF EXISTS (SELECT * FROM deleted,StreamingPlan
      WHERE
        /* %JoinFKPK(deleted,StreamingPlan," = "," AND") */
        deleted.StreamingId = StreamingPlan.StreamingId AND
        deleted.CustomerId = StreamingPlan.CustomerId AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,StreamingPlan," = "," AND") */
            Payment.StreamingId = StreamingPlan.StreamingId AND
            Payment.CustomerId = StreamingPlan.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because StreamingPlan exists.'
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
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="EpayTypeId""TransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,Epay
      WHERE
        /* %JoinFKPK(deleted,Epay," = "," AND") */
        deleted.TransactionNumber = Epay.TransactionNumber AND
        deleted.EpayTypeId = Epay.EpayTypeId AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Epay," = "," AND") */
            Payment.TransactionNumber = Epay.TransactionNumber AND
            Payment.EpayTypeId = Epay.EpayTypeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Epay exists.'
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
           @insEpayTypeId integer, 
           @insStreamingId integer, 
           @insCustomerId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  CustomerCreditCard on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0007a260", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerCreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CustomerCreditCard_Payment", FK_COLUMNS="TransactionNumber""CustomerId""EpayTypeId""StreamingId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId) OR
    UPDATE(StreamingId) OR
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerCreditCard
      WHERE
        /*  %JoinFKPK(CustomerCreditCard,deleted," = "," AND") */
        CustomerCreditCard.TransactionNumber = deleted.TransactionNumber AND
        CustomerCreditCard.EpayTypeId = deleted.EpayTypeId AND
        CustomerCreditCard.StreamingId = deleted.StreamingId AND
        CustomerCreditCard.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because CustomerCreditCard exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingPlan  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="CustomerId""StreamingId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StreamingId) OR
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,StreamingPlan
        WHERE
          /* %JoinFKPK(inserted,StreamingPlan) */
          inserted.StreamingId = StreamingPlan.StreamingId and
          inserted.CustomerId = StreamingPlan.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because StreamingPlan does not exist.'
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
    FK_CONSTRAINT="FK_Payment_Epay", FK_COLUMNS="EpayTypeId""TransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TransactionNumber) OR
    UPDATE(EpayTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Epay
        WHERE
          /* %JoinFKPK(inserted,Epay) */
          inserted.TransactionNumber = Epay.TransactionNumber and
          inserted.EpayTypeId = Epay.EpayTypeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Epay does not exist.'
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




CREATE TRIGGER tD_ServerLocation ON ServerLocation FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ServerLocation */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* LocationRegion  ServerLocation on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016ca4", PARENT_OWNER="", PARENT_TABLE="LocationRegion"
    CHILD_OWNER="", CHILD_TABLE="ServerLocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_88", FK_COLUMNS="RegionId" */
    IF EXISTS (SELECT * FROM deleted,LocationRegion
      WHERE
        /* %JoinFKPK(deleted,LocationRegion," = "," AND") */
        deleted.RegionId = LocationRegion.RegionId AND
        NOT EXISTS (
          SELECT * FROM ServerLocation
          WHERE
            /* %JoinFKPK(ServerLocation,LocationRegion," = "," AND") */
            ServerLocation.RegionId = LocationRegion.RegionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last ServerLocation because LocationRegion exists.'
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
           @insRegionId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* LocationRegion  ServerLocation on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018927", PARENT_OWNER="", PARENT_TABLE="LocationRegion"
    CHILD_OWNER="", CHILD_TABLE="ServerLocation"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_88", FK_COLUMNS="RegionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(RegionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,LocationRegion
        WHERE
          /* %JoinFKPK(inserted,LocationRegion) */
          inserted.RegionId = LocationRegion.RegionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ServerLocation because LocationRegion does not exist.'
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




CREATE TRIGGER tD_Stream ON Stream FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Stream */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Stream  TVShows on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005288f", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="TVShows"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="CustomerId""CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,TVShows
      WHERE
        /*  %JoinFKPK(TVShows,deleted," = "," AND") */
        TVShows.CustomerId = deleted.CustomerId AND
        TVShows.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Stream because TVShows exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Stream  TVShows on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="TVShows"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_92", FK_COLUMNS="CustomerId""CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,TVShows
      WHERE
        /*  %JoinFKPK(TVShows,deleted," = "," AND") */
        TVShows.CustomerId = deleted.CustomerId AND
        TVShows.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Stream because TVShows exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Stream  Movie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_91", FK_COLUMNS="CustomerId""CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.CustomerId = deleted.CustomerId AND
        Movie.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Stream because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST  Stream on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_93", FK_COLUMNS="CUSTID" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CUSTID = CUST.CUSTID AND
        NOT EXISTS (
          SELECT * FROM Stream
          WHERE
            /* %JoinFKPK(Stream,CUST," = "," AND") */
            Stream.CUSTID = CUST.CUSTID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Stream because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Stream on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_90", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM Stream
          WHERE
            /* %JoinFKPK(Stream,Customer," = "," AND") */
            Stream.CustomerId = Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Stream because Customer exists.'
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


CREATE TRIGGER tU_Stream ON Stream FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Stream */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerId integer, 
           @insCUSTID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Stream  TVShows on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005dd37", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="TVShows"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="CustomerId""CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,TVShows
      WHERE
        /*  %JoinFKPK(TVShows,deleted," = "," AND") */
        TVShows.CustomerId = deleted.CustomerId AND
        TVShows.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Stream because TVShows exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Stream  TVShows on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="TVShows"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_92", FK_COLUMNS="CustomerId""CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,TVShows
      WHERE
        /*  %JoinFKPK(TVShows,deleted," = "," AND") */
        TVShows.CustomerId = deleted.CustomerId AND
        TVShows.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Stream because TVShows exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Stream  Movie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_91", FK_COLUMNS="CustomerId""CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.CustomerId = deleted.CustomerId AND
        Movie.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Stream because Movie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST  Stream on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_93", FK_COLUMNS="CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CUSTID = CUST.CUSTID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Stream because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Stream on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_90", FK_COLUMNS="CustomerId" */
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
             @errmsg = 'Cannot update Stream because Customer does not exist.'
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
    /* StreamingPlan  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000239fa", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_100", FK_COLUMNS="StreamingPlanId""CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.StreamingPlanId = deleted.StreamingPlanId AND
        Payment.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete StreamingPlan because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST  StreamingPlan on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="CUSTID" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CUSTID = CUST.CUSTID AND
        NOT EXISTS (
          SELECT * FROM StreamingPlan
          WHERE
            /* %JoinFKPK(StreamingPlan,CUST," = "," AND") */
            StreamingPlan.CUSTID = CUST.CUSTID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamingPlan because CUST exists.'
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
           @insStreamingPlanId integer, 
           @insCUSTID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* StreamingPlan  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000290e9", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_100", FK_COLUMNS="StreamingPlanId""CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StreamingPlanId) OR
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.StreamingPlanId = deleted.StreamingPlanId AND
        Payment.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update StreamingPlan because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST  StreamingPlan on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CUSTID = CUST.CUSTID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamingPlan because CUST does not exist.'
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
    /* StreamingPlan  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00025e9b", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="CustomerId""StreamingId" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.StreamingId = deleted.StreamingId AND
        Payment.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete StreamingPlan because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  StreamingPlan on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_108", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM StreamingPlan
          WHERE
            /* %JoinFKPK(StreamingPlan,Customer," = "," AND") */
            StreamingPlan.CustomerId = Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamingPlan because Customer exists.'
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
           @insStreamingId integer, 
           @insCustomerId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* StreamingPlan  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b03a", PARENT_OWNER="", PARENT_TABLE="StreamingPlan"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="CustomerId""StreamingId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StreamingId) OR
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.StreamingId = deleted.StreamingId AND
        Payment.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update StreamingPlan because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  StreamingPlan on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="StreamingPlan"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_108", FK_COLUMNS="CustomerId" */
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
             @errmsg = 'Cannot update StreamingPlan because Customer does not exist.'
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




CREATE TRIGGER tD_Subscription ON Subscription FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Subscription */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Subscription  CustomerSupport on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00038b88", PARENT_OWNER="", PARENT_TABLE="Subscription"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="CustomerId""CUSTID" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.CustomerId = deleted.CustomerId AND
        CustomerSupport.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Subscription because CustomerSupport exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST  Subscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="CUSTID" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CUSTID = CUST.CUSTID AND
        NOT EXISTS (
          SELECT * FROM Subscription
          WHERE
            /* %JoinFKPK(Subscription,CUST," = "," AND") */
            Subscription.CUSTID = CUST.CUSTID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Subscription because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Subscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM Subscription
          WHERE
            /* %JoinFKPK(Subscription,Customer," = "," AND") */
            Subscription.CustomerId = Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Subscription because Customer exists.'
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


CREATE TRIGGER tU_Subscription ON Subscription FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Subscription */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerId integer, 
           @insCUSTID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Subscription  CustomerSupport on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003df4e", PARENT_OWNER="", PARENT_TABLE="Subscription"
    CHILD_OWNER="", CHILD_TABLE="CustomerSupport"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="CustomerId""CUSTID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(CUSTID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerSupport
      WHERE
        /*  %JoinFKPK(CustomerSupport,deleted," = "," AND") */
        CustomerSupport.CustomerId = deleted.CustomerId AND
        CustomerSupport.CUSTID = deleted.CUSTID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Subscription because CustomerSupport exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST  Subscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CUSTID = CUST.CUSTID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Subscription because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Subscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="CustomerId" */
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
             @errmsg = 'Cannot update Subscription because Customer does not exist.'
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




CREATE TRIGGER tD_TVShows ON TVShows FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on TVShows */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Stream  TVShows on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016953", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="TVShows"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_92", FK_COLUMNS="CustomerId""CUSTID" */
    IF EXISTS (SELECT * FROM deleted,Stream
      WHERE
        /* %JoinFKPK(deleted,Stream," = "," AND") */
        deleted.CustomerId = Stream.CustomerId AND
        deleted.CUSTID = Stream.CUSTID AND
        NOT EXISTS (
          SELECT * FROM TVShows
          WHERE
            /* %JoinFKPK(TVShows,Stream," = "," AND") */
            TVShows.CustomerId = Stream.CustomerId AND
            TVShows.CUSTID = Stream.CUSTID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last TVShows because Stream exists.'
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


CREATE TRIGGER tU_TVShows ON TVShows FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on TVShows */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insTVShowId char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Stream  TVShows on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001b358", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="TVShows"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_92", FK_COLUMNS="CustomerId""CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Stream
        WHERE
          /* %JoinFKPK(inserted,Stream) */
          inserted.CustomerId = Stream.CustomerId and
          inserted.CUSTID = Stream.CUSTID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL AND
      inserted.CUSTID IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update TVShows because Stream does not exist.'
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




CREATE TRIGGER tD_TVShows ON TVShows FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on TVShows */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Stream  TVShows on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000171c8", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="TVShows"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="CustomerId""CUSTID" */
    IF EXISTS (SELECT * FROM deleted,Stream
      WHERE
        /* %JoinFKPK(deleted,Stream," = "," AND") */
        deleted.CustomerId = Stream.CustomerId AND
        deleted.CUSTID = Stream.CUSTID AND
        NOT EXISTS (
          SELECT * FROM TVShows
          WHERE
            /* %JoinFKPK(TVShows,Stream," = "," AND") */
            TVShows.CustomerId = Stream.CustomerId AND
            TVShows.CUSTID = Stream.CUSTID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last TVShows because Stream exists.'
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


CREATE TRIGGER tU_TVShows ON TVShows FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on TVShows */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insTVShowId char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Stream  TVShows on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001bcec", PARENT_OWNER="", PARENT_TABLE="Stream"
    CHILD_OWNER="", CHILD_TABLE="TVShows"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="CustomerId""CUSTID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(CUSTID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Stream
        WHERE
          /* %JoinFKPK(inserted,Stream) */
          inserted.CustomerId = Stream.CustomerId and
          inserted.CUSTID = Stream.CUSTID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL AND
      inserted.CUSTID IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update TVShows because Stream does not exist.'
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


