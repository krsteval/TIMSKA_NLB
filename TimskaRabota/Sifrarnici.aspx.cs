using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TimskaRabota_Sifrarnici : System.Web.UI.Page
{
    int x = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        
        
        if (Session["Username"] != null)
        {
            User curUser = (User)Session["Username"];
            lblUser.Text = curUser.Role + " " + curUser.Username;
            if (curUser.Role != "Admin")
            {
                Response.Redirect("Pocetna.aspx");
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {

            Ispolni();   //ddl_TipOprema
            Ispolni1(); //ddl_Proizvoditel
            Ispolni2(); //ddlModel
            Ispolni3(); //ddlDobavuvac
            Ispolni4(); //ddlStatus
            Ispolni5(); //ddlKorisnik
            Ispolni6();//ddlGrad
            Ispolni7();//ddlOrganizacionaEdinica
            Ispolni8();//ddlSluzba
            Ispolni9();//ddlSektor

        }
        
    }

    

    
    private void Ispolni2()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT ID_Model,ID_TipOprema,Model FROM MODEL";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[2].ToString();
                elementi.Value = citac[0].ToString();
                ddlModel.Items.Add(elementi);

            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }

    private void Ispolni()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT ID_TipOprema,TipOprema FROM TipOprema";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[1].ToString();
                elementi.Value = citac[0].ToString();
                ddlTipOprema.Items.Add(elementi);

            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }

    private void Ispolni1()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT ID_Proizvoditel,Proizvoditel FROM PROIZVODITEL";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[1].ToString();
                elementi.Value = citac[0].ToString();
                ddlProizvoditel.Items.Add(elementi);
                
            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }

    
    protected void btnSifrarnici_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sifrarnici.aspx");
    }
    protected void btnPocetna_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pocetna.aspx");
    }
    protected void btnSledi_Click(object sender, EventArgs e)
    {
        Response.Redirect("Promena.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }


    //protected void lsbTipOprema_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    Ispolni(lsbTipOprema.SelectedIndex);
    //}


    //protected void ddlTipModeli_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    Ispolni(ddlTipModeli.SelectedIndex);
    //}
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString; 
        con.Open();
        string query = "SELECT MAX(ID_TipOprema) FROM TipOprema";
        //int id;
        //id= Convert.ToInt32(query);
        
        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO TipOprema (ID_TipOprema,TipOprema,ID_Proizvoditel) VALUES (@ID_TipOprema,@TipOprema,@ID_Proizvoditel)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_TipOprema", id);
            komanda.Parameters.AddWithValue("@TipOprema", txtTipOprema.Text);
            komanda.Parameters.AddWithValue("@ID_Proizvoditel", ddlTipOpremaPROIZVODITEL.SelectedIndex+1);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni1();
        Response.Redirect("Sifrarnici.aspx");

    }
    protected void btnDodadiProzvoditel_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(ID_Proizvoditel) FROM PROIZVODITEL";
        //int id;
        //id= Convert.ToInt32(query);

        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO PROIZVODITEL (ID_Proizvoditel,Proizvoditel) VALUES (@ID_Proizvoditel,@Proizvoditel)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_Proizvoditel", id);
            komanda.Parameters.AddWithValue("@Proizvoditel", txtProizvoditel.Text);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni1();
        Response.Redirect("Sifrarnici.aspx");
    }
    protected void btnDodadiDobavuvac_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(ID_Dobavuvac) FROM DOBAVUVAC";
        //int id;
        //id= Convert.ToInt32(query);

        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO DOBAVUVAC (ID_Dobavuvac,Dobavuvac) VALUES (@ID_Dobavuvac,@Dobavuvac)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_Dobavuvac", id);
            komanda.Parameters.AddWithValue("@Dobavuvac", txtDobavuvac.Text);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni3();
        Response.Redirect("Sifrarnici.aspx");
    }

    private void Ispolni3()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT  ID_Dobavuvac,Dobavuvac FROM DOBAVUVAC";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[1].ToString();
                elementi.Value = citac[0].ToString();
                ddlDobavuvac.Items.Add(elementi);

            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    protected void btnDodadiStatus_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(ID_Status) FROM STATUS";
        //int id;
        //id= Convert.ToInt32(query);

        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO STATUS (ID_Status,Status) VALUES (@ID_Status,@Status)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_Status", id);
            komanda.Parameters.AddWithValue("@Status", txtStatus.Text);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni4();
        Response.Redirect("Sifrarnici.aspx");
    }

    private void Ispolni4()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT  ID_Status,Status FROM STATUS";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[1].ToString();
                elementi.Value = citac[0].ToString();
                ddlStatus.Items.Add(elementi);

            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    protected void btnDodadiKorisnik_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(ID_Korisnik) FROM KORISNIK";
        //int id;
        //id= Convert.ToInt32(query);

        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO KORISNIK (ID_Korisnik,Korisnik) VALUES (@ID_Korisnik,@Korisnik)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_Korisnik", id);
            komanda.Parameters.AddWithValue("@Korisnik", txtKorisnik.Text);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni5();
        Response.Redirect("Sifrarnici.aspx");
    }

    private void Ispolni5()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT  ID_Korisnik,Korisnik FROM KORISNIK";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[1].ToString();
                elementi.Value = citac[0].ToString();
                ddlKorisnik.Items.Add(elementi);

            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    protected void btnDodadiGrad_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(ID_Grad) FROM GRAD";
        //int id;
        //id= Convert.ToInt32(query);

        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO GRAD (ID_Grad,Grad) VALUES (@ID_Grad,@Grad)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_Grad", id);
            komanda.Parameters.AddWithValue("@Grad", txtGrad.Text);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni6();
        Response.Redirect("Sifrarnici.aspx");
    }

    private void Ispolni6()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT  ID_Grad,Grad FROM GRAD";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[1].ToString();
                elementi.Value = citac[0].ToString();
                ddlGrad.Items.Add(elementi);

            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    protected void btnDodadiOrganizaciona_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(ID_Edinica) FROM ORGANIZACIONA_EDINICA";
        //int id;
        //id= Convert.ToInt32(query);

        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO ORGANIZACIONA_EDINICA (ID_Edinica,OrganizacionaEdinica) VALUES (@ID_Edinica,@OrganizacionaEdinica)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_Edinica", id);
            komanda.Parameters.AddWithValue("@OrganizacionaEdinica", txtOrganizaciona.Text);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni7();
        Response.Redirect("Sifrarnici.aspx");
    }

    private void Ispolni7()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT  ID_Edinica,OrganizacionaEdinica FROM ORGANIZACIONA_EDINICA";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[1].ToString();
                elementi.Value = citac[0].ToString();
                ddlOrganizaciona.Items.Add(elementi);

            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    protected void btnDodadiSluzba_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(ID_Sluzba) FROM SLUZBA";
        //int id;
        //id= Convert.ToInt32(query);

        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO SLUZBA (ID_Sluzba,Sluzba) VALUES (@ID_Sluzba,@Sluzba)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_Sluzba", id);
            komanda.Parameters.AddWithValue("@Sluzba", txtSluzba.Text);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni8();
        Response.Redirect("Sifrarnici.aspx");
    }

    private void Ispolni8()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT  ID_Sluzba,Sluzba FROM SLUZBA";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[1].ToString();
                elementi.Value = citac[0].ToString();
                ddlSluzba.Items.Add(elementi);

            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    protected void btnDodadiSektor_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(ID_Sektor) FROM SEKTOR";
        //int id;
        //id= Convert.ToInt32(query);

        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO SEKTOR (ID_Sektor,Sektor) VALUES (@ID_Sektor,@Sektor)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_Sektor", id);
            komanda.Parameters.AddWithValue("@Sektor", txtSektor.Text);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni9();
        Response.Redirect("Sifrarnici.aspx");
    }

    private void Ispolni9()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT  ID_Sektor,Sektor FROM SEKTOR";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem elementi = new ListItem();
                elementi.Text = citac[1].ToString();
                elementi.Value = citac[0].ToString();
                ddlSektor.Items.Add(elementi);

            }
            citac.Close();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    protected void btnDodadiModel_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(ID_Model) FROM MODEL";
        //int id;
        //id= Convert.ToInt32(query);

        SqlCommand cmd = new SqlCommand(query);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        SqlDataReader reader = cmd.ExecuteReader();
        int id = 0;
        while (reader.Read())
        {
            // output Employee Name and Number
            id = reader.GetInt32(0);
        }
        // Clean up
        reader.Dispose();
        cmd.Dispose();
        con.Dispose();
        id += 1;
        string sqlString = "INSERT INTO MODEL (ID_Model,ID_TipOprema,Model) VALUES (@ID_Model,@ID_TipOprema,@Model)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID_Model",Convert.ToInt32(TextBox1.Text));

            komanda.Parameters.AddWithValue("@ID_Model", id);
            komanda.Parameters.AddWithValue("@Model", txtModel.Text);
            komanda.Parameters.AddWithValue("@ID_TipOprema", DDLTipOprema_Model.SelectedIndex + 1);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        Ispolni2();
        Response.Redirect("Sifrarnici.aspx");
    }

    protected void gvTipOprema_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE TipOprema SET TipOprema=@TipOprema WHERE ID_TipOprema=@ID_TipOprema";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvTipOprema.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@TipOprema", tb.Text);

        komanda.Parameters.AddWithValue("@ID_TipOprema", gvTipOprema.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvTipOprema.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniSifrarnici();
    }
    protected void gvTipOprema_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvTipOprema.EditIndex = e.NewEditIndex;
        gvTipOprema.DataSource = ds;
        gvTipOprema.DataBind();
    }
    protected void gvTipOprema_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvTipOprema.EditIndex = -1;
        gvTipOprema.DataSource = ds;
        gvTipOprema.DataBind();
    }
    protected void gvTipOprema_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvTipOprema.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM TipOprema WHERE ID_TipOprema= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniSifrarnici();
    }
    protected void gvProizvoditel_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvProizvoditel.EditIndex = e.NewEditIndex;
        gvProizvoditel.DataSource = ds;
        gvProizvoditel.DataBind();
    }
    protected void gvProizvoditel_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvProizvoditel.EditIndex = -1;
        gvProizvoditel.DataSource = ds;
        gvProizvoditel.DataBind();
    }
    protected void gvProizvoditel_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE PROIZVODITEL SET Proizvoditel=@Proizvoditel WHERE ID_Proizvoditel=@ID_Proizvoditel";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvProizvoditel.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@Proizvoditel", tb.Text);

        komanda.Parameters.AddWithValue("@ID_Proizvoditel", gvProizvoditel.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvProizvoditel.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniSifrarnici1();
    }
    protected void gvProizvoditel_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvProizvoditel.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM PROIZVODITEL WHERE ID_Proizvoditel= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniSifrarnici1();
    }
    protected void gvModel_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvModel.EditIndex = e.NewEditIndex;
        gvModel.DataSource = ds;
        gvModel.DataBind();
    }
    protected void gvModel_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE MODEL SET Model=@Model WHERE ID_Model=@ID_Model";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvModel.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@Model", tb.Text);

        komanda.Parameters.AddWithValue("@ID_Model", gvModel.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvModel.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniSifrarnici2();
    }
    protected void gvModel_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvModel.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM MODEL WHERE ID_Model= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniSifrarnici2();
    }
    protected void gvModel_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvModel.EditIndex = -1;
        gvModel.DataSource = ds;
        gvModel.DataBind();
    }


    //Go ispolnuva gridot so Tip Oprema
    protected void IspolniSifrarnici()
    {
        // x = tipOprema + 1;
        //lblPoraka.Text = x.ToString();
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM TipOprema ORDER BY ID_TipOprema";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Model");
            gvTipOprema.DataSource = ds;
            gvTipOprema.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }

    
    //Go ispolnuva gridot so Proizvoditeli
    protected void IspolniSifrarnici1()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM PROIZVODITEL ORDER BY ID_Proizvoditel";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Model");
            gvProizvoditel.DataSource = ds;
            gvProizvoditel.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    //Go ispolnuva gridot so Modeli
    protected void IspolniSifrarnici2()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM MODEL ORDER BY ID_Model";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Model");
            gvModel.DataSource = ds;
            gvModel.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    
    //Go ispolnuva gridot so Dobavuvaci
    protected void IspolniDobavuvaci()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM DOBAVUVAC ORDER BY ID_Dobavuvac";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Dobavuvac");
            gvDobavuvac.DataSource = ds;
            gvDobavuvac.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    //Go ispolnuva gridot so Statusi
    protected void IspolniStatusi()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM STATUS ORDER BY ID_Status";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Status");
            gvStatus.DataSource = ds;
            gvStatus.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    //Go ispolnuva gridot so Korisnici
    protected void IspolniKorisnici()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM KORISNIK ORDER BY ID_Korisnik";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Korisnik");
            gvKorisnik.DataSource = ds;
            gvKorisnik.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    //Go ispolnuva gridot so Gradovi
    protected void IspolniGradovi()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM GRAD ORDER BY ID_Grad";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Grad");
            gvGrad.DataSource = ds;
            gvGrad.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    //Go ispolnuva gridot so Organizaciona Edinica
    protected void IspolniOrganizaciona()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM ORGANIZACIONA_EDINICA ORDER BY ID_Edinica";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Organizaciona");
            gvOrganizacionaEdinica.DataSource = ds;
            gvOrganizacionaEdinica.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    //Go ispolnuva gridot so Sluzbi
    protected void IspolniSluzbi()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM SLUZBA ORDER BY ID_Sluzba";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Sluzba");
            gvSluzba.DataSource = ds;
            gvSluzba.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }
    //Go ispolnuva gridot so Sektor
    protected void IspolniSektori()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM SEKTOR ORDER BY ID_Sektor";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Sektor");
            gvSektor.DataSource = ds;
            gvSektor.DataBind();
            ViewState["dataset"] = ds;
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
    }

    protected void tipOprema_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = true;
        IspolniSifrarnici();
    }

    

    protected void btnUredi1_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = true;
        divProizvoditel.Visible = false;
        divModel.Visible = false;
        divDobavuvac.Visible = false;
        divStatus.Visible = false;
        divKorisnik.Visible = false;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = false;
        divSektor.Visible = false;
        IspolniSifrarnici();
        btnZatvoriPregled.Visible = true;
    }
    protected void btnUredi2_Click(object sender, EventArgs e)
    {
        
        divTipOprema.Visible = false;
        divProizvoditel.Visible = true;
        divModel.Visible = false;
        divDobavuvac.Visible = false;
        divStatus.Visible = false;
        divKorisnik.Visible = false;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = false;
        divSektor.Visible = false;
        IspolniSifrarnici1();
        btnZatvoriPregled.Visible = true;
    }
    protected void btnUredi3_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = false;
        divProizvoditel.Visible = false;
        divModel.Visible = true;
        divDobavuvac.Visible = false;
        divStatus.Visible = false;
        divKorisnik.Visible = false;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = false;
        divSektor.Visible = false;
        IspolniSifrarnici2();
        btnZatvoriPregled.Visible = true;
    }
    protected void btnUredi4_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = false;
        divProizvoditel.Visible = false;
        divModel.Visible = false;
        divDobavuvac.Visible = true;
        divStatus.Visible = false;
        divKorisnik.Visible = false;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = false;
        divSektor.Visible = false;
        IspolniDobavuvaci();
        btnZatvoriPregled.Visible = true;
    }
    protected void btnUredi5_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = false;
        divProizvoditel.Visible = false;
        divModel.Visible = false;
        divDobavuvac.Visible = false;
        divStatus.Visible = true;
        divKorisnik.Visible = false;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = false;
        divSektor.Visible = false;
        IspolniStatusi();
        btnZatvoriPregled.Visible = true;
    }
    protected void btnUredi6_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = false;
        divProizvoditel.Visible = false;
        divModel.Visible = false;
        divDobavuvac.Visible = false;
        divStatus.Visible = false;
        divKorisnik.Visible = true;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = false;
        divSektor.Visible = false;
        IspolniKorisnici();
        btnZatvoriPregled.Visible = true;
    }
    protected void btnUredi7_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = false;
        divProizvoditel.Visible = false;
        divModel.Visible = false;
        divDobavuvac.Visible = false;
        divStatus.Visible = false;
        divKorisnik.Visible = false;
        divGrad.Visible = true;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = false;
        divSektor.Visible = false;
        IspolniGradovi();
        btnZatvoriPregled.Visible = true;
    }
    protected void btnUredi8_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = false;
        divProizvoditel.Visible = false;
        divModel.Visible = false;
        divDobavuvac.Visible = false;
        divStatus.Visible = false;
        divKorisnik.Visible = false;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = true;
        divSluzba.Visible = false;
        divSektor.Visible = false;
        IspolniOrganizaciona();
        btnZatvoriPregled.Visible = true;
    }
    protected void btnUredi9_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = false;
        divProizvoditel.Visible = false;
        divModel.Visible = false;
        divDobavuvac.Visible = false;
        divStatus.Visible = false;
        divKorisnik.Visible = false;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = true;
        divSektor.Visible = false;
        IspolniSluzbi();
        btnZatvoriPregled.Visible = true;
    }
    protected void btnUredi10_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = false;
        divProizvoditel.Visible = false;
        divModel.Visible = false;
        divDobavuvac.Visible = false;
        divStatus.Visible = false;
        divKorisnik.Visible = false;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = false;
        divSektor.Visible = true;
        IspolniSektori();
        btnZatvoriPregled.Visible = true;
    }
    protected void gvDobavuvac_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvDobavuvac.EditIndex = -1;
        gvDobavuvac.DataSource = ds;
        gvDobavuvac.DataBind();
    }
    protected void gvDobavuvac_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvDobavuvac.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM DOBAVUVAC WHERE ID_Dobavuvac= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniDobavuvaci();
    }
    protected void gvDobavuvac_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvDobavuvac.EditIndex = e.NewEditIndex;
        gvDobavuvac.DataSource = ds;
        gvDobavuvac.DataBind();
    }
    protected void gvDobavuvac_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE DOBAVUVAC SET Dobavuvac=@Dobavuvac WHERE ID_Dobavuvac=@ID_Dobavuvac";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvDobavuvac.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@Dobavuvac", tb.Text);

        komanda.Parameters.AddWithValue("@ID_Dobavuvac", gvDobavuvac.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvDobavuvac.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniDobavuvaci();
    }
    protected void gvStatus_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvStatus.EditIndex = -1;
        gvStatus.DataSource = ds;
        gvStatus.DataBind();
    }
    protected void gvStatus_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvStatus.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM STATUS WHERE ID_Status= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniStatusi();
    }
    protected void gvStatus_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvStatus.EditIndex = e.NewEditIndex;
        gvStatus.DataSource = ds;
        gvStatus.DataBind();
    }
    protected void gvStatus_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE STATUS SET Status=@Status WHERE ID_Status=@ID_Status";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvStatus.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@Status", tb.Text);

        komanda.Parameters.AddWithValue("@ID_Status", gvStatus.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvStatus.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniStatusi();
    }
    protected void gvKorisnik_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvKorisnik.EditIndex = -1;
        gvKorisnik.DataSource = ds;
        gvKorisnik.DataBind();
    }




    // DA SE DOPISE OVAA FUNKCIJA
    protected void gvKorisnik_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvKorisnik.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM KORISNIK WHERE ID_Korisnik= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniKorisnici();
    }







    protected void gvKorisnik_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvKorisnik.EditIndex = e.NewEditIndex;
        gvKorisnik.DataSource = ds;
        gvKorisnik.DataBind();
    }
    protected void gvKorisnik_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE KORISNIK SET Korisnik=@Korisnik WHERE ID_Korisnik=@ID_Korisnik";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvKorisnik.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@Korisnik", tb.Text);

        komanda.Parameters.AddWithValue("@ID_Korisnik", gvKorisnik.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvKorisnik.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniKorisnici();
    }
    protected void gvGrad_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvGrad.EditIndex = -1;
        gvGrad.DataSource = ds;
        gvGrad.DataBind();
    }
    protected void gvGrad_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvGrad.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM GRAD WHERE ID_Grad= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniGradovi();
    }
    protected void gvGrad_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvGrad.EditIndex = e.NewEditIndex;
        gvGrad.DataSource = ds;
        gvGrad.DataBind();
    }
    protected void gvGrad_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE GRAD SET Grad=@Grad WHERE ID_Grad=@ID_Grad";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvGrad.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@Grad", tb.Text);

        komanda.Parameters.AddWithValue("@ID_Grad", gvGrad.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvGrad.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniGradovi();
    }
    protected void gvOrganizacionaEdinica_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvOrganizacionaEdinica.EditIndex = -1;
        gvOrganizacionaEdinica.DataSource = ds;
        gvOrganizacionaEdinica.DataBind();
    }
    protected void gvOrganizacionaEdinica_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvOrganizacionaEdinica.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM ORGANIZACIONA_EDINICA WHERE ID_Edinica= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniOrganizaciona();

    }
    protected void gvOrganizacionaEdinica_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvOrganizacionaEdinica.EditIndex = e.NewEditIndex;
        gvOrganizacionaEdinica.DataSource = ds;
        gvOrganizacionaEdinica.DataBind();
    }
    protected void gvOrganizacionaEdinica_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE ORGANIZACIONA_EDINICA SET OrganizacionaEdinica=@OrganizacionaEdinica WHERE ID_Edinica=@ID_Edinica";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvOrganizacionaEdinica.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@OrganizacionaEdinica", tb.Text);

        komanda.Parameters.AddWithValue("@ID_Edinica", gvOrganizacionaEdinica.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvOrganizacionaEdinica.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniOrganizaciona();
    }
    protected void gvSluzba_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvSluzba.EditIndex = -1;
        gvSluzba.DataSource = ds;
        gvSluzba.DataBind();
    }
    protected void gvSluzba_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvSluzba.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM SLUZBA WHERE ID_Sluzba= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniSluzbi();
    }
    protected void gvSluzba_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvSluzba.EditIndex = e.NewEditIndex;
        gvSluzba.DataSource = ds;
        gvSluzba.DataBind();
    }
    protected void gvSluzba_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE SLUZBA SET Sluzba=@Sluzba WHERE ID_Sluzba=@ID_Sluzba";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvSluzba.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@Sluzba", tb.Text);

        komanda.Parameters.AddWithValue("@ID_Sluzba", gvSluzba.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvSluzba.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniSluzbi();
    }
    protected void gvSektor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvSektor.EditIndex = -1;
        gvSektor.DataSource = ds;
        gvSektor.DataBind();
    }
    protected void gvSektor_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

        GridViewRow row = (GridViewRow)gvSektor.Rows[e.RowIndex];

        konekcija.Open();
        string x = row.Cells[0].Text;
        lblPoraka.Text = "Успешно избришан " + row.Cells[1].Text;

        SqlCommand komanda = new SqlCommand("DELETE FROM SEKTOR WHERE ID_Sektor= '" + x + "'", konekcija);

        komanda.ExecuteNonQuery();
        konekcija.Close();
        IspolniSektori();
    }
    protected void gvSektor_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvSektor.EditIndex = e.NewEditIndex;
        gvSektor.DataSource = ds;
        gvSektor.DataBind();
    }
    protected void gvSektor_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE SEKTOR SET Sektor=@Sektor WHERE ID_Sektor=@ID_Sektor";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        TextBox tb = (TextBox)gvSektor.Rows[e.RowIndex].Cells[1].Controls[0];
        komanda.Parameters.AddWithValue("@Sektor", tb.Text);

        komanda.Parameters.AddWithValue("@ID_Sektor", gvSektor.Rows[e.RowIndex].Cells[0].Text);

        int efekt = 0;
        try
        {
            konekcija.Open();
            efekt = komanda.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
            gvSektor.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniSektori();
    }
    protected void btnZatvoriPregled_Click(object sender, EventArgs e)
    {
        divTipOprema.Visible = false;
        divProizvoditel.Visible = false;
        divModel.Visible = false;
        divDobavuvac.Visible = false;
        divStatus.Visible = false;
        divKorisnik.Visible = false;
        divGrad.Visible = false;
        divOrganizacionaEdinica.Visible = false;
        divSluzba.Visible = false;
        divSektor.Visible = false;
        btnZatvoriPregled.Visible = false;
    }
}