using System.Linq;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// DB_3 的摘要说明
/// </summary>
public class DB_3
{
    private static string ConnString;
    private static SqlConnection con;
	public DB_3()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

   
    public static void OpenConnection()
    {
        ConnString = ConfigurationManager.ConnectionStrings["ConnString"].ToString();//获得数据库连接配置文件
        con = new SqlConnection(ConnString); //创建连接对象con
    }

    
    public static int Delete_ID_Article(int id)//按照id删除文章
    {
        int n = 0;
        OpenConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        String sql = "delete from Articles where ArticleID="+id+"";
        cmd.CommandText = sql;
        n = cmd.ExecuteNonQuery();

        con.Close();
        return n;
    }
}