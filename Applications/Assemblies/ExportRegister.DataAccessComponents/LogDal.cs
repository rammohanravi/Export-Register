using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExportRegister.SharedComponents;

namespace ExportRegister.DataAccessComponents
{
    public class LogDal
    {
        public void LogMessage(string message, LogMessageTypes logMessageType)
        {
            var messageType = string.Empty;
            switch (logMessageType)
            {
                case LogMessageTypes.Error:
                    messageType = "Error";
                    break;
                case LogMessageTypes.Info:
                    messageType = "Info";
                    break;

            }

            using (var context = DataAccess.GetDataContext())
            {
                var log = new tApplicationLog
                {
                    LogMessage = message,
                    LogMessageType = messageType,
                    LoggedDateTime = System.DateTime.Now
                };

                context.tApplicationLogs.InsertOnSubmit(log);
                context.SubmitChanges();
            }
        }
    }
}
