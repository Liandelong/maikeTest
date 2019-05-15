
using AutoMapper;

namespace Maike.AbpVueAdminDemo.BasEntities.Department.Dtos
{
    /// <summary>
    /// 配置BasDepartment的AutoMapper
    /// </summary>
    internal static class BasDepartmentMapper
    {
        public static void CreateMappings(IMapperConfigurationExpression configuration)
        {
            configuration.CreateMap<BasDepartment, BasDepartmentListDto>();
            configuration.CreateMap<BasDepartmentListDto, BasDepartment>();

            configuration.CreateMap<BasDepartmentEditDto, BasDepartment>();
            configuration.CreateMap<BasDepartment, BasDepartmentEditDto>();

        }
    }
}
