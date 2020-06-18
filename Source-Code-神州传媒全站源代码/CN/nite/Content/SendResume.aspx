<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Content_SendResume, App_Web_wyrlwthp" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>





<asp:Content ContentPlaceHolderID="Head" runat="Server">
  <title>投简历</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="Content" runat="Server">
   <div class="us_topinfo">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">找工作</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 
        <div class="cleardiv">
        </div>
    </div>
    <table class="table table-bordered table-hover table-striped" style="margin: 0 auto;">
        <tr align="center">
            <td width="20%" class="title">
                单位名称
            </td>
            <td width="20%" class="title">
                职位名称
            </td>
            <td width="40%" class="title">
                职位描述
            </td>
            <td width="20%" class="title">
                操作
            </td>
        </tr>
          <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" >
                <Columns>
                      <asp:TemplateField HeaderText="操作">
            <ItemTemplate>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td height="22" align="center">
                        <%#Eval("JSclass")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("JName")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Jinfo")%>
                    </td>
                    <td height="22" align="center">
                        <a href="JobInfo.aspx?ID=<%#Eval("Jid") %>">查看详细</a> | 
                        <%#GetVote(Eval("Jid").ToString())%>
                       
                    </td>
                </tr>
                 </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
        </ZL:ExGridView>
    </table>
</asp:Content>
