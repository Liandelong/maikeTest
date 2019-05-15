using Microsoft.Extensions.Logging;
using System;

namespace Maike.AbpVueAdminDemo.EntityFrameworkCore.Logger
{
    public class EfLogger : ILogger
    {
        public Castle.Core.Logging.ILogger Logger { get; set; }

        private readonly string _categoryName;

        public EfLogger(string categoryName, Castle.Core.Logging.ILogger logger)
        {
            this._categoryName = categoryName;
            this.Logger = logger;
        }

        public bool IsEnabled(LogLevel logLevel) => true;

        public void Log<TState>(LogLevel logLevel, EventId eventId, TState state, Exception exception,
            Func<TState, Exception, string> formatter)
        {
            //ef core执行数据库查询时的categoryName为Microsoft.EntityFrameworkCore.Database.Command,日志级别为Information
            //过滤掉了定时任务的日志
            var logContent = formatter(state, exception);
            if (_categoryName == "Microsoft.EntityFrameworkCore.Database.Command"
                && logLevel == LogLevel.Information && !logContent.Contains("AbpBackgroundJobs"))
            {
                Logger.Warn(logContent);
            }
        }

        public IDisposable BeginScope<TState>(TState state) => null;
    }
}