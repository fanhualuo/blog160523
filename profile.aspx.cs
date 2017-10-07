using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class profile : System.Web.UI.Page
{
   // public string imgHtml;
    //public string imgurl;
    public Customer c;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("~/index.aspx");
        }

        if (!Page.IsPostBack)
        {
            int userid = (int)Session["userid"];
            c = DB_1.GetCustomer(userid);//获得个人信息
            Page.DataBind();
            if (c.Sex == 0)
            {
                RadioButton0.Checked=true;
            }
            else
            {
                RadioButton1.Checked = true;
            }


        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Customer c = new Customer();

        c.Explain = Request.Form["explain"].ToString();
        c.Phone = phone.Text.ToString();
        c.Email = email.Text.ToString();
        c.Age= Int32.Parse(age.Text.ToString());
        c.UserID = (int)Session["userid"];
        if(RadioButton0.Checked)
        {
            c.Sex= 0;
        }
        else
        {
            c.Sex = 1;
        }
        int a= DB_2.UpdateCustomer(c);
        if(a==1){
            Response.Redirect("~/profile.aspx");
        }
        else
        {
            Response.Redirect("~/page/404.html");
        }
       
        
    }
}