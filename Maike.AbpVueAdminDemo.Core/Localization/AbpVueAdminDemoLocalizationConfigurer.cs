using Abp.Configuration.Startup;
using Abp.Localization.Dictionaries;
using Abp.Localization.Dictionaries.Xml;
using Abp.Reflection.Extensions;

namespace Maike.AbpVueAdminDemo.Localization
{
    public static class AbpVueAdminDemoLocalizationConfigurer
    {
        public static void Configure(ILocalizationConfiguration localizationConfiguration)
        {
            localizationConfiguration.Sources.Add(
                new DictionaryBasedLocalizationSource(AbpVueAdminDemoConsts.LocalizationSourceName,
                    new XmlEmbeddedFileLocalizationDictionaryProvider(
                        typeof(AbpVueAdminDemoLocalizationConfigurer).GetAssembly(),
                        "Maike.AbpVueAdminDemo.Localization.SourceFiles"
                    )
                )
            );
        }
    }
}
