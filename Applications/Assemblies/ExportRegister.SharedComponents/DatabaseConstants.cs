using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExportRegister.SharedComponents
{
    public class DatabaseConstants
    {
        public const string ApplicationName = "ExportRegister";
        public const string DBname = "ExportRegister";
        public static string LogDBname = "ExportRegister_LOG";
    }

    public enum LogMessageTypes
    {
        Error = 1,
        Info = 2
    }
}
