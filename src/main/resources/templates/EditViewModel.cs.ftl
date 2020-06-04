using System;

namespace Luxshare.Api.ViewModels.Report.${entityName}
{
    /// <summary>
    /// 
    /// </summary>
    public class ${entityName}EditViewModel
    {

        public Guid Guid { get; set; }

    <#list columns as column>
        public ${column.propertyType} ${column.columnName} { get; set; }

    </#list>

    }

}