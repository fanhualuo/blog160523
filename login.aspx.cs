using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loginid.Focus();//加载完成焦点移动到id_1文本框
        if (!Page.IsPostBack)
        {
            
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        
        if (TextBox3.Text == (Request.Form["code1"].ToString()))//验证码验证
        {
            Users user = DB_1.GetUsers(loginid.Text, pass.Text);
            if (user != null)//密码验证
            {
                Session.Add("userid", user.Userid);
                Session.Add("loginid", user.Loginid);
                Session.Add("pass", user.Pass);
                Response.Redirect("~/index.aspx");
            }
            else
            {
                Label1.Text = "登录失败，请输入正确的账号或密码";
            }

        }

        else
        {
            Label1.Text = "登录失败，请输入正确的验证码";
        }
    }
}