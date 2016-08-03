using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExportRegister.SharedComponents;

namespace ExportRegister.DataAccessComponents
{
    internal static class UserCompiledQueries
    {
        public static readonly Func<ExportRegisterDataContext, string, string, UserDetailsDTO>
            FunValidateUser = CompiledQuery.Compile((ExportRegisterDataContext context, string userName, string passWord) =>
                (
                from access in context.tLogins
                join eDetails in context.tEmployeeDetails on access.EmployeeDetailsId equals eDetails.EmployeeDetailsId
                join dept in context.tDepartments on eDetails.DepartmentId equals dept.DepartmentId
                join desig in context.tDesignations on eDetails.DesignationId equals desig.DesignationId
                where access.UserName == userName && access.LoginPassword == passWord && access.IsActive == true
                select new UserDetailsDTO
                {
                    UserName = access.UserName,
                    Email = eDetails.EmailId,
                    IsRandomPassword = access.IsRandomPwd,
                    LastLoginDateTime = access.LastLoginDate,
                    IsUserActive = access.IsActive,
                    MobileNumber = eDetails.MobileNumber,
                    DateOfBrith = eDetails.DateOfBirth,
                    Designation = desig.DesignationName,
                    Department = dept.DepartmentName
                }
                ).FirstOrDefault()
            );

        public static readonly Func<ExportRegisterDataContext, string, bool>
            FunCheckUserExists = CompiledQuery.Compile((ExportRegisterDataContext context, string userName) =>
                (
                 context.tLogins.FirstOrDefault(x => x.UserName == userName) != null ? false : true
                 )
            );

        public static readonly Func<ExportRegisterDataContext, string, bool>
            FunCheckEmailExists = CompiledQuery.Compile((ExportRegisterDataContext context, string Email) =>
                (
                context.tEmployeeDetails.FirstOrDefault(x => x.EmailId == Email) != null ? false : true
                )
            );
    }
}
