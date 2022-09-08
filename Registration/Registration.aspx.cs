using Registration.common;
using Registration.models;
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

namespace Registration
{
    public partial class Registration : @base
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static Errordetails Register(string name, string Password, string specialization)
        {
            Errordetails Error = new Errordetails();
            string connection = GetConnectionString();
            using (SqlConnection cnn = new SqlConnection(connection) )
            {
                SqlCommand command = new SqlCommand("Registration", cnn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Empname", name);
                command.Parameters.AddWithValue("@Emppassword", Password);
                command.Parameters.AddWithValue("@Empdepartment", specialization);

                   cnn.Open();

                command.ExecuteNonQuery();

            }
            return Error;
        }
    }
}