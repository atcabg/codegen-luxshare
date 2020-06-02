using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using static Luxshare.Api.Entities.Enums.CommonEnum;

namespace Luxshare.Api.ViewModels.Report.${entityName}
{
    /// <summary>
    /// 
    /// </summary>
    public class ${entityName}JsonModel
    {
        public Guid Guid { get; set; }

    <#list columns as column>
        public ${column.propertyType} ${column.columnName} { get; set; }

    </#list>
        public IsDeleted IsDeleted { get; set; }

        public DateTime CreatedOn { get; set; }

        public Guid CreatedByUserGuid { get; set; }

        public string CreatedByUserName { get; set; }

        public DateTime? ModifiedOn { get; set; }

        public Guid? ModifiedByUserGuid { get; set; }

        public string ModifiedByUserName { get; set; }
    }

}