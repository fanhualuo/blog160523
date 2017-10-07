using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class index : System.Web.UI.Page
{
    private static int i;//尾页
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            getData(1);
        }
    }

    private void getData(int pageindex)
    {
        PagedDataSource pd = new PagedDataSource();
        pd.AllowPaging = true;//允许分页
        //pd.PageSize = 4;//一页显示4条数据
        pd.PageSize = Convert.ToInt32(ConfigurationManager.ConnectionStrings["PageSize"].ToString());//一页显示多少条数据，在配置文件读取
        pd.CurrentPageIndex = pageindex - 1;//显示第几页


        if (Request.QueryString["CategoryID"] != null)//如果分类属性不为空，执行查找
        {
            int categoryid = Int32.Parse(Request.QueryString["CategoryID"].ToString());

            pd.DataSource = DB_1.GetSortArticles(categoryid).DefaultView;            
        }
        else
        {
            pd.DataSource = DB_1.GetArticles().DefaultView;//查询所有博客
        }


       




        rpNews.DataSource = pd;//把pd传给DataList
        rpNews.DataBind();//DataList1显示数据
        Label5.Text = Convert.ToString(pd.CurrentPageIndex + 1);//当前第几页

        i = pd.PageCount;//一共多少页

        Label1.Text = i.ToString();
        if (pd.IsFirstPage)//是否是第一页
        {
            LinkButton2.Visible = false;
            LinkButton1.Visible = false;
        }
        else
        {
            LinkButton2.Visible = true;
            LinkButton1.Visible = true;
        }

        if (pd.IsLastPage)//是否是最后一页
        {
            LinkButton3.Visible = false;
            LinkButton4.Visible = false;
        }
        else
        {
            LinkButton3.Visible = true;
            LinkButton4.Visible = true;
        }
    }
    private void Bind()
    {
        DataTable dt = DB_1.GetArticles();
        rpNews.DataSource = dt;
        rpNews.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)//首页
    {
        getData(1);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        getData(Convert.ToInt32(Label5.Text) - 1);
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        getData(Convert.ToInt32(Label5.Text) + 1);
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        getData(i);
    }
}