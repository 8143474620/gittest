using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Employee.common
{
    public class Base: System.Web.UI.Page
    {
        public static string GetConnectionString()
        {

          return ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

         
        }
    }

}