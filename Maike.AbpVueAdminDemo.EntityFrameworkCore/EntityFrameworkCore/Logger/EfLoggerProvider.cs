using Microsoft.Extensions.Logging;

namespace Maike.AbpVueAdminDemo.EntityFrameworkCore.Logger
{
    public class EfLoggerProvider : ILoggerProvider
    {
        public Castle.Core.Logging.ILogger Logger;

        public EfLoggerProvider(Castle.Core.Logging.ILogger logger)
        {
            Logger = logger;
        }

        public ILogger CreateLogger(string categoryName)
        {
            return new EfLogger(categoryName, Logger);
        }

        public void Dispose()
        {
        }
    }
}