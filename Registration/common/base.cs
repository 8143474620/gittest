using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Registration.common
{
    public class @base : System.Web.UI.Page
    {
        public static string GetConnectionString()
        {
           return ConfigurationManager.ConnectionStrings["DBconnection"].ConnectionString;
        }
    }
}