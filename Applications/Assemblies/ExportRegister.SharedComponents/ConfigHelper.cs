using System;
using System.Configuration;
using System.Linq;
using System.ServiceModel.Configuration;
using System.IO;
using System.Reflection;
using System.Collections.Generic;

namespace ExportRegister.SharedComponents
{
    public sealed class ConfigHelper
    {
        private static readonly object ConfigLock = new object();
        private static readonly AppSettingsReader Reader = new AppSettingsReader();
        private static readonly Dictionary<string, string> CachedFullPathRelative = new Dictionary<string, string>();

        public bool GetAppSettingsBoolValue(string key, bool? defaultValue = null)
        {
            try
            {
                var data = ConfigurationManager.AppSettings.Get(key);
                if (data == null)
                {
                    if (defaultValue == null)
                        throw new InvalidOperationException(string.Format("Could not read AppSettings string value for key: {0}.", key));

                    return defaultValue.Value;
                }

                return bool.Parse(data);
            }
            catch (InvalidOperationException ex)
            {
                throw new InvalidOperationException(string.Format("Could not read AppSettings string value for key: {0}. {1}", key, ex.Message), ex);
            }
        }

        public string GetAppSettingsStringValue(string key)
        {
            try
            {
                return Reader.GetValue(key, typeof(string)).ToString();
            }
            catch (InvalidOperationException ex)
            {
                throw new InvalidOperationException(string.Format("Could not read AppSettings string value for key: {0}. {1}", key, ex.Message), ex);
            }
        }

        public int GetAppSettingsIntlValue(string key)
        {
            return int.Parse(Reader.GetValue(key, typeof(Int32)).ToString());
        }

        public string GetConnectionStringFromKey(string key)
        {
            lock (ConfigLock)
            {
                return ConfigurationManager.ConnectionStrings[key].ConnectionString;
            }
        }

        public string GetConnectionStringDatabaseFromKey(string key)
        {
            string s;
            lock (ConfigLock)
            {
                s = ConfigurationManager.ConnectionStrings[key].ConnectionString;
            }
            var s2 = s.Split(';');
            var ret = s2.Where(w => w.ToLower().StartsWith("data"));
            foreach (var r in ret)
            {
                return r;
            }

            return string.Empty;
        }

        public string GetEndPointAdress()
        {
            lock (ConfigLock)
            {
                var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                var section = config.GetSectionGroup("system.serviceModel") as ServiceModelSectionGroup;
                if (section == null) throw new NullReferenceException("No section for system.serviceModel.");

                return section.Client.Endpoints[0].Address.OriginalString;
            }
        }

        public string GetHostName()
        {
            lock (ConfigLock)
            {
                var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                var section = config.GetSectionGroup("system.serviceModel") as ServiceModelSectionGroup;
                if (section == null) throw new NullReferenceException("No section for system.serviceModel.");

                return section.Client.Endpoints[0].Address.Host;
            }
        }

        private string AssemblyDirectory
        {
            get
            {
                return Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            }
        }

        public string GetFullPathAppRelative(string appSettingsName)
        {
            if (CachedFullPathRelative.ContainsKey(appSettingsName))
                return CachedFullPathRelative[appSettingsName];

            //Use hardcoded file path to schema dir. It will always be placed under appdir and in 
            //order to avoid xml file path error we use Path.GetDirectoryName instead.
            var fullPath = AssemblyDirectory + (string)Reader.GetValue(appSettingsName, appSettingsName.GetType());
            CachedFullPathRelative.Add(appSettingsName, fullPath);

            return fullPath;
        }
    }
}
