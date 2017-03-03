using System;
using System.ComponentModel.DataAnnotations;
using Apl.Business.Constraints;

namespace Apl.Business.Domain
{
    [MetadataType(typeof (EntidadMetaData))]
    public partial class entidad
    {
        public string TipoToString => IsNatural ? "Natural" : "Jurídica";

        public char TipoToChar => IsNatural ? 'N' : 'J';

        public static string TipoByBool(bool isNatural)
        {
            return isNatural ? "Natural" : "Jurídica";
        }

        public static char CharTipoByBool(bool isNatural)
        {
            return isNatural ? 'N' : 'J';
        }

        public string PhoneComplete => Phone !=null? $"+{Phone}" : string.Empty;

        public string MovilComplete => Movil != null ? $"+{Movil}" : string.Empty;

        public string Desc => IsNatural ? !string.IsNullOrEmpty(Apellidos) ? $"{Nombre} {Apellidos} | {CodId}": $"{Nombre} | {CodId}": $"{Nombre} | {CodId}";

        public string NombreComplete => IsNatural ? !string.IsNullOrEmpty(Apellidos) ? $"{Nombre} {Apellidos}" : $"{Nombre}" :$"{Nombre}";

        public string OnlyPhone => Phone ?? Movil;
    }

    public class EntidadMetaData
    {

        [Required(ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "Required")]
        [Display(Name = "EntityLargeName", ShortName = "Entity", ResourceType = typeof(Resources.CI.Names))]
        public int Id { get; set; }

        [Required(ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "Required")]
        [StringLength(GeneralConstraints.StringLengthNames, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "StringLength")]
        [Display(Name = "MyNames", ResourceType = typeof(Resources.Names))]
        [RegularExpression(GeneralConstraints.RegExpressionTrim, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "NoTrimString")]
        public string Nombre { get; set; }

        [StringLength(GeneralConstraints.StringLengthLastNames, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "StringLength")]
        [RegularExpression(GeneralConstraints.RegExpressionTrim, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "NoTrimString")]
        [Display(Name = "LastNames", ResourceType = typeof(Resources.Names))]
        public string Apellidos { get; set; }


        [Required(ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "Required")]
        [StringLength(GeneralConstraints.StringLengthId, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "StringLength")]
        [Display(Name = "Id", ResourceType = typeof(Resources.Names))]
        [RegularExpression(GeneralConstraints.RegExpressionTrim, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "NoTrimString")]
        public string CodId { get; set; }

        [StringLength(GeneralConstraints.StringLengthEmail, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "StringLength")]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(GeneralConstraints.RegExpressionEmail, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "InvalidEmail")]
        [Display(Name = "Email", ResourceType = typeof(Resources.Names))]
        public string Email { get; set; }

        [Required(ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "Required")]
        [StringLength(GeneralConstraints.StringLengthEmail, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "StringLength")]
        [RegularExpression(GeneralConstraints.RegExpressionTrim, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "NoTrimString")]
        [Display(Name = "Address", ResourceType = typeof(Resources.Names))]
        public string Direccion { get; set; }

        [StringLength(GeneralConstraints.StringLengthPhone, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "StringLength")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(GeneralConstraints.RegExpressionPhone, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "InvalidPhone")]
        [Display(Name = "Phone",  Prompt = "PromptPhone",  ResourceType = typeof(Resources.Names))]
        public string Phone { get; set; }

        [StringLength(GeneralConstraints.StringLengthPhone, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "StringLength")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(GeneralConstraints.RegExpressionCell, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "InvalidCell")]
        [Display(Name = "Cell",  ResourceType = typeof(Resources.Names))]
        public string Movil { get; set; }

        [Required(ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "Required")]
        [Display(Name = "IsNatural", ResourceType = typeof(Resources.CI.Names))]
        public bool IsNatural { get; set; }

        [Required(ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "Required")]
        [Range(1, Int32.MaxValue, ErrorMessageResourceType = typeof(Resources.Errores), ErrorMessageResourceName = "NoSelect")]
        [Display(Name = "Country", ResourceType = typeof(Resources.CI.Names))]
        public int IdPais { get; set; }


    }
}
