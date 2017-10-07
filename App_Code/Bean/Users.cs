using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Users 的摘要说明：用户登录表
/// </summary>
public class Users
{
    private int userid;

    public int Userid
    {
        get { return userid; }
        set { userid = value; }
    }
    private string loginid;

    public string Loginid
    {
        get { return loginid; }
        set { loginid = value; }
    }
    private string pass;

    public string Pass
    {
        get { return pass; }
        set { pass = value; }
    }
    private int role;

    public int Role
    {
        get { return role; }
        set { role = value; }
    }
	public Users()
	{
		
	}
}