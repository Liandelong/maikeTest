using System.Data.Common;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Maike.AbpVueAdminDemo.EntityFrameworkCore
{
    public static class AbpVueAdminDemoDbContextConfigurer
    {
        public static void Configure(DbContextOptionsBuilder<AbpVueAdminDemoDbContext> builder, string connectionString,
            LoggerFactory loggerFactory)
        {
            builder.UseLoggerFactory(loggerFactory).UseSqlServer(connectionString);
            builder.EnableSensitiveDataLogging(); //��־��ʾ�ű�����
        }

        public static void Configure(DbContextOptionsBuilder<AbpVueAdminDemoDbContext> builder, DbConnection connection,
            LoggerFactory loggerFactory)
        {
            builder.UseLoggerFactory(loggerFactory).UseSqlServer(connection);
            builder.EnableSensitiveDataLogging(); //��־��ʾ�ű�����
        }
    }
}
