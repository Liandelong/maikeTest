using System;
using System.Collections.Generic;
using System.Text;
using Abp.Runtime.Validation;
using Maike.AbpVueAdminDemo.PagingDtos;

namespace Maike.AbpVueAdminDemo.BasEntities.Department.Dtos
{
    public class GetBasDepartmentInput : PagedAndSortedInputDto, IShouldNormalize
    {
        /// <summary>
        /// 正常化排序使用
        /// </summary>
        public void Normalize()
        {
            if (string.IsNullOrEmpty(Sorting))
            {
                Sorting = "Id";
            }
        }

    }
}
