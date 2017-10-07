<%@ WebHandler Language="C#" Class="UploadHandler" %>

using System;
using System.Web;
using System.IO;
using System.Web.SessionState;

/// <summary>
/// /用户头像上传
/// </summary>
public class UploadHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public bool IsReusable {
        get {
            return false;
        }
    }
    
    
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.Charset = "utf-8";

        HttpPostedFile file = context.Request.Files["Filedata"];
        
        if (file != null)
        {
            
            //上传图片的扩展名
            string fileExtension = Path.GetExtension(file.FileName);//上传文件的后缀
            //判断文件格式
            if (!CheckValidExt(fileExtension))
            {
                context.Response.Write("错误提示：文件格式不正确！" + fileExtension);
                return;
            }
            //使用时间+随机数重命名文件
            string strDateTime = DateTime.Now.ToString("yyMMddhhmmssfff");//取得时间字符串
            Random ran = new Random();
            string strRan = Convert.ToString(ran.Next(100, 999));//生成三位随机数
            string saveName = strDateTime + strRan + fileExtension;

            int userid = (int)context.Session["userid"];
            
            string path = "/files/uploads/"+userid+"/";

            //string path = "/files/uploads/";
            string uploadPath = HttpContext.Current.Server.MapPath(path);
            //判断是否有该文件夹，没有就创建
            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }

            file.SaveAs(uploadPath + saveName);

            DB_2.DeleteImgTop((int)context.Session["userid"]);//删除原头像
            
            DB_2.InsertImgTop(userid, path + saveName);//添加到数据库

            
            
            /*
            int userid = (int)HttpContext.Current.Session["userid"];
            DB_2.InsertImgTop(userid,path+saveName);

            DB_2.DeleteImgTop(userid);
            */
            //下面这句代码缺少的话，上传成功后上队列的显示不会自动消失，并返回修改后的文件名称
            context.Response.Write(path + saveName);           
        }
        else
        {
            context.Response.Write("上传失败" + context.Session["userid"]);
        }
    }


    ///
    /// 检测扩展名的有效性 +bool CheckValidExt(string sExt)
    ///
    /// 文件名扩展名
    /// 如果扩展名有效,返回true,否则返回false.
    public bool CheckValidExt(string strExt)
    {
        string AllowExt = "gif|jpeg|jpg|mpeg|mpg|png";//支持的文件格式
        bool flag = false;
        string[] arrExt = AllowExt.Split('|');
        foreach (string filetype in arrExt)
        {
            if (filetype.ToLower() == strExt.ToLower().Replace(".", ""))
            {
                flag = true;
                break;
            }
        }
        return flag;
    }

}