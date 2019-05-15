using Abp.Application.Services;
using Abp.Application.Services.Dto;
using Maike.AbpVueAdminDemo.BasEntities.Department.Dtos;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Maike.AbpVueAdminDemo.BasEntities.Department
{
    /// <summary>
    /// BasDepartment应用层服务的接口方法
    ///</summary>
    public interface IBasDepartmentAppService : IApplicationService
    {
        /// <summary>
        /// 通过指定id获取BasDepartmentListDto信息
        /// </summary>
        Task<BasDepartmentListDto> GetById(EntityDto<int> input);


        /// <summary>
        /// 返回实体的EditDto
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        Task<BasDepartmentEditDto> GetForEdit(NullableIdDto<int> input);

        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        Task<PagedResultDto<BasDepartmentEditDto>> GetPaged(GetBasDepartmentInput input);

        /// <summary>
        /// 添加或者修改BasDepartment的公共方法
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        Task Save(BasDepartmentEditDto input);

        /// <summary>
        /// 删除BasDepartment信息的方法
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        [HttpPost]
        Task Delete(EntityDto<int> input);


        /// <summary>
        /// 批量删除BasDepartment
        /// </summary>
        Task BatchDelete(List<int> input);
    }
}
