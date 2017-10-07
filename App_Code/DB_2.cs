using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
public class DB_2
{
	 private static string ConnString;
    private static SqlConnection con;

	public  DB_2()  
	{
        
        
    }
    public static void OpenConnection()
    {
        ConnString = ConfigurationManager.ConnectionStrings["ConnString"].ToString();//获得数据库连接配置文件
        con = new SqlConnection(ConnString); //创建连接对象con
    }

    public static int InsertUser(Users user)//注册页面的插入users表
    {       
        int n = 0;
        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        String sql = "insert into Users(Loginid,Password) values('" + user.Loginid + "','" + user.Pass + "')";
        cmd.CommandText = sql;
        n = cmd.ExecuteNonQuery();
     
        con.Close();
        return n;
    }

    
    public static int InsertCustomer(Users user)//插入个人信息
    {
        int n = 0;
        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        String sql = "insert into Users(Loginid,Password) values('" + user.Loginid + "','" + user.Pass + "')";
        cmd.CommandText = sql;
        n = cmd.ExecuteNonQuery();

        con.Close();
        return n;
    }
    public static int InsertComment(Comments c)//插入评论
    {

        int n = 0;
        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        String sql = "insert into Comments(ArticleID,NickName,CContent) values(" + c.ArticleID1 + ",'" + c.NickName1 + "','" + c.CContent1 + "')";
        cmd.CommandText = sql;
        n = cmd.ExecuteNonQuery();

        con.Close();
        return n;
    }

    //上传头像
    public static int InsertImgTop(int userid, string url)
    {

       int n = 0;
       OpenConnection();
       con.Open();
       SqlCommand cmd = new SqlCommand();
       cmd.Connection = con;
         
         
        String sql2 = "update Customer  set headimg='"+url+"'  where userid=" + userid + "  ";
        cmd.CommandText = sql2;
        n= cmd.ExecuteNonQuery();
        con.Close();
    
        return n;
    }


    //删除头像图片
     public static int DeleteImgTop(int userid){
         int n = 0;
        String sql = "select headimg from  Customer where userid=" + userid + "";
        OpenConnection();
        con.Open();        
        SqlCommand cmd = new SqlCommand(sql, con);

        SqlDataReader read = cmd.ExecuteReader();
        string url="";
        if (read.Read())
        {
             url = (string)read[0];
             if (url == "/files/image/404.gif")//如果是默认图片不删除
             {
                 return 1;
             }
            try
            {
                FileInfo file2 = new FileInfo(HttpContext.Current.Server.MapPath(url));//指定文件路径
                if (file2.Exists)//判断文件是否存在
                {
                    file2.Attributes = FileAttributes.Normal;//将文件属性设置为普通
                    file2.Delete();//删除文件
                    n = 1;
                }
            }
            catch
            {
                con.Close();

                return n;
            }             
        }
        con.Close();
        return n;
}

    public static int InsertReanCount(int ArticleID)//文章访问次数加1
    {
        int n = 0;

        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        String sql = "update Articles  set ReadCount+=1  where ArticleID="+ ArticleID+"  ";
        cmd.CommandText = sql;
        n = cmd.ExecuteNonQuery();

        con.Close();
        return n;
    }

    //修改个人信息
    public static int UpdateCustomer(Customer c)//修改个人信息
    {
        int n = 0;
        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        String sql = "update Customer set phone='" + c.Phone + "' ,email='" + c.Email + "' ,explain='" + c.Explain + "' , sex=" + c.Sex + " , age=" + c.Age + "   where userid=" + c.UserID + "";
        cmd.CommandText = sql;
        n = cmd.ExecuteNonQuery();

        con.Close();
        return n;
    }

    public static int UpdatePass(int userid,string pass)//修改密码
    {
        int n = 0;
        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        String sql = "update Users set Password='"+pass+"'   where userid=" + userid+ "";
        cmd.CommandText = sql;
        n = cmd.ExecuteNonQuery();

        con.Close();
        return n;
    }

    public static int InsertArticle(Articles a)////插入文章
    {
        int n = 0;
        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        //插入文章
        String sql = "insert into Articles(Title,Description,UserID,AContent,CategoryID,Keywords,CoverImg) values('" + a.Title1 + "','" + a.Description1 + "'," + a.Userid + ",'" + a.Acontent + "','" + a.CategoryID1 + "','" + a.Keywords + "','" + a.Coverimg + "')";

        cmd.CommandText = sql;
        n = cmd.ExecuteNonQuery();

        con.Close();
        return n;
    }


    //插入标签
    public static void InsertLable(string lable)
    {
        int n = 0;
        if (DB_2.GetLableByName(lable))
        {
            OpenConnection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            //插入文章
            String sql = "insert into Articles_Lable(name,keycount) values('" + lable + "'," + 1 + ")";

            cmd.CommandText = sql;
            n = cmd.ExecuteNonQuery();

            con.Close();
        }     
    }

    public static bool GetLableByName(string lable) //验证标签是否存在
    {
        OpenConnection();
        con.Open();
        String sql = "select name from Articles_Lable where name='" + lable + "' ";
        DataTable ds = new DataTable();
        SqlCommand cmd = new SqlCommand(sql, con);

        SqlDataReader read = cmd.ExecuteReader();

        if (read.Read())//存在此标签
        {

            UpdateLableByName(lable);

            con.Close();
            return false;

        }
        else
        {
            con.Close();
            return true;
        }
    }

    public static void UpdateLableByName(string lable)
    {

        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        String sql = "update Articles_Lable set keycount=keycount+1   where name='" + lable + "' ";
        cmd.CommandText = sql;
        cmd.ExecuteNonQuery();

        con.Close();
    }
    /*
    public static int InsertCoverImg(int userid,string CoverImg)//插入文章图片(按照用户id)
    {
        int n = 0;
        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        String sql = "insert into Articles(CoverImg) values('" + CoverImg + "') ";

        cmd.CommandText = sql;
        n = cmd.ExecuteNonQuery();

        con.Close();
        return n;
    }
     * 
     * */
}