using AutoMapper;
using Luxshare.Api.Entities;
using Luxshare.Api.Entities.Report;
using Luxshare.Api.Extensions;
using Luxshare.Api.RequestPayload.Report.${entityName};
using Luxshare.Api.ViewModels.Report.${entityName};
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;

namespace Luxshare.Api.Controllers.Api.V1.Rbac
{
    /// <summary>
    /// 
    /// </summary>
    //[CustomAuthorize]
    [Route("api/v1/rbac/[controller]/[action]")]
    [ApiController]
    public class ${entityName}Controller : ControllerBase
    {
        private readonly MasterDbContext _masterContext;
        private readonly IMapper _mapper;

        /// <summary>
        /// 
        /// </summary>
        public ${entityName}Controller(MasterDbContext masterContext, IMapper mapper)
        {
            _masterContext = masterContext;
            _mapper = mapper;
        }

        /// <summary>
        /// 
        /// </summary>
        [HttpPost]
        public IActionResult List(${entityName}RequestPayload payload)
        {
            using (_masterContext)
            {
                var query = _masterContext.${entityName}.AsQueryable();
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();
                var totalCount = query.Count();
                var data = list.Select(_mapper.Map<${entityName}, ${entityName}JsonModel>);
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(data, totalCount);
                return Ok(response);
            }
        }

        /// <summary>
        ///
        /// </summary>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult Create(${entityName}CreateViewModel model)
        {
            using (_masterContext)
            {
                var entity = _mapper.Map<${entityName}CreateViewModel, ${entityName}>(model);
                entity.Guid = Guid.NewGuid();
            <#list columns as column>
                entity.${column.columnName} = model.${column.columnName};
            </#list>
                _masterContext.${entityName}.Add(entity);
                _masterContext.SaveChanges();
                var response = ResponseModelFactory.CreateInstance;
                response.SetSuccess();
                return Ok(response);
            }
        }

        [HttpGet("{guid}")]
        [ProducesResponseType(200)]
        public IActionResult Edit(Guid guid)
        {
            using (_masterContext)
            {
            var entity = _masterContext.${entityName}.FirstOrDefault(x => x.Guid == guid);
            var response = ResponseModelFactory.CreateInstance;
            response.SetData(_mapper.Map<${entityName}, ${entityName}EditViewModel>(entity));
            return Ok(response);
            }
        }

    }

}