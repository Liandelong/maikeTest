using Abp.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maike.AbpVueAdminDemo.BasEntities
{
    [Table("BasDepartment")]
    public class BasDepartment : BaseInfoEntity
    {
        /// <summary>
        /// 科室分类，取自枚举
        /// </summary>
        public int Type { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
    }
}
