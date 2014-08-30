using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
     
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT Count(*) FROM LOGIN " +
                               "WHERE username = @Username AND password = @Password";
        SqlCommand cmd = new SqlCommand(sqlString, cn);
        {
            cn.Open();
            cmd.Parameters.AddWithValue("@Username", txtUserName.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            int result = (int)cmd.ExecuteScalar();
            if (result > 0)
            {

                User u = new User();
                u.Role = "User";
                u.Username = txtUserName.Text;

                if (txtPassword.Text.StartsWith("1"))
                {
                    u.Role = "Admin";

                    Session["Username"] = u;

                    Response.Redirect("Promena.aspx");
                }
                else 
                {
                    Session["Username"] = u;
                    Response.Redirect("Pocetna.aspx");
                }
            }
            else
            {
                lblGreska.Text = "Корисникот не е пронајден! Проверето го Корисничкото име и Лозинката!";
            }
            cn.Close();

        }
    }
}