using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Abp.Json;
using Newtonsoft.Json.Serialization;

namespace Maike.AbpVueAdminDemo.Web.Host.Startup
{
    //全局的Json日期时间格式化
    public class CustomContractResolver : AbpCamelCasePropertyNamesContractResolver
    {
        protected override void ModifyProperty(MemberInfo member, JsonProperty property)
        {
            if (property.PropertyType != typeof(DateTime) && property.PropertyType != typeof(DateTime?))
            {
                return;
            }

            property.Converter = new AbpDateTimeConverter()
                {DateTimeFormat = "yyyy-MM-dd HH:mm:ss"};
        }
    }
}