using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class user_myblog :System.Web.UI.Page
{
    private static int i;//尾页
    private static int PageIndex;//第几页
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("~/index.aspx");
        }
        DataTable dt = DB_1.Get_Userid_Articles((int)Session["userid"]);
        GridView1.DataSource = dt;
        GridView1.DataBind();//更新数据

        this.GridView1.Columns[0].Visible = false;
        if (!Page.IsPostBack)
        {
           
        }
    }



    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int a = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[0].Text);

        if (Convert.ToInt32(DB_3.Delete_ID_Article(a))==1)
        {
            Response.Redirect("~/user/myblog.aspx?jieguo=删除成功");
        }
        else
        {
            Response.Redirect("~/user/myblog.aspx?jieguo=删除失败");
        }
    }
}