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

    string id;
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
        divThankYou.Visible = false;
       
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
        btnVrati.Visible = true;
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
            
            GridViewRow selectedRow = gvOpis.Rows[index];
           
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

            string datumvnes = selectedRow.Cells[11].Text;
            txtDatumNaVnes.Text=datumvnes;

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

    protected void gvOpis_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dataset"];
        DataView dv = ds.Tables[0].DefaultView;
        if (ViewState["nasoka"] == null)
            ViewState["nasoka"] = "ASC";
        if ((string)ViewState["nasoka"] == "DESC")
        {
            dv.Sort = e.SortExpression + " DESC";
            ViewState["nasoka"] = "ASC";
        }
        else
        {
            dv.Sort = e.SortExpression + " ASC";
            ViewState["nasoka"] = "DESC";
        }
        gvOpis.DataSource = dv;
        gvOpis.DataBind();
    }
    protected void btnSkrieno_Click(object sender, EventArgs e)
    {
        btnPrebaraj_Click(sender, e);
    }


    protected void Zacuvaj_Click(object sender, EventArgs e)
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
            gvOpis.EditIndex = -1;
        }
        if (efekt != 0)
            IspolniMaster();
        divThankYou.Visible = false;
    }

    protected void btnSifrarnici_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sifrarnici.aspx");
    }
    protected void btnAdvancedSearch_Click(object sender, EventArgs e)
    {
        advancedSearch.Visible = true;
    }
    protected void btnNaprednoPrebaruvanje_Click(object sender, EventArgs e)
    {
        string prebarano = " ";

        if (checkTipOprema.Checked)
        {
            string pomosen = asTipOprema.SelectedItem.Value;
            prebarano += " (TipOprema LIKE '%" + pomosen.Trim() + "%') AND";
        }
        if (checkProizvoditel.Checked)
        {
            string pomosen = asProizvoditel.SelectedItem.Value.ToString();
            prebarano += " (Proizvoditel LIKE '%" + pomosen.Trim() + "%') AND";
        }
        if (checkModel.Checked)
        {
            string pomosen = asModel.SelectedItem.Value;
            prebarano += " (Model LIKE '%" + pomosen.Trim() + "%') AND";
        }
        if (checkBrojProdukt.Checked)
        {
            if (asBrojProduct.Text != "")
            {
                string pomosen = asBrojProduct.Text;
                prebarano += " (BrojProdukt LIKE '%" + pomosen.Trim() + "%') AND";
            }
        }
        if (checkDobavuvac.Checked)
        {
            string pomosen = asDobavuvac.SelectedItem.Value;
            prebarano += " (Dobavuvac LIKE '%" + pomosen.Trim() + "%') AND";
        }
        if (checkNabavnaCena.Checked)
        {
            if (asNabavnaCena.Text != "")
            {
                string pomosen = asNabavnaCena.Text;
                prebarano += " (NabavnaCena LIKE '%" + pomosen.Trim() + "%') AND";
            }
        }
        if (checkStatus.Checked)
        {
            string pomosen = asStatus.SelectedItem.Value;
            prebarano += " (Status LIKE '%" + pomosen.Trim() + "%') AND";
        }
        if (checkKorisnik.Checked)
        {
            btnNaprednoPrebaruvanje.Enabled = true;
            string pomosen = asKorisnik.SelectedItem.Value;
            prebarano += " (Korisnik LIKE '%" + pomosen.Trim() + "%') AND";
        }
        if (checkGrad.Checked)
        {
            string pomosen = asGrad.SelectedItem.Value.ToString();
            prebarano += " (Grad LIKE '%" + pomosen.Trim() + "%') AND";
        }
        if (checkOrganizacionaEdinica.Checked)
        {
            string pomosen = asOrganizacionaEdinica.SelectedItem.Value;
            prebarano += " (OrganizacionaEdinica LIKE '%" + pomosen.Trim() + "%') AND";
        }
        if (checkSluzba.Checked)
        {
            string pomosen = asSluzba.SelectedItem.Value;
            prebarano += " (Sluzba LIKE '%" + pomosen.Trim() + "%') AND";
        }
        if (checkSektor.Checked)
        {
            string pomosen = asSektor.SelectedItem.Value;
            prebarano += " (Sektor LIKE '%" + pomosen.Trim() + "%') AND";
        }

        string konecen = "";
        if (prebarano != " ")
        {
            konecen = prebarano.Substring(0, prebarano.Length - 4);
        }

        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM OPIS WHERE " + konecen + " ";

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
        gvOpis.Visible = true;
        advancedSearch.Visible = false;
        btnVrati.Visible = true;

    }
    protected void btnVrati_Click(object sender, EventArgs e)
    {
        gvOpis.Visible = true;
        IspolniMaster();
        btnVrati.Visible = false;
        
    }

}