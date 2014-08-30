using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TimskaRabota_Proizvoditel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            IspolniSifrarnici1();
    }
    private void IspolniSifrarnici1()
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
    protected void btnVratiSe_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sifrarnici.aspx");
    }
}