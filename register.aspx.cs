using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    public Users u;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //验证用户名是否注册
        args.IsValid = DB_1.GetUserID(loginid.Text);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (TextBox3.Text == (Request.Form["code1"].ToString()))//验证码验证
        {
            Users user = new Users();
            user.Loginid = loginid.Text;
            user.Pass = pass1.Text;

            if (DB_1.GetUserID(loginid.Text))
            {
                int n=DB_2.InsertUser(user);
                if (n==2)//密码验证
                {
                    Label1.Text = "注册成功";
                    //Response.Redirect("~/index.aspx");
                }
                else
                {
                    Label1.Text = "注册失败";
                }
           }
            else
            {
                Label1.Text = "注册失败";
            }

        }

        else
        {
            Label1.Text = "注册失败，请输入正确的验证码";
        }
        
    }
}