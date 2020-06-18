<%@ page language="C#" autoeventwireup="true" inherits="manage_User_SitePermissionGuide, App_Web_oy2d05np" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>角色管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr class="gridtitle" align="center" style="height: 25px;">
      <td height="26" colspan="2"><strong>
        <asp:Label ID="Label1" runat="server" Text="添加角色"></asp:Label>
        </strong></td>
    </tr>
    <tr>
      <td height="24" class="tdbgleft" style="width: 237px"><strong>角色名称：</strong></td>
      <td width="75%" height="24"><asp:TextBox class="form-control" style="max-width:200px;" ID="txtRoleName" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoleName" ErrorMessage="角色名不能为空!"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td class="tdbgleft" style="height: 24px; width: 237px;"><strong>角色说明：</strong></td>
      <td style="height: 24px"><asp:TextBox class="form-control" style="max-width:200px;" ID="txtInfo" runat="server" Width="432px" /></td>
    </tr>
    <tr>
      <td height="24" class="tdbgleft" style="width: 237px"><strong>优先级别：</strong></td>
      <td height="24"><asp:TextBox class="form-control"  ID="txtPrecedence" runat="server" Width="84px">0</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrecedence" Display="Dynamic" ErrorMessage="格式不正确!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrecedence" Display="Dynamic" ErrorMessage="不能为空!"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td height="24" class="tdbgleft" style="width: 237px"><strong>是否启用：</strong></td>
      <td height="24"><asp:RadioButtonList ID="txtIsTrue" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">启用</asp:ListItem>
          <asp:ListItem Value="0">停用</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
    <tr class="gridtitle">
      <td height="26" colspan="2" align="center"><strong>权限设置</strong></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><table width="100%">
          <tr class="tdbgleft">
            <td  align="center" style="height: 24px"><strong>选择子站</strong></td>
            <td  align="center" style="height: 24px"><strong>选择节点</strong></td>
          </tr>
          <tr>
            <td  align="center" class="tdbg"><asp:ListBox class="form-control" style="max-width:350px;" Height="284px" ID="DataList" runat="server" Width="216px" SelectionMode="Multiple"></asp:ListBox></td>
            <td  align="center" class="tdbg"><asp:ListBox class="form-control" style="max-width:350px;" Height="284px" ID="Nodelist" runat="server" Width="216px" SelectionMode="Multiple"></asp:ListBox></td>
          </tr>
        </table></td>
    </tr>
      <tr >
    
      <td height="24" class="tdbgleft" style="width: 237px"><strong>允许内容浏览：</strong></td>
      <td width="75%" height="24"><asp:RadioButtonList ID="ViewContent" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">开放</asp:ListItem>
          <asp:ListItem Value="0">关闭</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
      <tr>
    
      <td class="tdbgleft" style="height: 24px; width: 237px;"><strong>允许列表浏览：</strong></td>
      <td style="height: 24px"><asp:RadioButtonList ID="ListContent" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">开放</asp:ListItem>
          <asp:ListItem Value="0">关闭</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
      <tr>
    
      <td height="24" class="tdbgleft" style="width: 237px"><strong>允许新增发布：</strong></td>
      <td height="24"><asp:RadioButtonList ID="AddContent" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">开放</asp:ListItem>
          <asp:ListItem Value="0">关闭</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
      <tr >
    
      <td height="24" class="tdbgleft" style="width: 237px"><strong>允许编辑修改：</strong></td>
      <td height="24"><asp:RadioButtonList ID="ModefiyContent" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">开放</asp:ListItem>
          <asp:ListItem Value="0">关闭</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
      <tr>
    
      <td height="24" class="tdbgleft" style="width: 237px"><strong>允许删除内容：</strong></td>
      <td height="24"><asp:RadioButtonList ID="DeleteContent" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">开放</asp:ListItem>
          <asp:ListItem Value="0">关闭</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
      <tr>
    
      <td height="24" class="tdbgleft" style="width: 237px"><strong>允许评论权限：</strong></td>
      <td height="24"><asp:RadioButtonList ID="AddComm" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">开放</asp:ListItem>
          <asp:ListItem Value="0">关闭</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
    <tr>
      <td height="26" colspan="2" class="tdbgleft" align="center"><asp:HiddenField ID="txtID" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="添加角色" OnClick="Button1_Click" class="btn btn-primary"/>
        <asp:Button ID="Button2" runat="server" Text="返回列表" OnClientClick="location.href='PermissionInfo.aspx';return false;" class="btn btn-primary"/></td>
    </tr>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
