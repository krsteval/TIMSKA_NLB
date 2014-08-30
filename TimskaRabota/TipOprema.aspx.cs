using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TimskaRabota_TipOprema : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            IspolniSifrarnici();
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

    protected void btnVratiSe_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sifrarnici.aspx");
    }
}