using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.CodeDom;
using System.Data;

namespace CRUD_Demo
{
    public partial class Index : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-NP38RB6\RUBIODB;Initial Catalog=CRUD_Demo;User ID=sa;Password=2133720100");

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack) {
                con.Open();
                SqlCommand com = new SqlCommand("Select * from Countries", con);
                using (SqlDataReader dr = com.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        ddlCountries.DataSource = dr;
                        ddlCountries.DataTextField = "Name";
                        ddlCountries.DataValueField = "Id";
                        ddlCountries.DataBind();
                        ddlCountries.Items.Insert(0, new ListItem("-Select-", "0"));

                    }
                }
                Load_Record();
            }

            con.Close();
        }

        private void Load_Record() {
            
            SqlCommand com = new SqlCommand("SELECT * FROM Person", con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridData.DataSource = dt;
            gridData.DataBind();

            
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            con.Open();
            string line = "INSERT INTO Person VALUES('"+int.Parse(txtID.Text)+"','"+txtName.Text+"','"+txtLastName.Text+"','"+ddlCountries.SelectedItem.Text+"','"+txtPhone.Text+"','"+txtEmail.Text+"')";
            SqlCommand com = new SqlCommand(line, con);
            com.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Succesfully inserted');", true);
            Load_Record();
            con.Close();
        }

        protected void btnRead_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("SELECT * FROM Person WHERE ID = '" + int.Parse(txtID.Text) + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridData.DataSource = dt;
            gridData.DataBind();
        }

        protected void btnGet_Click(object sender, EventArgs e)
        {
            con.Open();
            string line = "SELECT * FROM Person WHERE ID = '"+int.Parse(txtID.Text)+"'";
            SqlCommand com = new SqlCommand(line, con);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                txtName.Text = dr.GetValue(1).ToString();
                txtLastName.Text = dr.GetValue(2).ToString();
                ddlCountries.SelectedItem.Text = dr.GetValue(3).ToString();
                txtPhone.Text = dr.GetValue(4).ToString();
                txtEmail.Text = dr.GetValue(5).ToString();
            }
            

            con.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Open();
            string line = "UPDATE Person SET Name = '" + txtName.Text + "', LastName = '" + txtLastName.Text + "', Country ='" + ddlCountries.SelectedItem.Text + "', Phone = '" + txtPhone.Text + "', Email = '" + txtEmail.Text + "' WHERE ID = '"+int.Parse(txtID.Text)+"'";
            SqlCommand com = new SqlCommand(line, con);
            com.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Succesfully updated');", true);
            Load_Record();
            con.Close();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            con.Open();
            string line = "DELETE Person WHERE ID = '" + int.Parse(txtID.Text) + "'";
            SqlCommand com = new SqlCommand(line, con);
            com.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Succesfully Deleted');", true);
            Load_Record();
            con.Close();
        }
    }
}