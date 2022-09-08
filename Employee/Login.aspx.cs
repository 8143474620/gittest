using Employee.common;
using Employee.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee
{
    public partial class Login : Base
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
      
        [WebMethod]
         public static Eroordetails Register(string login, string password, string city)
        {
            Eroordetails error = new Eroordetails();
            string connection = GetConnectionString();
                //ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connection)) 
            {
                SqlCommand command = new SqlCommand("UserRegistration", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@username", login);
                command.Parameters.AddWithValue("@password", password);
                command.Parameters.AddWithValue("@city", Convert.ToInt32(city));

                SqlParameter retval = new SqlParameter();
                retval.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(retval);

                conn.Open();
                command.ExecuteNonQuery();

                int ret = Convert.ToInt32(retval.Value);

                error.Errocode = ret;

                switch (ret)
                {
                    case 0:
                        error.Errormsg = "User added successfully";
                        break;
                    case 10000:
                        error.Errormsg = "User already exists";
                        break;
                    default:
                        error.Errormsg = "User added successfully";
                        break;
                }
            }

            return error;
        }
    }
}