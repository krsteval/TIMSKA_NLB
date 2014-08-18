using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Promena : System.Web.UI.Page
{
    string denes = DateTime.Today.ToString("MM-dd-yyyy");

    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        ddlStatus.SelectedIndex = 0;
            
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
            IspolniMaster();
            //if (prvoPole.IsValid == false)
            //    lblGreski.Visible = true;
            //else
            //     lblGreski.Visible = false;
           
        }

        //String[] pole = { "Kompjuter", "Printer", "Tastatura", "Gluvce", "RAM Memorija", "Hard Disk" };
        //ddlTipOprema.DataSource = pole;
        //ddlTipOprema.DataBind();

        //String[] pole1 = { "HP", "Dell", "Acer", "Asus", "Toshiba", "Fujitsy Siemens", "Lenovo" };
        //ddlProizvoditel.DataSource = pole1;
        //ddlProizvoditel.DataBind();

        //String[] pole2 = { "K750", "5749Z", "C500", "S800", "k7520", "Z6250", "M500" };
        //ddlModel.DataSource = pole2;
        //ddlModel.DataBind();

        //String[] pole3 = { "Anhoch", "AMC", "River Soft", "Duna", "Emi Media", "Setec", "Neptun", "Tehnomarket" };
        //ddlDobavuvac.DataSource = pole3;
        //ddlDobavuvac.DataBind();


        //int[] denovi = new int[31];
        //for (int i = 0; i < 31; i++)
        //{
        //    denovi[i] = (i + 1);

        //}
        //ddlDen.DataSource = denovi;
        //ddlDen1.DataSource = denovi;
        //ddlDen.DataBind();
        //ddlDen1.DataBind();

        //int[] meseci = new int[12];
        //for (int i = 0; i < 12; i++)
        //{
        //    meseci[i] = (i + 1);

        //}
        //ddlMesec.DataSource = meseci;
        //ddlMesec1.DataSource = meseci;
        //ddlMesec.DataBind();
        //ddlMesec1.DataBind();

        //int[] godina = { 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 };
        //ddlGodina.DataSource = godina;
        //ddlGodina1.DataSource = godina;
        //ddlGodina.DataBind();
        //ddlGodina1.DataBind();
        //string status = ddlStatus.SelectedItem.ToString();
        //ddlStatus.DataSource = status;
        //ddlStatus.DataBind();

        //String[] korisnik = { "Nikola", "Aleksandar", "Mario", "Krste", "Marko", "Stefan", "Oliver", "Filip", "Bojan" };
        //ddlKorisnik.DataSource = korisnik;
        //ddlKorisnik.DataBind();

        //String[] grad = { "Skopje", "Veles", "Bitola", "Prilep", "Ohrid", "Stip", "Tetovo", "Gostivar", "Struga", "Strumica" };
        //ddlGrad.DataSource = grad;
        //ddlGrad.DataBind();

        //String[] organizacionaEdinica = { "4025", "3135", "5358", "8633", "6584", "6564" };
        //ddlOrganizacionaEdinica.DataSource = organizacionaEdinica;
        //ddlOrganizacionaEdinica.DataBind();

        //String[] sluzba = { "Pravna", "Finansii", "Upraven", "Nadzoren", "Tehnika", "Nabavka", "Arhiva", "Covecki Resursi" };
        //ddlSluzba.DataSource = sluzba;
        //ddlSluzba.DataBind();

        //String[] sektor = { "Pravna", "Finansii", "Upraven", "Nadzoren", "Tehnika", "Nabavka", "Arhiva", "Covecki Resursi" };
        //ddlSektor.DataSource = sektor;
        //ddlSektor.DataBind();




    }
    protected void IspolniMaster()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM OPIS ORDER BY ID";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Avtori");
            gvPromena.DataSource = ds;
            gvPromena.DataBind();
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
    protected void gvPromena_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvPromena.EditIndex = -1;
        gvPromena.DataSource = ds;
        gvPromena.DataBind();
    }
    protected void gvPromena_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        gvPromena.EditIndex = e.NewEditIndex;
        gvPromena.DataSource = ds;
        gvPromena.DataBind();
    }
    protected void gvPromena_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "UPDATE OPIS SET Status=@Status,Korisnik=@Korisnik,Grad=@Grad,OrganizacionaEdinica=@OrganizacionaEdinica,Sluzba=@Sluzba,Sektor=@Sektor,Zabeleska=@Zabeleska WHERE ID=@ID";
        
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        
        TextBox tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[13].Controls[0];
        komanda.Parameters.AddWithValue("@Status", tb.Text);

        tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[14].Controls[0];
        komanda.Parameters.AddWithValue("@Korisnik", tb.Text);

        tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[15].Controls[0];
        komanda.Parameters.AddWithValue("@Grad", tb.Text);

        tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[16].Controls[0];
        komanda.Parameters.AddWithValue("@OrganizacionaEdinica", tb.Text);

        tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[17].Controls[0];
        komanda.Parameters.AddWithValue("@Sluzba", tb.Text);

        tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[18].Controls[0];
        komanda.Parameters.AddWithValue("@Sektor", tb.Text);

        tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[23].Controls[0];
        komanda.Parameters.AddWithValue("@Zabeleska", tb.Text);

        komanda.Parameters.AddWithValue("@ID", gvPromena.Rows[e.RowIndex].Cells[0].Text);

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
            gvPromena.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniMaster();
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    protected void btndodadi_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        
        string sqlString = "INSERT INTO OPIS (TipOprema,Proizvoditel,Model,BrojProdukt,SeriskiBroj,PartNo,InventarenBroj,Dobavuvac,NabavnaCena,BrojNaFaktura,DatumNaVnes,DatumNaFaktura,Status,Korisnik,Grad,OrganizacionaEdinica,Sluzba,Sektor,BrojNaBaranje,BrojNaNalog,GaranciskiRok,BrojCheckLista,Zabeleska) VALUES (@TipOprema,@Proizvoditel,@Model,@BrojProdukt,@SeriskiBroj,@PartNo,@InventarenBroj,@Dobavuvac,@NabavnaCena,@BrojNaFaktura,@DatumNaVnes,@DatumNaFaktura,@Status,@Korisnik,@Grad,@OrganizacionaEdinica,@Sluzba,@Sektor,@BrojNaBaranje,@BrojNaNalog,@GaranciskiRok,@BrojCheckLista,@Zabeleska)";

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            //komanda.Parameters.AddWithValue("@ID", id+1);
            komanda.Parameters.AddWithValue("@TipOprema", ddlTipOprema.SelectedItem.Value);
            komanda.Parameters.AddWithValue("@Proizvoditel", ddlProizvoditel.SelectedItem.Value);
            komanda.Parameters.AddWithValue("@Model", ddlModel.SelectedItem.Value);
            komanda.Parameters.AddWithValue("@BrojProdukt", txtBrojProdukt.Text);
            komanda.Parameters.AddWithValue("@SeriskiBroj", txtSeriskiBroj.Text);
            komanda.Parameters.AddWithValue("@PartNo", txtPartNo.Text);
            komanda.Parameters.AddWithValue("@InventarenBroj", txtInventarenBroj.Text);
            komanda.Parameters.AddWithValue("@Dobavuvac", ddlDobavuvac.SelectedIndex);
            komanda.Parameters.AddWithValue("@NabavnaCena", txtNabavnaCena.Text);
            komanda.Parameters.AddWithValue("@BrojNaFaktura", txtBrojNaFaktura.Text);
            komanda.Parameters.AddWithValue("@DatumNaVnes", denes);
            komanda.Parameters.AddWithValue("@DatumNaFaktura", txtDadumFaktura.Text);
            komanda.Parameters.AddWithValue("@Status", ddlStatus.SelectedItem.Value);
            komanda.Parameters.AddWithValue("@Korisnik", ddlKorisnik.SelectedItem.Value);
            komanda.Parameters.AddWithValue("@Grad", ddlGrad.SelectedItem.Value);
            //komanda.Parameters.AddWithValue("@OrganizacionaEdinica", ddlOrganizacionaEdinica.SelectedItem.Value);
            komanda.Parameters.AddWithValue("@OrganizacionaEdinica", ddlOrganizacionaEdinica.SelectedIndex);
            komanda.Parameters.AddWithValue("@Sluzba", ddlSluzba.SelectedItem.Value);
            komanda.Parameters.AddWithValue("@Sektor", ddlSektor.SelectedItem.Value);
            komanda.Parameters.AddWithValue("@BrojNaBaranje", txtBrojNaBaranje.Text);
            komanda.Parameters.AddWithValue("@BrojNaNalog", txtBrojNaNalog.Text);
            komanda.Parameters.AddWithValue("@GaranciskiRok", txtGaranciskiRok.Text);
            komanda.Parameters.AddWithValue("@BrojCheckLista", txtBrojCheckLista.Text);
            komanda.Parameters.AddWithValue("@Zabeleska", txtZabeleska.Text);
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
        IspolniMaster();

    }
    protected void btnPrebaraj_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM OPIS WHERE (TipOprema LIKE '%" + txtPrebaraj.Text + "%') OR (Proizvoditel LIKE '%" + txtPrebaraj.Text + "%') OR (Model LIKE '%" + txtPrebaraj.Text + "%') OR (BrojProdukt LIKE '%" + txtPrebaraj.Text + "%') OR (SeriskiBroj LIKE '%" + txtPrebaraj.Text + "%') OR (PartNo LIKE '%" + txtPrebaraj.Text + "%') OR (InventarenBroj LIKE '%" + txtPrebaraj.Text + "%') OR (Dobavuvac LIKE '%" + txtPrebaraj.Text + "%') OR (NabavnaCena LIKE '%" + txtPrebaraj.Text + "%') OR (BrojNaFaktura LIKE '%" + txtPrebaraj.Text + "%') OR (DatumNaVnes LIKE '%" + txtPrebaraj.Text + "%') OR (DatumNaFaktura LIKE '%" + txtPrebaraj.Text + "%') OR (Status LIKE '%" + txtPrebaraj.Text + "%') OR (Korisnik LIKE '%" + txtPrebaraj.Text + "%') OR (Grad LIKE '%" + txtPrebaraj.Text + "%') OR (OrganizacionaEdinica LIKE '%" + txtPrebaraj.Text + "%') OR (Sluzba LIKE '%" + txtPrebaraj.Text + "%') OR (Sektor LIKE '%" + txtPrebaraj.Text + "%') OR (BrojNaBaranje LIKE '%" + txtPrebaraj.Text + "%') OR (BrojNaNalog LIKE '%" + txtPrebaraj.Text + "%') OR (GaranciskiRok LIKE '%" + txtPrebaraj.Text + "%') OR (BrojCheckLista LIKE '%" + txtPrebaraj.Text + "%') OR (Zabeleska LIKE '%" + txtPrebaraj.Text + "%')  ";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Proizvodi");
            gvPromena.DataSource = ds;
            gvPromena.DataBind();
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
    protected void gvPromena_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnPocetna_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pocetna.aspx");
    }
    protected void btnSledi_Click(object sender, EventArgs e)
    {

    }
    protected void gvPromena_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Производител")
        {
            divThankYou.Visible = true;

             int index = Convert.ToInt32(e.CommandArgument);
      //       z = gvPromena.SelectedIndex;
            
            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.

             GridViewRow selectedRow = gvPromena.Rows[index];
            //z = Server.HtmlDecode(selectedRow.Cells[0].Text);
             //int rowindex = Convert.ToInt32(e.CommandArgument);
             // z = Convert.ToInt32(gvPromena.DataKeys[rowindex].Value);
             id = selectedRow.Cells[0].Text;
             lblPomosnaID.Text = id;
            string tipoprema = selectedRow.Cells[1].Text;
            txtTipOprema.Text = tipoprema;

            string proizvoditel = ((LinkButton)(selectedRow.Cells[2].Controls[0])).Text;
            txtProizvoditel.Text = proizvoditel;

            string model = selectedRow.Cells[3].Text;
            txtModel.Text = model;

            string brojprodukt = selectedRow.Cells[4].Text;
            txtBrojProdukt1.Text = brojprodukt;

            string seriskibroj = selectedRow.Cells[5].Text;
            txtSeriskiBroj1.Text = seriskibroj;

            string partno = selectedRow.Cells[6].Text;
            txtPartNo1.Text = partno;

            string inventaren = selectedRow.Cells[7].Text;
            txtInventarenBroj1.Text = inventaren;

            string dobavuvac = selectedRow.Cells[8].Text;
            txtDobavuvac.Text = dobavuvac;

            string nabavna = selectedRow.Cells[9].Text;
            txtNabavnaCena1.Text = nabavna;

            string brojfaktura = selectedRow.Cells[10].Text;
            txtBrojNaFaktura1.Text = brojfaktura;

            //string datumvnes = selectedRow.Cells[11].Text;
            //txtDatumNaVnes.Text = datumvnes;

            string datumfaktura = selectedRow.Cells[12].Text;
            txtDatumNaFaktura.Text = datumfaktura;

            string status = selectedRow.Cells[13].Text;
            txtStatus.Text = status;

            string korisnik = selectedRow.Cells[14].Text;
            txtKorisnik.Text = korisnik;

            string grad = selectedRow.Cells[15].Text;
            txtGrad.Text = grad;

            string organizaciona = selectedRow.Cells[16].Text;
            txtOrganizacionaEdinica.Text = organizaciona;

            string sluzba = selectedRow.Cells[17].Text;
            txtSluzba.Text = sluzba;

            string sektor = selectedRow.Cells[18].Text;
            txtSektor.Text = sektor;

            string brojbaranje = selectedRow.Cells[19].Text;
            txtBrojNaBaranje1.Text = brojbaranje;

            string brojnalog = selectedRow.Cells[20].Text;
            txtBrojNaNalog1.Text = brojnalog;

            string garanciski = selectedRow.Cells[21].Text;
            txtGaranciskiRok1.Text = garanciski;

            string brojcheck = selectedRow.Cells[22].Text;
            txtBrojCheckLista1.Text = brojcheck;

            string zabeleska = selectedRow.Cells[23].Text;
            txtZabeleska1.Text = zabeleska;

        }

    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        //GridViewUpdateEventArgs a = e as GridViewUpdateEventArgs;
        //gvPromena_RowUpdating(sender, a);
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        int x = Convert.ToInt32(lblPomosnaID.Text);
        string sqlString = "UPDATE OPIS SET Status=@Status,Korisnik=@Korisnik,Grad=@Grad,OrganizacionaEdinica=@OrganizacionaEdinica,Sluzba=@Sluzba,Sektor=@Sektor,Zabeleska=@Zabeleska WHERE ID='" + x + "'";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

       // TextBox tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[13].Controls[0];
        komanda.Parameters.AddWithValue("@Status", txtStatus.Text);

        //tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[14].Controls[0];
        komanda.Parameters.AddWithValue("@Korisnik", txtKorisnik.Text);

        //tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[15].Controls[0];
        komanda.Parameters.AddWithValue("@Grad", txtGrad.Text);

        //tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[16].Controls[0];
        komanda.Parameters.AddWithValue("@OrganizacionaEdinica", txtOrganizacionaEdinica.Text);

        //tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[17].Controls[0];
        komanda.Parameters.AddWithValue("@Sluzba", txtSluzba.Text);

        //tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[18].Controls[0];
        komanda.Parameters.AddWithValue("@Sektor", txtSektor.Text);

        //tb = (TextBox)gvPromena.Rows[e.RowIndex].Cells[23].Controls[0];
        komanda.Parameters.AddWithValue("@Zabeleska", txtZabeleska1.Text);

        //komanda.Parameters.AddWithValue("@ID", gvPromena.Rows[e.RowIndex].Cells[0].Text);
        komanda.Parameters.AddWithValue("@ID", x);

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
            gvPromena.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniMaster();
        divThankYou.Visible = false;
       
    }

    protected void gvPromena_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        DataView dv = ds.Tables[0].DefaultView;
        if (ViewState["nasoka"] == null)
            ViewState["nasoka"] = "ASC";
        if ((string)ViewState["nasoka"] == "DESC")
        {
            dv.Sort=e.SortExpression + " DESC";
            ViewState["nasoka"] = "ASC";
        }
        else
        {
            dv.Sort = e.SortExpression + " ASC";
            ViewState["nasoka"] = "DESC";
        }
        gvPromena.DataSource = dv;
        gvPromena.DataBind();
    }
    protected void btnSkrieno_Click(object sender, EventArgs e)
    {
        btnPrebaraj_Click(sender, e);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        divThankYou.Visible = false;
    }
    protected void btnSifrarnici_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sifrarnici.aspx");
    }

}