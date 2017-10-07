using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Articles 的摘要说明
/// </summary>
public class Articles
{
	public Articles()
	{		
	}
    private int articleid;

    public int Articleid
    {
        get { return articleid; }
        set { articleid = value; }
    }
    private string Title;

    public string Title1
    {
        get { return Title; }
        set { Title = value; }
    }
    private string Description;  //文章描述，引出文章	

    public string Description1
    {
        get { return Description; }
        set { Description = value; }
    }

    private int userid;  //Users表外键，谁的文章

    public int Userid
    {
        get { return userid; }
        set { userid = value; }
    }
    private string acontent;  //文章内容

    public string Acontent
    {
        get { return acontent; }
        set { acontent = value; }
    }
    private DateTime createtime;

    public DateTime Createtime
    {
        get { return createtime; }
        set { createtime = value; }
    }
    private int CategoryID;  //文章分类

    public int CategoryID1
    {
        get { return CategoryID; }
        set { CategoryID = value; }
    }
    private bool IsTop;  //是否置顶

    public bool IsTop1
    {
        get { return IsTop; }
        set { IsTop = value; }
    }
    private int readcount;  //阅读次数，点击一次算一次

    public int Readcount
    {
        get { return readcount; }
        set { readcount = value; }
    }
    private string keywords;  //文章标签

    public string Keywords
    {
        get { return keywords; }
        set { keywords = value; }
    }
    private string coverimg;

    public string Coverimg
    {
        get { return coverimg; }
        set { coverimg = value; }
    }
}