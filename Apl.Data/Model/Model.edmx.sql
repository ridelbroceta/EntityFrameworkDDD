
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/09/2017 18:50:37
-- Generated from EDMX file: C:\ridel\net\nettoGit\EntityFrameworkDDD\Apl.Data\Model\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Facade];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_gl_option_gl_voucher]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[gl_vouchers] DROP CONSTRAINT [FK_gl_option_gl_voucher];
GO
IF OBJECT_ID(N'[dbo].[FK_gl_option_gl_natural_acct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[gl_natural_accts] DROP CONSTRAINT [FK_gl_option_gl_natural_acct];
GO
IF OBJECT_ID(N'[dbo].[FK_gl_account_gl_transaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[gl_transactions] DROP CONSTRAINT [FK_gl_account_gl_transaction];
GO
IF OBJECT_ID(N'[dbo].[FK_gl_natural_acct_gl_account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[gl_accounts] DROP CONSTRAINT [FK_gl_natural_acct_gl_account];
GO
IF OBJECT_ID(N'[dbo].[FK_gl_acctcat_gl_natural_acct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[gl_natural_accts] DROP CONSTRAINT [FK_gl_acctcat_gl_natural_acct];
GO
IF OBJECT_ID(N'[dbo].[FK_ar_option_ar_ccliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_cclientes] DROP CONSTRAINT [FK_ar_option_ar_ccliente];
GO
IF OBJECT_ID(N'[dbo].[FK_ar_ccliente_ar_cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_clientes] DROP CONSTRAINT [FK_ar_ccliente_ar_cliente];
GO
IF OBJECT_ID(N'[dbo].[FK_ar_invoice_ar_taxinvc]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_taxinvcs] DROP CONSTRAINT [FK_ar_invoice_ar_taxinvc];
GO
IF OBJECT_ID(N'[dbo].[FK_ar_invoice_ar_deducinv]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_deducinvcs] DROP CONSTRAINT [FK_ar_invoice_ar_deducinv];
GO
IF OBJECT_ID(N'[dbo].[FK_ar_invoice_ar_invdetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_invdetails] DROP CONSTRAINT [FK_ar_invoice_ar_invdetail];
GO
IF OBJECT_ID(N'[dbo].[FK_gl_voucher_gl_transaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[gl_transactions] DROP CONSTRAINT [FK_gl_voucher_gl_transaction];
GO
IF OBJECT_ID(N'[dbo].[FK_gl_account_ar_option]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_options] DROP CONSTRAINT [FK_gl_account_ar_option];
GO
IF OBJECT_ID(N'[dbo].[FK_gl_account_ar_ccliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_cclientes] DROP CONSTRAINT [FK_gl_account_ar_ccliente];
GO
IF OBJECT_ID(N'[dbo].[FK_entidad_ar_cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_clientes] DROP CONSTRAINT [FK_entidad_ar_cliente];
GO
IF OBJECT_ID(N'[dbo].[FK_ie_subcat_ar_invdetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_invdetails] DROP CONSTRAINT [FK_ie_subcat_ar_invdetail];
GO
IF OBJECT_ID(N'[dbo].[FK_ar_ccliente_ar_invoice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_invoices] DROP CONSTRAINT [FK_ar_ccliente_ar_invoice];
GO
IF OBJECT_ID(N'[dbo].[FK_ar_clientear_invoice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ar_invoices] DROP CONSTRAINT [FK_ar_clientear_invoice];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[gl_options]', 'U') IS NOT NULL
    DROP TABLE [dbo].[gl_options];
GO
IF OBJECT_ID(N'[dbo].[gl_natural_accts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[gl_natural_accts];
GO
IF OBJECT_ID(N'[dbo].[gl_accounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[gl_accounts];
GO
IF OBJECT_ID(N'[dbo].[gl_acctcats]', 'U') IS NOT NULL
    DROP TABLE [dbo].[gl_acctcats];
GO
IF OBJECT_ID(N'[dbo].[gl_vouchers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[gl_vouchers];
GO
IF OBJECT_ID(N'[dbo].[gl_transactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[gl_transactions];
GO
IF OBJECT_ID(N'[dbo].[entidades]', 'U') IS NOT NULL
    DROP TABLE [dbo].[entidades];
GO
IF OBJECT_ID(N'[dbo].[ar_options]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ar_options];
GO
IF OBJECT_ID(N'[dbo].[ar_cclientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ar_cclientes];
GO
IF OBJECT_ID(N'[dbo].[ar_clientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ar_clientes];
GO
IF OBJECT_ID(N'[dbo].[ie_subcats]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ie_subcats];
GO
IF OBJECT_ID(N'[dbo].[ar_invoices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ar_invoices];
GO
IF OBJECT_ID(N'[dbo].[ar_taxinvcs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ar_taxinvcs];
GO
IF OBJECT_ID(N'[dbo].[ar_deducinvcs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ar_deducinvcs];
GO
IF OBJECT_ID(N'[dbo].[ar_invdetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ar_invdetails];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'gl_options'
CREATE TABLE [dbo].[gl_options] (
    [IdEdif] int  NOT NULL,
    [AcctMask] nvarchar(50)  NOT NULL,
    [AcctMaskDelimiter] nchar(1)  NOT NULL,
    [AcctNoSize] tinyint  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [NextVoucherNo] smallint  NOT NULL
);
GO

-- Creating table 'gl_natural_accts'
CREATE TABLE [dbo].[gl_natural_accts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NaturalAcctNo] nvarchar(5)  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [IdAcctCat] int  NOT NULL,
    [IdEdif] int  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [IsActive] bit  NOT NULL
);
GO

-- Creating table 'gl_accounts'
CREATE TABLE [dbo].[gl_accounts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GlAcctNo] nvarchar(50)  NOT NULL,
    [Nombre] nvarchar(100)  NOT NULL,
    [IsActive] bit  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [IdNaturalAcct] int  NOT NULL
);
GO

-- Creating table 'gl_acctcats'
CREATE TABLE [dbo].[gl_acctcats] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [IsActive] bit  NOT NULL
);
GO

-- Creating table 'gl_vouchers'
CREATE TABLE [dbo].[gl_vouchers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [IdEdif] int  NOT NULL,
    [TranDate] datetime  NOT NULL,
    [IdMPeriod] int  NOT NULL,
    [TranKey] int  NOT NULL,
    [IsCancel] bit  NOT NULL,
    [DateCanceled] datetime  NULL,
    [VoucherId] nvarchar(20)  NOT NULL,
    [Cmnt] nvarchar(255)  NOT NULL,
    [TranType] tinyint  NOT NULL,
    [Modulo] nchar(2)  NOT NULL,
    [VoucherNo] int  NOT NULL
);
GO

-- Creating table 'gl_transactions'
CREATE TABLE [dbo].[gl_transactions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdGlAcct] int  NOT NULL,
    [TranAmt] decimal(19,2)  NOT NULL,
    [Cmnt] nvarchar(255)  NOT NULL,
    [TranId] nvarchar(20)  NOT NULL,
    [SubTranType] tinyint  NOT NULL,
    [IdVoucher] int  NOT NULL
);
GO

-- Creating table 'entidades'
CREATE TABLE [dbo].[entidades] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(100)  NOT NULL,
    [Apellidos] nvarchar(50)  NULL,
    [CodId] nvarchar(13)  NOT NULL,
    [IsNatural] bit  NOT NULL,
    [IsActive] bit  NOT NULL,
    [Email] nvarchar(100)  NULL,
    [Phone] nvarchar(20)  NULL,
    [Movil] nvarchar(20)  NULL,
    [IdPais] int  NOT NULL,
    [IdAdminPropiedades] int  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [Direccion] nvarchar(255)  NOT NULL
);
GO

-- Creating table 'ar_options'
CREATE TABLE [dbo].[ar_options] (
    [IdEdif] int  NOT NULL,
    [NextInvcNo] int  NOT NULL,
    [InvcNoSize] tinyint  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [IdGlAcctAnticipo] int  NULL
);
GO

-- Creating table 'ar_cclientes'
CREATE TABLE [dbo].[ar_cclientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ArCClienteCod] nvarchar(10)  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [IdEdif] int  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [IsActive] bit  NOT NULL,
    [IdGlAcct] int  NOT NULL
);
GO

-- Creating table 'ar_clientes'
CREATE TABLE [dbo].[ar_clientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdCCliente] int  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [IsActive] bit  NOT NULL,
    [Flag1] bit  NOT NULL,
    [IdEntidad] int  NOT NULL
);
GO

-- Creating table 'ie_subcats'
CREATE TABLE [dbo].[ie_subcats] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IgEgSubCatCod] nvarchar(15)  NOT NULL,
    [Concepto] nvarchar(100)  NOT NULL,
    [IdIgEgCat] int  NOT NULL,
    [ReadOnly] bit  NOT NULL,
    [IdGlAcct] int  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [IsActive] bit  NOT NULL,
    [IdClassTax] int  NULL,
    [IdClassDeduc] int  NULL,
    [Precio] decimal(19,2)  NOT NULL,
    [IsExpense] bit  NOT NULL
);
GO

-- Creating table 'ar_invoices'
CREATE TABLE [dbo].[ar_invoices] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TranDate] datetime  NOT NULL,
    [TranType] tinyint  NOT NULL,
    [TranAmt] decimal(19,2)  NOT NULL,
    [Cmnt] nvarchar(255)  NOT NULL,
    [IdMPeriod] int  NOT NULL,
    [UserCreated] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserUpdated] int  NULL,
    [DateUpdated] datetime  NULL,
    [IdCliente] int  NOT NULL,
    [IdCCliente] int  NOT NULL,
    [DateCanceled] datetime  NULL,
    [TaxAmt] decimal(19,2)  NOT NULL,
    [Descount] decimal(19,2)  NOT NULL,
    [IsCancel] bit  NOT NULL,
    [IsPend] bit  NOT NULL,
    [DatePayed] datetime  NULL,
    [CodId] nvarchar(13)  NOT NULL,
    [ANombre] nvarchar(150)  NOT NULL,
    [TranNo] int  NOT NULL,
    [ToMonth] tinyint  NOT NULL,
    [TranAmtHc] decimal(19,2)  NOT NULL,
    [Direccion] nvarchar(255)  NOT NULL,
    [EntityType] nchar(1)  NOT NULL,
    [ToYear] smallint  NOT NULL,
    [SubTotal] decimal(19,2)  NOT NULL,
    [Base0] decimal(19,2)  NOT NULL,
    [BaseIVA] decimal(19,2)  NOT NULL,
    [IVA] decimal(19,2)  NOT NULL,
    [Phone] nvarchar(20)  NULL
);
GO

-- Creating table 'ar_taxinvcs'
CREATE TABLE [dbo].[ar_taxinvcs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdInvoice] int  NOT NULL,
    [TaxAmt] decimal(19,2)  NOT NULL,
    [IsPercentage] bit  NOT NULL,
    [Valor] decimal(19,2)  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [IsIva] bit  NOT NULL,
    [Base] decimal(19,2)  NOT NULL
);
GO

-- Creating table 'ar_deducinvcs'
CREATE TABLE [dbo].[ar_deducinvcs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdInvoice] int  NOT NULL,
    [DeducAmt] decimal(19,2)  NOT NULL,
    [IsPercentage] bit  NOT NULL,
    [Valor] decimal(19,2)  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [IsPtoPago] bit  NOT NULL,
    [Base] decimal(19,2)  NOT NULL
);
GO

-- Creating table 'ar_invdetails'
CREATE TABLE [dbo].[ar_invdetails] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdInvoice] int  NOT NULL,
    [IdIgEgSubCat] int  NOT NULL,
    [Valor] decimal(19,2)  NOT NULL,
    [Descount] decimal(19,2)  NOT NULL,
    [TaxAmt] decimal(19,2)  NOT NULL,
    [Base] decimal(19,2)  NOT NULL,
    [Precio] decimal(19,2)  NOT NULL,
    [Qty] decimal(19,2)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdEdif] in table 'gl_options'
ALTER TABLE [dbo].[gl_options]
ADD CONSTRAINT [PK_gl_options]
    PRIMARY KEY CLUSTERED ([IdEdif] ASC);
GO

-- Creating primary key on [Id] in table 'gl_natural_accts'
ALTER TABLE [dbo].[gl_natural_accts]
ADD CONSTRAINT [PK_gl_natural_accts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'gl_accounts'
ALTER TABLE [dbo].[gl_accounts]
ADD CONSTRAINT [PK_gl_accounts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'gl_acctcats'
ALTER TABLE [dbo].[gl_acctcats]
ADD CONSTRAINT [PK_gl_acctcats]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'gl_vouchers'
ALTER TABLE [dbo].[gl_vouchers]
ADD CONSTRAINT [PK_gl_vouchers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'gl_transactions'
ALTER TABLE [dbo].[gl_transactions]
ADD CONSTRAINT [PK_gl_transactions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'entidades'
ALTER TABLE [dbo].[entidades]
ADD CONSTRAINT [PK_entidades]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [IdEdif] in table 'ar_options'
ALTER TABLE [dbo].[ar_options]
ADD CONSTRAINT [PK_ar_options]
    PRIMARY KEY CLUSTERED ([IdEdif] ASC);
GO

-- Creating primary key on [Id] in table 'ar_cclientes'
ALTER TABLE [dbo].[ar_cclientes]
ADD CONSTRAINT [PK_ar_cclientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ar_clientes'
ALTER TABLE [dbo].[ar_clientes]
ADD CONSTRAINT [PK_ar_clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ie_subcats'
ALTER TABLE [dbo].[ie_subcats]
ADD CONSTRAINT [PK_ie_subcats]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ar_invoices'
ALTER TABLE [dbo].[ar_invoices]
ADD CONSTRAINT [PK_ar_invoices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ar_taxinvcs'
ALTER TABLE [dbo].[ar_taxinvcs]
ADD CONSTRAINT [PK_ar_taxinvcs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ar_deducinvcs'
ALTER TABLE [dbo].[ar_deducinvcs]
ADD CONSTRAINT [PK_ar_deducinvcs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ar_invdetails'
ALTER TABLE [dbo].[ar_invdetails]
ADD CONSTRAINT [PK_ar_invdetails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IdEdif] in table 'gl_vouchers'
ALTER TABLE [dbo].[gl_vouchers]
ADD CONSTRAINT [FK_gl_option_gl_voucher]
    FOREIGN KEY ([IdEdif])
    REFERENCES [dbo].[gl_options]
        ([IdEdif])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_gl_option_gl_voucher'
CREATE INDEX [IX_FK_gl_option_gl_voucher]
ON [dbo].[gl_vouchers]
    ([IdEdif]);
GO

-- Creating foreign key on [IdEdif] in table 'gl_natural_accts'
ALTER TABLE [dbo].[gl_natural_accts]
ADD CONSTRAINT [FK_gl_option_gl_natural_acct]
    FOREIGN KEY ([IdEdif])
    REFERENCES [dbo].[gl_options]
        ([IdEdif])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_gl_option_gl_natural_acct'
CREATE INDEX [IX_FK_gl_option_gl_natural_acct]
ON [dbo].[gl_natural_accts]
    ([IdEdif]);
GO

-- Creating foreign key on [IdGlAcct] in table 'gl_transactions'
ALTER TABLE [dbo].[gl_transactions]
ADD CONSTRAINT [FK_gl_account_gl_transaction]
    FOREIGN KEY ([IdGlAcct])
    REFERENCES [dbo].[gl_accounts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_gl_account_gl_transaction'
CREATE INDEX [IX_FK_gl_account_gl_transaction]
ON [dbo].[gl_transactions]
    ([IdGlAcct]);
GO

-- Creating foreign key on [IdNaturalAcct] in table 'gl_accounts'
ALTER TABLE [dbo].[gl_accounts]
ADD CONSTRAINT [FK_gl_natural_acct_gl_account]
    FOREIGN KEY ([IdNaturalAcct])
    REFERENCES [dbo].[gl_natural_accts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_gl_natural_acct_gl_account'
CREATE INDEX [IX_FK_gl_natural_acct_gl_account]
ON [dbo].[gl_accounts]
    ([IdNaturalAcct]);
GO

-- Creating foreign key on [IdAcctCat] in table 'gl_natural_accts'
ALTER TABLE [dbo].[gl_natural_accts]
ADD CONSTRAINT [FK_gl_acctcat_gl_natural_acct]
    FOREIGN KEY ([IdAcctCat])
    REFERENCES [dbo].[gl_acctcats]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_gl_acctcat_gl_natural_acct'
CREATE INDEX [IX_FK_gl_acctcat_gl_natural_acct]
ON [dbo].[gl_natural_accts]
    ([IdAcctCat]);
GO

-- Creating foreign key on [IdEdif] in table 'ar_cclientes'
ALTER TABLE [dbo].[ar_cclientes]
ADD CONSTRAINT [FK_ar_option_ar_ccliente]
    FOREIGN KEY ([IdEdif])
    REFERENCES [dbo].[ar_options]
        ([IdEdif])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ar_option_ar_ccliente'
CREATE INDEX [IX_FK_ar_option_ar_ccliente]
ON [dbo].[ar_cclientes]
    ([IdEdif]);
GO

-- Creating foreign key on [IdCCliente] in table 'ar_clientes'
ALTER TABLE [dbo].[ar_clientes]
ADD CONSTRAINT [FK_ar_ccliente_ar_cliente]
    FOREIGN KEY ([IdCCliente])
    REFERENCES [dbo].[ar_cclientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ar_ccliente_ar_cliente'
CREATE INDEX [IX_FK_ar_ccliente_ar_cliente]
ON [dbo].[ar_clientes]
    ([IdCCliente]);
GO

-- Creating foreign key on [IdInvoice] in table 'ar_taxinvcs'
ALTER TABLE [dbo].[ar_taxinvcs]
ADD CONSTRAINT [FK_ar_invoice_ar_taxinvc]
    FOREIGN KEY ([IdInvoice])
    REFERENCES [dbo].[ar_invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ar_invoice_ar_taxinvc'
CREATE INDEX [IX_FK_ar_invoice_ar_taxinvc]
ON [dbo].[ar_taxinvcs]
    ([IdInvoice]);
GO

-- Creating foreign key on [IdInvoice] in table 'ar_deducinvcs'
ALTER TABLE [dbo].[ar_deducinvcs]
ADD CONSTRAINT [FK_ar_invoice_ar_deducinv]
    FOREIGN KEY ([IdInvoice])
    REFERENCES [dbo].[ar_invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ar_invoice_ar_deducinv'
CREATE INDEX [IX_FK_ar_invoice_ar_deducinv]
ON [dbo].[ar_deducinvcs]
    ([IdInvoice]);
GO

-- Creating foreign key on [IdInvoice] in table 'ar_invdetails'
ALTER TABLE [dbo].[ar_invdetails]
ADD CONSTRAINT [FK_ar_invoice_ar_invdetail]
    FOREIGN KEY ([IdInvoice])
    REFERENCES [dbo].[ar_invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ar_invoice_ar_invdetail'
CREATE INDEX [IX_FK_ar_invoice_ar_invdetail]
ON [dbo].[ar_invdetails]
    ([IdInvoice]);
GO

-- Creating foreign key on [IdVoucher] in table 'gl_transactions'
ALTER TABLE [dbo].[gl_transactions]
ADD CONSTRAINT [FK_gl_voucher_gl_transaction]
    FOREIGN KEY ([IdVoucher])
    REFERENCES [dbo].[gl_vouchers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_gl_voucher_gl_transaction'
CREATE INDEX [IX_FK_gl_voucher_gl_transaction]
ON [dbo].[gl_transactions]
    ([IdVoucher]);
GO

-- Creating foreign key on [IdGlAcctAnticipo] in table 'ar_options'
ALTER TABLE [dbo].[ar_options]
ADD CONSTRAINT [FK_gl_account_ar_option]
    FOREIGN KEY ([IdGlAcctAnticipo])
    REFERENCES [dbo].[gl_accounts]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_gl_account_ar_option'
CREATE INDEX [IX_FK_gl_account_ar_option]
ON [dbo].[ar_options]
    ([IdGlAcctAnticipo]);
GO

-- Creating foreign key on [IdGlAcct] in table 'ar_cclientes'
ALTER TABLE [dbo].[ar_cclientes]
ADD CONSTRAINT [FK_gl_account_ar_ccliente]
    FOREIGN KEY ([IdGlAcct])
    REFERENCES [dbo].[gl_accounts]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_gl_account_ar_ccliente'
CREATE INDEX [IX_FK_gl_account_ar_ccliente]
ON [dbo].[ar_cclientes]
    ([IdGlAcct]);
GO

-- Creating foreign key on [IdEntidad] in table 'ar_clientes'
ALTER TABLE [dbo].[ar_clientes]
ADD CONSTRAINT [FK_entidad_ar_cliente]
    FOREIGN KEY ([IdEntidad])
    REFERENCES [dbo].[entidades]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_entidad_ar_cliente'
CREATE INDEX [IX_FK_entidad_ar_cliente]
ON [dbo].[ar_clientes]
    ([IdEntidad]);
GO

-- Creating foreign key on [IdIgEgSubCat] in table 'ar_invdetails'
ALTER TABLE [dbo].[ar_invdetails]
ADD CONSTRAINT [FK_ie_subcat_ar_invdetail]
    FOREIGN KEY ([IdIgEgSubCat])
    REFERENCES [dbo].[ie_subcats]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ie_subcat_ar_invdetail'
CREATE INDEX [IX_FK_ie_subcat_ar_invdetail]
ON [dbo].[ar_invdetails]
    ([IdIgEgSubCat]);
GO

-- Creating foreign key on [IdCCliente] in table 'ar_invoices'
ALTER TABLE [dbo].[ar_invoices]
ADD CONSTRAINT [FK_ar_ccliente_ar_invoice]
    FOREIGN KEY ([IdCCliente])
    REFERENCES [dbo].[ar_cclientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ar_ccliente_ar_invoice'
CREATE INDEX [IX_FK_ar_ccliente_ar_invoice]
ON [dbo].[ar_invoices]
    ([IdCCliente]);
GO

-- Creating foreign key on [IdCliente] in table 'ar_invoices'
ALTER TABLE [dbo].[ar_invoices]
ADD CONSTRAINT [FK_ar_clientear_invoice]
    FOREIGN KEY ([IdCliente])
    REFERENCES [dbo].[ar_clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ar_clientear_invoice'
CREATE INDEX [IX_FK_ar_clientear_invoice]
ON [dbo].[ar_invoices]
    ([IdCliente]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------