using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class page_shousuo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string key = Request.QueryString["akey"].ToString();

        DataTable dt = DB_1.GetkeyArticles(key);
        rpNews.DataSource = dt;
        rpNews.DataBind();
    }
}