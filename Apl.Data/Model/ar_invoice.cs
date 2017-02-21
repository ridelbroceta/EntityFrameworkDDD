
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace Apl.Data.Model
{

using System;
    using System.Collections.Generic;
    
public partial class ar_invoice
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public ar_invoice()
    {

        this.ArTaxInvcs = new HashSet<ar_taxinvc>();

        this.ArDeductionInvs = new HashSet<ar_deducinvc>();

        this.ArInvDetails = new HashSet<ar_invdetail>();

    }


    public int Id { get; set; }

    public System.DateTime TranDate { get; set; }

    public byte TranType { get; set; }

    public decimal TranAmt { get; set; }

    public string Cmnt { get; set; }

    public int IdMPeriod { get; set; }

    public int UserCreated { get; set; }

    public System.DateTime DateCreated { get; set; }

    public Nullable<int> UserUpdated { get; set; }

    public Nullable<System.DateTime> DateUpdated { get; set; }

    public int IdCliente { get; set; }

    public int IdCCliente { get; set; }

    public Nullable<System.DateTime> DateCanceled { get; set; }

    public decimal TaxAmt { get; set; }

    public decimal Descount { get; set; }

    public bool IsCancel { get; set; }

    public bool IsPend { get; set; }

    public Nullable<System.DateTime> DatePayed { get; set; }

    public string CodId { get; set; }

    public string ANombre { get; set; }

    public int TranNo { get; set; }

    public byte ToMonth { get; set; }

    public decimal TranAmtHc { get; set; }

    public string Direccion { get; set; }

    public string EntityType { get; set; }

    public short ToYear { get; set; }

    public decimal SubTotal { get; set; }

    public decimal Base0 { get; set; }

    public decimal BaseIVA { get; set; }

    public decimal IVA { get; set; }

    public string Phone { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<ar_taxinvc> ArTaxInvcs { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<ar_deducinvc> ArDeductionInvs { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<ar_invdetail> ArInvDetails { get; set; }

    public virtual ar_ccliente ArCCliente { get; set; }

    public virtual ar_cliente ArCliente { get; set; }

}

}
