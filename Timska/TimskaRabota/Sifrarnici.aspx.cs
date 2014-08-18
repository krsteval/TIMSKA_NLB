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

    //protected void Ispolni(int tipOprema)
    //{
    //    x = tipOprema+1;
    //    lblPoraka.Text = x.ToString();
    //    SqlConnection konekcija = new SqlConnection();
    //    konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
    //    string sqlString = "SELECT * FROM Model where ID_TipOprema='" + Convert.ToInt32(x) +"'";
    //    SqlCommand komanda = new SqlCommand(sqlString, konekcija);
    //    SqlDataAdapter adapter = new SqlDataAdapter(komanda);
    //    DataSet ds = new DataSet();
    //    try
    //    {
    //        konekcija.Open();
    //        adapter.Fill(ds, "Model");
    //        GridView1.DataSource = ds;
    //        GridView1.DataBind();
    //        ViewState["dataset"] = ds;
    //    }
    //    catch (Exception err)
    //    {
    //        lblPoraka.Text = err.Message;
    //    }
    //    finally
    //    {
    //        konekcija.Close();
    //    }
    //}
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
    }
    protected void btnIstorijat_Click(object sender, EventArgs e)
    {
        Response.Redirect("Istorijat.aspx");
    }
}