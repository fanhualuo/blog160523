using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
public partial class Main : System.Web.UI.MasterPage
{
    public string[] categories;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = DB_1.GetNavs();
        Navigation.DataSource = dt;
        Navigation.DataBind();
    }
    protected void exit_Click(object sender, EventArgs e)
    {
        //loginid = null;
    }
}
