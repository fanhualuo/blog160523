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

public partial class master_right2 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = DB_1.GetCategories();
        fenlei.DataSource = dt;
        fenlei.DataBind();

        biaoqian.DataSource=DB_1.GetLableArticles();//获得标签
        biaoqian.DataBind();

        rpArticles.DataSource = DB_1.Get10Articles().DefaultView;//查询所有博客
        rpArticles.DataBind();
    }
}