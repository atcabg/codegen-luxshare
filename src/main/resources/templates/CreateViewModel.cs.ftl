using System;
using static Luxshare.Api.Entities.Enums.CommonEnum;

namespace Luxshare.Api.ViewModels.Report.${entityName}
{
    /// <summary>
    /// 
    /// </summary>
    public class ${entityName}CreateViewModel
    {
    <#list columns as column>
        public ${column.propertyType} ${column.columnName} { get; set; }

    </#list>

    }

}