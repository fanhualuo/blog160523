using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("~/index.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ////修改密码
        int userid = (int)Session["userid"];
        if ((DB_1.GetUsers((string)Session["loginid"], pass0.Text)) != null)
        {
            int n = DB_2.UpdatePass(userid, pass1.Text);
            if (n == 1)
            {
                Label1.Text = "修改密码成功";
            }
            else
            {
                Label1.Text = "修改密码失败";
            }
        }
        else
        {
            Label1.Text = "原始密码不正确";
        }
        
    }
}