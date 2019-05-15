using Abp.Application.Services.Dto;

namespace Maike.AbpVueAdminDemo.BasEntities.Department.Dtos
{
    public class BasDepartmentListDto : FullAuditedEntityDto 
    {
		/// <summary>
		/// Code
		/// </summary>
		public string Code { get; set; }

		/// <summary>
		/// Name
		/// </summary>
		public string Name { get; set; }

		/// <summary>
		/// Type
		/// </summary>
		public int Type { get; set; }

        public bool IsEnabled { get; set; }

        /// <summary>
        /// Remark
        /// </summary>
        public string Remark { get; set; }
    }
}