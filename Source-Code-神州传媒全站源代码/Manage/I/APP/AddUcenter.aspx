<%@ page language="C#" autoeventwireup="true" inherits="manage_APP_AddUcenter, App_Web_bhr02035" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加授权</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table class="table table-striped table-bordered table-hover">
      <tr class="spacingtitle" style="height:30px;">
        <td align="center" colspan="2" ><asp:Label ID="lblText" runat="server">添加授权网站</asp:Label></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td style="width: 150px" class="tdbgleft"><strong>网站域名：</strong></td>
        <td><asp:TextBox ID="TxtWebSite" class="form-control" runat="server" />
          <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>输入网站URL如Domain.com(不含http://)
          <asp:RegularExpressionValidator  runat="server" ID="RegularExpressionValidator3" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"  ControlToValidate="TxtWebSite" ErrorMessage="请输入正确格式"></asp:RegularExpressionValidator>  
         </td>
      </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td  class="tdbgleft"><strong>允许添加用户：</strong></td>
        <td><asp:RadioButtonList ID="isAddRbl" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem Value="1">是</asp:ListItem>  <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
            </asp:RadioButtonList></td>
      </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft"><strong>允许修改用户资料：</strong></td>
        <td><asp:RadioButtonList ID="isUpdateRbl" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
            </asp:RadioButtonList></td>
      </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft"><strong>允许删除用户：</strong></td>
        <td><asp:RadioButtonList ID="isDelRbl" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
            </asp:RadioButtonList></td>
      </tr>
         <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft"><strong>接受订单：</strong></td>
        <td><asp:RadioButtonList ID="IsOrderRbl" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
            </asp:RadioButtonList></td>
      </tr>

  </table>
  <div class="clearbox"></div>
  <div>
    <asp:Button ID="BtnCommit" runat="server" Text="提交"  class="btn btn-primary" onclick="Button1_Click"/>
    &nbsp;&nbsp; 
    <asp:Button ID="Btn" runat="server" Text="返回" class="btn btn-primary" onclick="Button2_Click" />
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>