using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Comments 的摘要说明
/// </summary>
public class Comments
{

    private int ArticleID; //：外键，评论的文章ID

    public int ArticleID1
    {
        get { return ArticleID; }
        set { ArticleID = value; }
    }
    private string NickName;	//：评论者名称

    public string NickName1
    {
        get { return NickName; }
        set { NickName = value; }
    }
    private string CContent;	//：评论内容

    public string CContent1
    {
        get { return CContent; }
        set { CContent = value; }
    }
    private string TCommentID;//：

    public string TCommentID1
    {
        get { return TCommentID; }
        set { TCommentID = value; }
    }
    private string Status;  // ：

    public string Status1
    {
        get { return Status; }
        set { Status = value; }
    }
    private string CreateTime; //：评论时间

    public string CreateTime1
    {
        get { return CreateTime; }
        set { CreateTime = value; }
    }
    private string IP; //：评论的ip地址

    public string IP1
    {
        get { return IP; }
        set { IP = value; }
    }

	public Comments()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
}