using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Luxshare.Api.Entities.Report
{
    /// <summary>
    /// 
    /// </summary>
    public class ${entityName}
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Key]
        [DefaultValue("newid()")]
        public Guid Guid { get; set; }

    <#list columns as column>
    <#if (column.length??) >
        [Column(TypeName = "${column.columnType}<#if (column.length != 0) >(${column.length})</#if>")]</#if>
        public ${column.propertyType} ${column.columnName} { get; set; }

    </#list>
    }

}