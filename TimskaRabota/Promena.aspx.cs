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
    string promenil;
    string id;
    int id_isorijat = 0;
    string ISTORID;
    string TIPOPREMA = "";
    string PROIZVODITEL = "";
    string MODEL = "";
    string BROJPRODUKT = "";
    string SERISKIBROJ = "";
    string PARTNO = "";
    string INVENTAREN = "";
    string DOBAVUVAC = "";
    string NABAVNA = "";
    string BROJFAKTURA;
    string DATUMVNES;
    string DATUMFAKTURA;
    string STATUS;
    string KORISNIK;
    string GRAD;
    string ORGANIZACIONA;
    string SLUZBA;
    string SEKTOR;
    string BROJBARANJE;
    string BROJNALOG;
    string GARANCISKI;
    string BROJCHECK;
    string ZABELESKA;


    protected void Page_Load(object sender, EventArgs e)
    {
        ddlStatus.SelectedIndex = 0;


        //btnNaprednoPrebaruvanje.Enabled = false;
        //if (checkModel.Checked == true || checkDobavuvac.Checked == true || checkGrad.Checked == true || checkBrojProdukt.Checked == true || checkKorisnik.Checked == true || checkNabavnaCena.Checked == true || checkOrganizacionaEdinica.Checked == true ||  checkProizvoditel.Checked == true || checkSektor.Checked == true || checkSluzba.Checked == true || checkStatus.Checked == true || checkTipOprema.Checked == true)
        //{
        //    btnNaprednoPrebaruvanje.Enabled = true;
        //}
        if (Session["Username"] != null)
        {
            User curUser = (User)Session["Username"];
            lblUser.Text = curUser.Role + " " + curUser.Username;
            promenil = lblUser.Text;
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
            IspolniMaster();
            //if (prvoPole.IsValid == false)
            //    lblGreski.Visible = true;
            //else
            //     lblGreski.Visible = false;
           
        }



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
            komanda.Parameters.AddWithValue("@OrganizacionaEdinica", ddlOrganizacionaEdinica.SelectedIndex+1);
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
        gvPromena.Visible = true;
        gvIstorijat.Visible = false;
        btnVrati.Visible = true;
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
             ISTORID = id;
             lblPomosnaID.Text = id;

             string tipoprema = selectedRow.Cells[1].Text;
             txtPrimiVrednost.Text = tipoprema;
             txtTipOprema.Text = tipoprema;


             string proizvoditel = ((LinkButton)(selectedRow.Cells[2].Controls[0])).Text;
             TextBox1.Text = proizvoditel;
             txtProizvoditel.Text = proizvoditel;
             
             string model = selectedRow.Cells[3].Text;
             TextBox2.Text = model;
             txtModel.Text = model;

             string brojprodukt = selectedRow.Cells[4].Text;
             TextBox3.Text = brojprodukt;
             txtBrojProdukt1.Text = brojprodukt;

             string seriskibroj = selectedRow.Cells[5].Text;
             TextBox4.Text = seriskibroj;
             txtSeriskiBroj1.Text = seriskibroj;

             string partno = selectedRow.Cells[6].Text;
             TextBox5.Text = partno;
             txtPartNo1.Text = partno;

             string inventaren = selectedRow.Cells[7].Text;
             TextBox6.Text = inventaren;
             txtInventarenBroj1.Text = inventaren;

             string dobavuvac = selectedRow.Cells[8].Text;
             TextBox7.Text = dobavuvac;
             txtDobavuvac.Text = dobavuvac;

             string nabavna = selectedRow.Cells[9].Text;
             TextBox8.Text = nabavna;
             txtNabavnaCena1.Text = nabavna;

             string brojfaktura = selectedRow.Cells[10].Text;
             TextBox9.Text = brojfaktura;
             txtBrojNaFaktura1.Text = brojfaktura;

             string datumvnes = selectedRow.Cells[11].Text;
             TextBox10.Text = datumvnes;
             txtDatumNaVnes.Text = datumvnes;

             string datumfaktura = selectedRow.Cells[12].Text;
             TextBox11.Text = datumfaktura;
             txtDatumNaFaktura.Text = datumfaktura;

             string status = selectedRow.Cells[13].Text;
             TextBox12.Text = status;
             txtStatus.Text = status;

             string korisnik = selectedRow.Cells[14].Text;
             TextBox13.Text = korisnik;
             txtKorisnik.Text = korisnik;

             string grad = selectedRow.Cells[15].Text;
             TextBox14.Text = grad;
             txtGrad.Text = grad;

             string organizaciona = selectedRow.Cells[16].Text;
             TextBox15.Text = organizaciona;
             txtOrganizacionaEdinica.Text = organizaciona;

             string sluzba = selectedRow.Cells[17].Text;
             TextBox16.Text = sluzba;
             txtSluzba.Text = sluzba;

             string sektor = selectedRow.Cells[18].Text;
             TextBox17.Text = sektor;
             txtSektor.Text = sektor;

             string brojbaranje = selectedRow.Cells[19].Text;
             TextBox18.Text = brojbaranje;
             txtBrojNaBaranje1.Text = brojbaranje;

             string brojnalog = selectedRow.Cells[20].Text;
             TextBox19.Text = brojnalog;
             txtBrojNaNalog1.Text = brojnalog;

             string garanciski = selectedRow.Cells[21].Text;
             TextBox20.Text = garanciski;
             txtGaranciskiRok1.Text = garanciski;

             string brojcheck = selectedRow.Cells[22].Text;
             TextBox21.Text = brojcheck;
             txtBrojCheckLista1.Text = brojcheck;

             string zabeleska = selectedRow.Cells[23].Text;
             TextBox22.Text = zabeleska;
             txtZabeleska1.Text = zabeleska;

        }
        

    }

    protected void btnZacuvajPromeni_Click(object sender, EventArgs e)
    {
        InsertIntoIstorijat(sender,e);
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
    protected void btnVrati_Click(object sender, EventArgs e)
    {
        gvIstorijat.Visible = false;
        gvPromena.Visible = true;
        IspolniMaster();
        btnVrati.Visible = false;
        btnIstorijat.Visible = true;
    }
    protected void btnIstorijat_Click(object sender, EventArgs e)
    {
        gvIstorijat.Visible = true;
        gvPromena.Visible = false;
        IspolniIstorijat();
        btnIstorijat.Visible = false;
        btnVrati.Visible = true;
    }

    protected void IspolniIstorijat()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM Istorijat ORDER BY IstorID";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        DataSet ds = new DataSet();
        try
        {
            konekcija.Open();
            adapter.Fill(ds, "Istorijat");
            gvIstorijat.DataSource = ds;
            gvIstorijat.DataBind();
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


    protected void InsertIntoIstorijat(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "INSERT INTO Istorijat (IstorID,IstorTipOprema,IstorProizvoditel,IstorModel,IstorBrojProdukt,IstorSeriskiBroj,IstorPartNo,IstorInventarenBroj,IstorDobavuvac,IstorNabavnaCena,IstorBrojNaFaktura,IstorDatumNaVnes,IstorDatumNaFaktura,IstorStatus,IstorKorisnik,IstorGrad,IstorOrganizacionaEdinica,IstorSluzba,IstorSektor,IstorBrojNaBaranje,IstorBrojNaNalog,IstorGaranciskiRok,IstorBrojCheckLista,IstorZabeleska,IstorVremeNaPromena,IstorPromenil) VALUES (@IstorID,@IstorTipOprema,@IstorProizvoditel,@IstorModel,@IstorBrojProdukt,@IstorSeriskiBroj,@IstorPartNo,@IstorInventarenBroj,@IstorDobavuvac,@IstorNabavnaCena,@IstorBrojNaFaktura,@IstorDatumNaVnes,@IstorDatumNaFaktura,@IstorStatus,@IstorKorisnik,@IstorGrad,@IstorOrganizacionaEdinica,@IstorSluzba,@IstorSektor,@IstorBrojNaBaranje,@IstorBrojNaNalog,@IstorGaranciskiRok,@IstorBrojCheckLista,@IstorZabeleska,@IstorVremeNaPromena,@IstorPromenil)";

        string vremePromena = DateTime.Now.ToString();
        
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        con.Open();
        string query = "SELECT MAX(IstorID) FROM Istorijat";
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
        TextBox tb = new TextBox();

        try
        {
            konekcija.Open();
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //komanda.CommandType = CommandType.StoredProcedure;
            komanda.Parameters.AddWithValue("@IstorID", id);
            komanda.Parameters.AddWithValue("@IstorTipOprema",txtPrimiVrednost.Text);
            komanda.Parameters.AddWithValue("@IstorProizvoditel", TextBox1.Text);
            komanda.Parameters.AddWithValue("@IstorModel", TextBox2.Text);
            komanda.Parameters.AddWithValue("@IstorBrojProdukt", TextBox3.Text);
            komanda.Parameters.AddWithValue("@IstorSeriskiBroj",Convert.ToInt32(TextBox4.Text));
            komanda.Parameters.AddWithValue("@IstorPartNo", Convert.ToInt32(TextBox5.Text));
            komanda.Parameters.AddWithValue("@IstorInventarenBroj", Convert.ToInt32(TextBox6.Text));
            komanda.Parameters.AddWithValue("@IstorDobavuvac", TextBox7.Text);
            komanda.Parameters.AddWithValue("@IstorNabavnaCena", Convert.ToInt32(TextBox8.Text));
            komanda.Parameters.AddWithValue("@IstorBrojNaFaktura", Convert.ToInt32(TextBox9.Text));
            komanda.Parameters.AddWithValue("@IstorDatumNaVnes", TextBox10.Text);
            komanda.Parameters.AddWithValue("@IstorDatumNaFaktura", TextBox11.Text);
            komanda.Parameters.AddWithValue("@IstorStatus", TextBox12.Text);
            komanda.Parameters.AddWithValue("@IstorKorisnik", TextBox13.Text);
            komanda.Parameters.AddWithValue("@IstorGrad", TextBox14.Text);
            komanda.Parameters.AddWithValue("@IstorOrganizacionaEdinica",Convert.ToInt32(TextBox15.Text));
            komanda.Parameters.AddWithValue("@IstorSluzba", TextBox16.Text);
            komanda.Parameters.AddWithValue("@IstorSektor", TextBox17.Text);
            komanda.Parameters.AddWithValue("@IstorBrojNaBaranje", Convert.ToInt32(TextBox18.Text));
            komanda.Parameters.AddWithValue("@IstorBrojNaNalog", Convert.ToInt32(TextBox19.Text));
            komanda.Parameters.AddWithValue("@IstorGaranciskiRok", Convert.ToInt32(TextBox20.Text));
            komanda.Parameters.AddWithValue("@IstorBrojCheckLista",Convert.ToInt32(TextBox21.Text));
            komanda.Parameters.AddWithValue("@IstorZabeleska", TextBox22.Text);
            TextBox23.Text=vremePromena;
            komanda.Parameters.AddWithValue("@IstorVremeNaPromena", TextBox23.Text);
            txtPrimiVrednost.Text = promenil;
            komanda.Parameters.AddWithValue("@IstorPromenil", txtPrimiVrednost.Text);
            komanda.ExecuteNonQuery();
            komanda.Parameters.Clear();
            komanda.Dispose();
            //komanda = null;

        }
        catch (Exception err)
        {
            lblPoraka.Text = err.Message;
        }
        finally
        {
            konekcija.Close();
        }
        IspolniIstorijat();
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
            prebarano += " (TipOprema LIKE '%"+pomosen.Trim()+"%') AND";
        }
        if (checkProizvoditel.Checked)
        {
            string pomosen = asProizvoditel.SelectedItem.Value.ToString();
            prebarano += " (Proizvoditel LIKE '%"+pomosen.Trim()+"%') AND";
        }
        if (checkModel.Checked)
        {
            string pomosen = asModel.SelectedItem.Value;
            prebarano += " (Model LIKE '%"+pomosen.Trim()+"%') AND";
        }
        if (checkBrojProdukt.Checked)
        {
            if (asBrojProduct.Text != "")
            {
                string pomosen = asBrojProduct.Text;
                prebarano += " (BrojProdukt LIKE '%"+pomosen.Trim()+"%') AND";
            }
        }
        if (checkDobavuvac.Checked)
        {
            string pomosen = asDobavuvac.SelectedItem.Value;
            prebarano += " (Dobavuvac LIKE '%"+pomosen.Trim()+"%') AND";
        }
        if (checkNabavnaCena.Checked)
        {
            if (asNabavnaCena.Text != "")
            {
                string pomosen = asNabavnaCena.Text;
                prebarano += " (NabavnaCena LIKE '%"+pomosen.Trim()+"%') AND";
            }
        }
        if (checkStatus.Checked)
        {
            string pomosen = asStatus.SelectedItem.Value;
            prebarano += " (Status LIKE '%"+pomosen.Trim()+"%') AND";
        }
        if (checkKorisnik.Checked)
        {
            btnNaprednoPrebaruvanje.Enabled = true;
            string pomosen = asKorisnik.SelectedItem.Value;
            prebarano += " (Korisnik LIKE '%"+pomosen.Trim()+"%') AND";
        }
        if (checkGrad.Checked)
        {
            string pomosen = asGrad.SelectedItem.Value.ToString();
            prebarano += " (Grad LIKE '%"+pomosen.Trim()+"%') AND";
        }
        if (checkOrganizacionaEdinica.Checked)
        {
            string pomosen = asOrganizacionaEdinica.SelectedItem.Value;
            prebarano += " (OrganizacionaEdinica LIKE '%"+pomosen.Trim()+"%') AND";
        }
        if (checkSluzba.Checked)
        {
            string pomosen = asSluzba.SelectedItem.Value;
            prebarano += " (Sluzba LIKE '%"+pomosen.Trim()+"%') AND";
        }
        if (checkSektor.Checked)
        {
            string pomosen = asSektor.SelectedItem.Value;
            prebarano += " (Sektor LIKE '%"+pomosen.Trim()+"%') AND";
        }

        string konecen="";
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
        gvPromena.Visible = true;
        gvIstorijat.Visible = false;
        advancedSearch.Visible = false;
        btnVrati.Visible = true;

    }


   
}