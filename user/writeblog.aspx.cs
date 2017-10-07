using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class user_writeblog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("~/index.aspx");
        }
       
        if (!IsPostBack)
        {
            DataTable dt = DB_1.GetCategories2();//获得文章分类
            ddlCategoryID.DataSource = dt;

            ddlCategoryID.DataValueField = dt.Columns[0].ColumnName; 

            ddlCategoryID.DataTextField = dt.Columns[1].ColumnName;
                
            ddlCategoryID.DataBind();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //插入文章
        Articles a = new Articles();
        a.Title1 = tbTitle.Text.ToString();//标题

        a.Userid = Int32.Parse(Session["userid"].ToString());//用户id
        a.Description1 = tbDescription.Text.ToString();//简介
        a.Acontent = ckeAContent.Text.ToString();//正文
        a.Keywords = Keywords.Text.ToString();//标签
        a.CategoryID1 = Int32.Parse(ddlCategoryID.SelectedValue);//分类

        HiddenField h = Master.FindControl("Coverimg") as HiddenField; 
        if (h != null)
        {
            a.Coverimg = h.Value;
        }
       // Master.FindControl("masterLabel")
        
        int n=DB_2.InsertArticle(a);

        if (n == 1)
        {
            //向数据库插入标签
            DB_2.InsertLable(a.Keywords);

            Response.Redirect("~/user/myblog.aspx");//返回我的博客主页
        }
        else
        {
            Response.Redirect("~啊啊啊啊.aspx");
        }
        //a.Title1 = tbTitle.Text.ToString();//封面
        //a.Title1 = tbTitle.Text.ToString();//分类

    }
}