using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;



public partial class Pocetna : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            User curUser = (User)Session["Username"];

            lblUser.Text =curUser.Role + " " + curUser.Username;

            if (curUser.Role != "Admin")
            {
                btnsledi.Enabled = false;
                btnSifrarnici.Enabled = false;
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            IspolniMaster();
        }
        
        
    }
    protected void IspolniMaster()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM OPIS";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Avtori");
            gvOpis.DataSource = ds;
            gvOpis.DataBind();
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
    protected void gvOpis_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblPoraka.Text = "Го Селектиравте Редот: " + gvOpis.SelectedRow.Cells[0].Text;


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        gvOpis.Visible = false;
       
    }
   
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
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
            gvOpis.DataSource = ds;
            gvOpis.DataBind();
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
    protected void btnpocetna_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnsledi_Click(object sender, EventArgs e)
    {
        Response.Redirect("Promena.aspx");
    }

    protected void gvOpis_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Производител")
        {
            divThankYou.Visible = true;

            int index = Convert.ToInt32(e.CommandArgument);

            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.
            GridViewRow selectedRow = gvOpis.Rows[index];

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

            string datumvnes = selectedRow.Cells[11].Text;
            txtDatumNaVnes.Text = datumvnes;

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
        divThankYou.Visible = false;
    }

    protected void gvOpis_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    protected void btnSkrieno_Click(object sender, EventArgs e)
    {
        btnPrebaraj_Click(sender, e);
    }

    
}