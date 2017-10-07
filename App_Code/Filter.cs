using System;
using System.Web;
using System.Web.SessionState;
/// Filter 的摘要说明
/// </summary>
public class Filter : IHttpModule, IRequiresSessionState
{
    public void Dispose() { }

         public void Init(HttpApplication application)
         {
             application.AcquireRequestState += new EventHandler(application_AcquireRequestState);
         }

         public void application_AcquireRequestState(object sender, EventArgs e)
         {
             HttpApplication application = sender as HttpApplication;
             HttpRequest request = application.Request;
             HttpResponse response = application.Response;

             string url=request.CurrentExecutionFilePath.Trim('/');
             string suffix = request.CurrentExecutionFilePathExtension.Trim('.');

             if (!url.Equals("Default.htm") && (suffix == "aspx" || suffix == "htm"))
             {
                 object sessionObj = application.Context.Session == null ? null : application.Session["userid"];
                 if (sessionObj==null)
                 {
                     response.Redirect("~/index.aspx");
                 }
             }
         }
    
}
