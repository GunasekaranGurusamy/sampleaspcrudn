using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sampleaspcrudn1
{
    public partial class crud : System.Web.UI.Page
    {

        private static DataTable userTable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitializeUserTable();
                BindGridView();
            }
        }

        private void InitializeUserTable()
        {
            if (userTable.Columns.Count == 0)
            {
                userTable.Columns.Add("Id", typeof(int));
                userTable.Columns.Add("Name", typeof(string));
                userTable.Columns.Add("DOB", typeof(DateTime));
                userTable.Columns.Add("Email", typeof(string));
                userTable.Columns.Add("Mobile", typeof(string));
                userTable.Columns.Add("Gender", typeof(string));
                userTable.Columns.Add("Education", typeof(string));
                userTable.Columns.Add("Experience", typeof(string));

                userTable.PrimaryKey = new DataColumn[] { userTable.Columns["Id"] };
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataRow row;
            if (ViewState["EditId"] != null)
            {
                int editId = Convert.ToInt32(ViewState["EditId"]);
                row = userTable.Rows.Find(editId);
                ViewState["EditId"] = null;
            }
            else
            {
                row = userTable.NewRow();
                row["Id"] = userTable.Rows.Count > 0 ? (int)userTable.Compute("MAX(Id)", "") + 1 : 1;
                userTable.Rows.Add(row);
            }

            row["Name"] = txtName.Text;
            row["DOB"] = DateTime.Parse(txtDOB.Text);
            row["Email"] = txtEmail.Text;
            row["Mobile"] = txtMobile.Text;
            row["Gender"] = rblGender.SelectedValue;
            row["Education"] = ddlEducation.SelectedValue;
            row["Experience"] = txtExperience.Text;

            lblMessage.Text = "User saved successfully!";
            BindGridView();
            ClearForm();
        }

        private void BindGridView()
        {
            GridUser.DataSource = userTable;
            GridUser.DataBind();
        }

        private void ClearForm()
        {
            txtName.Text = string.Empty;
            txtDOB.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            rblGender.ClearSelection();
            ddlEducation.SelectedIndex = 0;
            txtExperience.Text = string.Empty;
        }

        protected void GridUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView gv = (GridView)sender;
                gv.PageIndex = e.NewPageIndex;
                gv.DataBind();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected void lbEdit_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            string id = lb.CommandName;
            DataRow row = userTable.Rows.Find(id);

            txtName.Text = row["Name"].ToString();
            txtDOB.Text = Convert.ToDateTime(row["DOB"]).ToString("yyyy-MM-dd");
            txtEmail.Text = row["Email"].ToString();
            txtMobile.Text = row["Mobile"].ToString();
            rblGender.SelectedValue = row["Gender"].ToString();
            ddlEducation.SelectedValue = row["Education"].ToString();
            txtExperience.Text = row["Experience"].ToString();

            ViewState["EditId"] = id;
        }

        protected void lbRemove_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            string id = lb.CommandName;
            DataRow row = userTable.Rows.Find(id);
            if (row != null)
            {
                userTable.Rows.Remove(row);
                BindGridView();
            }
        }
    }
}