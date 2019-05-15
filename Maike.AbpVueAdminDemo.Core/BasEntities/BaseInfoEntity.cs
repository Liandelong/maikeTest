using Abp.Domain.Entities.Auditing;

namespace Maike.AbpVueAdminDemo.BasEntities
{
    /***
     * 基础资料的基类
     * 基础资料必须包含Id,Code,Name,IsEnabled,全部审计字段
     */
    public class BaseInfoEntity : FullAuditedEntity
    {
        /// <summary>
        /// 代码
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// 名字
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 是否启用
        /// </summary>
        public bool IsEnabled { get; set; }
    }
}
