﻿using System;

namespace Luxshare.Api.RequestPayload.Report.${entityName}
{

    public class ${entityName}RequestPayload : RequestPayload
    {

    <#list columns as column>
        public ${column.propertyType} ${column.columnName} { get; set; }

    </#list>
    }
}
