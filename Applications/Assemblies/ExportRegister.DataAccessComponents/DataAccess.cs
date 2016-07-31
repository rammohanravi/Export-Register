using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExportRegister.SharedComponents;

namespace ExportRegister.DataAccessComponents
{
    internal class DataAccess
    {
        private static readonly string ExportRegisterDBConnection;

        static DataAccess()
        {
            var configLoader = new ConfigHelper();
            ExportRegisterDBConnection = configLoader.GetConnectionStringFromKey(DatabaseConstants.DBname);
        }

        public static ExportRegisterDataContext GetDataContext()
        {
            return new ExportRegisterDataContext(ExportRegisterDBConnection);
        }

        public static ExportRegisterDataContext GetNoTrackingDataContext()
        {
            var test = new ExportRegisterDataContext(ExportRegisterDBConnection);
            test.ObjectTrackingEnabled = false;
            return test;
        }
    }
}
