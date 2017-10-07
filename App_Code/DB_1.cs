using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
/// <summary>
/// DB_1 的摘要说明
/// </summary>
public class DB_1
{
    private static string ConnString;
    private static SqlConnection con;

	public  DB_1()  
	{
        
        
    }
    public static void OpenConnection()
    {
        ConnString = ConfigurationManager.ConnectionStrings["ConnString"].ToString();//获得数据库连接配置文件
        con = new SqlConnection(ConnString); //创建连接对象con
    }



    public static DataTable GetArticles() //按照日期降序顺序查询所有文章(存储过程)
    {
        OpenConnection();       
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("Get_All_Articles", con);
        sda.Fill(ds);

        return ds;
    }

    public static DataTable GetSortArticles(int CategoryaID) //按照日期降序顺序查询分类文章(存储过程)
    {
        OpenConnection();
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("Get_Sort_Articles", con);

        sda.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter p1 = new SqlParameter("@CategoryID_1", SqlDbType.Int);

        p1.Value = CategoryaID;//赋值第一个参数
        sda.SelectCommand.Parameters.Add(p1);

        sda.Fill(ds);

        return ds;
    }

    public static Articles Get_Only_Articles(int articleid) //按id获得文章(存储过程)
    {
        OpenConnection();
        con.Open();

        Articles c = new Articles();
        SqlCommand cmd = new SqlCommand("Get_Only_Articles", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter p1 = new SqlParameter("@ArticleID", SqlDbType.Int);

        p1.Value = articleid;//赋值第一个参数
        cmd.Parameters.Add(p1);

        SqlDataReader read = cmd.ExecuteReader();

        if (read.Read())
        {
            c.Title1 = read[1].ToString(); ;
            c.Description1 = read[2].ToString(); ;
            c.Userid = Int32.Parse(read[3].ToString());
            c.Acontent = read[4].ToString(); ;
            c.Createtime = (DateTime)read[5];
            c.CategoryID1 = Int32.Parse(read[6].ToString());
            c.IsTop1 = (bool)read[7];
            c.Readcount = Int32.Parse(read[8].ToString());
            c.Keywords = read[9].ToString(); ;
            c.Coverimg = read[10].ToString(); ;
            con.Close();
            return c;
        }
        else
        {
            con.Close();
            return null;
        }
    }


    public static DataTable Get_Userid_Articles(int userid) //按userid获得某个用户所有文章(存储过程)
    {
        OpenConnection();
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("Get_userid_Articles", con);

        sda.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter p1 = new SqlParameter("@userid", SqlDbType.Int);

        p1.Value = userid;//赋值第一个参数
        sda.SelectCommand.Parameters.Add(p1);

        sda.Fill(ds);

        return ds;
    }

    public static Customer GetCustomer(int userid) //获得个人信息(存储过程)
    {
        Customer c = new Customer();

        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand("Get_Only_Customer", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter p1 = new SqlParameter("@UserID", SqlDbType.Int);

        p1.Value = userid;//赋值第一个参数
        cmd.Parameters.Add(p1);

        SqlDataReader read = cmd.ExecuteReader();
        if (read.Read())
        {
            c.UserID = Int32.Parse(read[1].ToString());
            c.Phone = read[2].ToString();
            c.Email = read[3].ToString();
            c.Age = Int32.Parse(read[4].ToString());
            c.Sex = Int32.Parse(read[5].ToString());
            c.Hobby = read[6].ToString();
            c.Explain = read[7].ToString();
            c.Headimg = read[8].ToString();
            con.Close();
            return c;
        }
        else
        {
            con.Close();
            return null;
        }
    }



    //获得某个文章所有文章的评论(评论者名，评论时间，评论内容)(存储过程)
    public static DataTable GetComment(int id)
    {
        OpenConnection();
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("Get_All_Comment", con);

        sda.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter p1 = new SqlParameter("@ArticleID", SqlDbType.VarChar);

        p1.Value = id;//赋值第一个参数
        sda.SelectCommand.Parameters.Add(p1);

        sda.Fill(ds);

        return ds;
    }
    public static Users GetUsers(string loginid, string pass) //用户名密码验证(存储过程)
    {
        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand("Get_Only_Users", con);

        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter p1 = new SqlParameter("@loginid", SqlDbType.VarChar);
        p1.Value =loginid;//赋值第一个参数
        cmd.Parameters.Add(p1);

        SqlParameter p2 = new SqlParameter("@pass", SqlDbType.VarChar);
        p2.Value = pass;//赋值第二个参数
        cmd.Parameters.Add(p2); 

        SqlDataReader read = cmd.ExecuteReader();
        Users user = new Users();
        if (read.Read())
        {
            user.Userid = Int32.Parse(read[0].ToString());
            user.Loginid = read[1].ToString();
            user.Pass = read[2].ToString();
            user.Role = Int32.Parse(read[3].ToString());
            con.Close();
            return user;
        }
        else 
        {
            con.Close();
            return null;
        }
   
    }
    public static bool GetUserID(string loginid) //验证用户名是否存在
    {
        OpenConnection();
        con.Open();
        String sql = "select * from Users where LoginID='" + loginid + "' ";
        DataTable ds = new DataTable();
        SqlCommand cmd = new SqlCommand(sql, con);

        SqlDataReader read = cmd.ExecuteReader();
        Users user = new Users();
        if (read.Read())
        {

            con.Close();
            return false;

        }
        else 
        {
            con.Close();
            return true;
        }
    }
    public static DataTable GetNavs() //获得所有导航栏(存储过程)
    {
        OpenConnection();
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("GetNavs", con);
        sda.Fill(ds);

        return ds;
    }


    public static DataTable GetCategories() //获得所有文章分类导航栏用(存储过程)
    {
        OpenConnection();
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("GetCategory", con);
        sda.Fill(ds);

        return ds;
    }

    public static DataTable GetCategories2() //获得所有文章分类写文章使用(存储过程)
    {
        OpenConnection();
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("GetCategories", con);
        sda.Fill(ds);

        return ds;
    }

    

    public static DataTable Get10Articles() //获得阅读量前十文章(存储过程)
    {
        OpenConnection();
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("Get10Articles", con);
        sda.Fill(ds);
        
        return ds;
    }

    public static DataTable GetkeyArticles(string key) //获得搜索的文章(存储过程)
    {
        OpenConnection();
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("GetkeyArticles", con);


        sda.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter p1 = new SqlParameter("@Key", SqlDbType.VarChar);

        p1.Value = key;//赋值第一个参数
        sda.SelectCommand.Parameters.Add(p1);

        sda.Fill(ds);

        return ds;
    }

    public static DataTable GetLableArticles() //获得排名前10标签(存储过程)
    {

        OpenConnection();
        DataTable ds = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("GetLableArticles", con);
        sda.Fill(ds);

        return ds;
    }

    
}