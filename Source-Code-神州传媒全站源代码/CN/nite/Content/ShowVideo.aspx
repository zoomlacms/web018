<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Content_ShowVideo, App_Web_wyrlwthp" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content ContentPlaceHolderID="Head" runat="Server">
  <title>视频预览</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
     <div class="us_topinfo">
           
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">视频预览</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 

        <div class="cleardiv">
        </div>
    </div>
    <table class="table table-bordered table-hover table-striped">
    <tr align="center">
    <td><%=title %></td>
    </tr>
    <tr align="center" id="uptr" runat="server">
    <td>【<a href="AddVideo.aspx?ID=<%=Request.QueryString["ID"] %>" style="color:Red">修改</a>】</td>
    </tr>
    <tr align="center">
    <td><%=content %></td>
    </tr>
    <tr align="center">
    <td><iframe style="border:none; border:1px solid #ddd;" src="<%=url %>" width="600px" height="400px"></iframe></td>
    </tr>
    </table>
  
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>
