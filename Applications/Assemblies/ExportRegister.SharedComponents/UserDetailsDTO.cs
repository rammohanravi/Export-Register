using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExportRegister.SharedComponents
{
    public class UserDetailsDTO
    {
        public string UserName { get; set; }
        public string Email { get; set; }
        public bool IsRandomPassword { get; set; }
        public DateTime LastLoginDateTime { get; set; }
        public bool IsUserActive { get; set; }
        public string MobileNumber { get; set; }
        public DateTime DateOfBrith { get; set; }
        public string Designation { get; set; }
        public string Department { get; set; }
    }
}
