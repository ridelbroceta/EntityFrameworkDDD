﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Apl.Business.Domain;


namespace Apl.Data.Model
{
    public partial class DefaultContext : DbContext
{
    public DefaultContext()
        : base("name=DefaultContext")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<gl_option> gl_options { get; set; }

    public virtual DbSet<gl_natural_acct> gl_natural_accts { get; set; }

    public virtual DbSet<gl_account> gl_accounts { get; set; }

    public virtual DbSet<gl_acctcat> gl_acctcats { get; set; }

    public virtual DbSet<gl_voucher> gl_vouchers { get; set; }

    public virtual DbSet<gl_transaction> gl_transactions { get; set; }

    public virtual DbSet<entidad> entidades { get; set; }

    public virtual DbSet<ar_option> ar_options { get; set; }

    public virtual DbSet<ar_ccliente> ar_cclientes { get; set; }

    public virtual DbSet<ar_cliente> ar_clientes { get; set; }

    public virtual DbSet<ie_subcat> ie_subcats { get; set; }

    public virtual DbSet<ar_invoice> ar_invoices { get; set; }

    public virtual DbSet<ar_taxinvc> ar_taxinvcs { get; set; }

    public virtual DbSet<ar_deducinvc> ar_deducinvcs { get; set; }

    public virtual DbSet<ar_invdetail> ar_invdetails { get; set; }

}

}

