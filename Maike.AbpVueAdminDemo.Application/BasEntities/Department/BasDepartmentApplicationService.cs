using Abp.Application.Services.Dto;
using Abp.Authorization;
using Abp.AutoMapper;
using Abp.Domain.Repositories;
using Abp.Linq.Extensions;
using Maike.AbpVueAdminDemo.BasEntities.Department.Dtos;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq.Dynamic.Core;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;


namespace Maike.AbpVueAdminDemo.BasEntities.Department
{
    /// <summary>
    /// 科室资料  
    ///</summary>
    [AbpAuthorize]
    public class BasDepartmentAppService : AbpVueAdminDemoAppServiceBase, IBasDepartmentAppService
    {
        private readonly IRepository<BasDepartment, int> _entityRepository;

        /// <summary>
        /// 构造函数 
        ///</summary>
        public BasDepartmentAppService(IRepository<BasDepartment, int> entityRepository)
        {
            _entityRepository = entityRepository;
        }

        /// <summary>
        /// 通过指定id获取BasDepartmentListDto信息
        /// </summary>
        public async Task<BasDepartmentListDto> GetById(EntityDto<int> input)
        {
            var entity = await _entityRepository.GetAsync(input.Id);

            return entity.MapTo<BasDepartmentListDto>();
        }

        /// <summary>
        /// 获取编辑 BasDepartment
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public async Task<BasDepartmentEditDto> GetForEdit(NullableIdDto<int> input)
        {
            BasDepartmentEditDto editDto;
            if (input.Id.HasValue)
            {
                var entity = await _entityRepository.GetAsync(input.Id.Value);
                editDto = entity.MapTo<BasDepartmentEditDto>();
            }
            else
            {
                editDto = new BasDepartmentEditDto();
            }
            return editDto;
        }

        /// <summary>
        /// 获取列表
        /// </summary>
        public async Task<List<BasDepartmentEditDto>> GetAll()
        {
            var list = await _entityRepository.GetAllListAsync();
            return list.MapTo<List<BasDepartmentEditDto>>();
        }

        /// <summary>
        /// 获取BasBloodVariety的分页列表信息
        ///</summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public async Task<PagedResultDto<BasDepartmentEditDto>> GetPaged(GetBasDepartmentInput input)
        {
            var query = _entityRepository.GetAll();
            var count = await query.CountAsync();
            var entityList = await query
                .OrderBy(input.Sorting).AsNoTracking()
                .PageBy(input)
                .ToListAsync();

            var entityListDtos = entityList.MapTo<List<BasDepartmentEditDto>>();

            return new PagedResultDto<BasDepartmentEditDto>(count, entityListDtos);
        }

        /// <summary>
        /// 添加或者修改BasDepartment的公共方法
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public async Task Save(BasDepartmentEditDto input)
        {

            if (input.Id.HasValue)
            {
                await Update(input);
            }
            else
            {
                await Create(input);
            }
        }

        /// <summary>
        /// 新增BasDepartment
        /// </summary>
        protected virtual async Task<BasDepartmentEditDto> Create(BasDepartmentEditDto input)
        {
            var entity = input.MapTo<BasDepartment>();
            entity = await _entityRepository.InsertAsync(entity);
            return entity.MapTo<BasDepartmentEditDto>();
        }

        /// <summary>
        /// 编辑BasDepartment
        /// </summary>
        protected virtual async Task Update(BasDepartmentEditDto input)
        {
            var entity = await _entityRepository.GetAsync(input.Id.Value);
            input.MapTo(entity);

            // ObjectMapper.Map(input, entity);
            await _entityRepository.UpdateAsync(entity);
        }

        /// <summary>
        /// 删除BasDepartment信息的方法
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task Delete(EntityDto<int> input)
        {
            await _entityRepository.DeleteAsync(input.Id);
        }

        /// <summary>
        /// 批量删除BasDepartment的方法
        /// </summary>
        public async Task BatchDelete(List<int> input)
        {
            await _entityRepository.DeleteAsync(s => input.Contains(s.Id));
        }
    }
}


