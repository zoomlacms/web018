<%@ WebHandler Language="C#" Class="UploadFileHandler" %>
using System;
using System.Web;
using System.IO;
using ZoomLa.BLL;
using ZoomLa.Model;
using ZoomLa.Components;
using System.Linq;
   
/*
 *用于文件工厂,OA附件上传
 */ 

public class UploadFileHandler : IHttpHandler {

    B_DocModel bll = new B_DocModel();
    M_DocModel model = new M_DocModel();
    B_Admin badmin = new B_Admin();
    //不允许上传html等
    /// <summary>
    /// true包含不允许上传的后缀名
    /// </summary>
    public bool extFilter(string fileName) 
    {
        string[] extArr = new string[] {"aspx","asp","html","htm","php","jsp","exe","swf" };
        bool flag = false;
        string extName = fileName.Split('.')[(fileName.Split('.').Length-1)].ToLower().Trim();
        flag=extArr.Select(p => p).Contains(extName);
        return flag;
    }
    public void ProcessRequest(HttpContext context)
    {
        B_User.CheckIsLogged();
        B_User buser = new B_User();
        M_UserInfo mu = buser.GetLogin();
        
        context.Response.ContentType = "text/plain";
        HttpPostedFile file = context.Request.Files["Filedata"];
        string uploadPath = "";
        string action = HttpContext.Current.Request.Params["action"];
        if (extFilter(file.FileName)) 
        {
            context.Response.Write("不允许上传该后缀名的文件"); context.Response.End();
        }
        if (string.IsNullOrEmpty(action))
        {
            uploadPath = HttpContext.Current.Server.MapPath("~/UploadFiles/DocTemp/");//+ HttpContext.Current.Request.Params["userName"]+"/"
            #region 文件工厂
            //if (file != null)
            //{
            //    if (!Directory.Exists(uploadPath))
            //    { Directory.CreateDirectory(uploadPath); }
            //    file.SaveAs(uploadPath + file.FileName);
            //    //------------- Isert To DataBase ZL_DocModel
            //    model.AddTime = DateTime.Now;
            //    model.AddUser = "";
            //    model.AllowGroup = "1";
            //    model.DocName = file.FileName;
            //    model.Status = 2;
            //    model.ParentID = HttpContext.Current.Request.Params["passwd"];
            //    model.TemUrl = "~/UploadFiles/DocTemp/" + HttpContext.Current.Request.Params["userName"] + file.FileName;

            //    bll.insert(model);
            //    //不返回,则前台不会自动将其显示消去.
            //    context.Response.Write("1");
            //}
            //else
            //{
            //    context.Response.Write("0");

            //}
            #endregion
        }
        else
        {
            string ppath = "", result = "0";
            uploadPath = SiteConfig.SiteOption.UploadDir;
            switch (action)
            {
                case "OAattach":
                    uploadPath += "OA/"+mu.UserName+"/";
                    ppath = context.Server.MapPath(uploadPath);
                    //判断是否有同名文件的存在
                    break;
                case "Blog":
                    uploadPath += "Blog/"+mu.UserName+"/";
                    ppath = context.Server.MapPath(uploadPath);
                    break;
            }
            if (!Directory.Exists(ppath))
            { Directory.CreateDirectory(ppath); }

            file.SaveAs(ppath + file.FileName);
            result = "1";
            context.Response.Write(result); context.Response.End();
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}