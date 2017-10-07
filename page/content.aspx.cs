using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class page_content1 : System.Web.UI.Page
{
    public Articles article;
    public int articleid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                articleid = Int32.Parse(Request.QueryString["id"]);
                article = DB_1.Get_Only_Articles(articleid);


                if (article != null)
                {
                    //获得评论的数据
                    DataTable a = DB_1.GetComment(articleid);//访问统计加一
                    rpCommentList.DataSource = a;//把pd传给DataList
                    rpCommentList.DataBind();//DataList1显示数据

                    DB_2.InsertReanCount(articleid);

                    if ((string)Session["loginid"] == null)
                    {
                        pinglun.Enabled = false;//不登录不能评论
                    }
                }
                else
                {
                    Response.Redirect("~/page/404.htm");
                }
            }
            catch
            {
                Response.Redirect("~/page/404.aspx");
            }
            
        }

        
    }

protected void commentSubmit(object sender, EventArgs e)
{
        Comments c = new Comments();
        c.ArticleID1 = Int32.Parse(Request.QueryString["id"]);
        c.CContent1 = ccontent.Text;
        c.NickName1 = (string)Session["loginid"];
        DB_2.InsertComment(c);
        articleid = Int32.Parse(Request.QueryString["id"]);
        Response.Redirect("~/page/content.aspx?id="+articleid);
}
}