using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TimskaRabota_Model : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            IspolniSifrarnici2();
        }
    }
    private void IspolniSifrarnici2()
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

    protected void btnVratiSe_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sifrarnici.aspx");
    }
}