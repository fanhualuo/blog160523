using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Customer 的摘要说明:个人信息表
/// </summary>
public class Customer
{
    private int userid;

    public int UserID
    {
        get { return userid; }
        set { userid = value; }
    }

    
    private string phone;

    public string Phone
    {
        get { return phone; }
        set { phone = value; }
    }
    private string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    private int age;

    public int Age
    {
        get { return age; }
        set { age = value; }
    }
    private int sex;

    public int Sex
    {
        get { return sex; }
        set { sex = value; }
    }
    private string hobby; //爱好

    public string Hobby
    {
        get { return hobby; }
        set { hobby = value; }
    }
    private string explain;//简介

    public string Explain
    {
        get { return explain; }
        set { explain = value; }
    }
    private string headimg;//头像

    public string Headimg
    {
        get { return headimg; }
        set { headimg = value; }
    }
    

	public Customer()
	{
		
	}
}