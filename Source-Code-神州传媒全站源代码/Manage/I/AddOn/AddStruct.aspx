<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_AddStruct, App_Web_4fw0kl51" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>添加项目类型</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <table class="table table-striped table-bordered table-hover">
        <tr class="spacingtitle" style="height: 30px;">
            <td align="center" colspan="2">
                <asp:Label ID="lblText" runat="server">组织结构</asp:Label></td>
        </tr>
        <tr>
            <td style="width:120px;"><strong>父结构：</strong></td>
            <td>
                <asp:Label runat="server" ID="parent_L" />
            </td>
        </tr>
        <tr>
            <td style="width:120px;"><strong>结构名：</strong></td>
            <td>
                <asp:TextBox ID="TxtStructName" class="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ID="r1" ControlToValidate="TxtStructName" ForeColor="Red" ErrorMessage="结构名不能为空" />
                <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>
            </td>
        </tr>
         <tr>
            <td><strong>结构描述：</strong></td>
            <td>
                <asp:TextBox runat="server" ID="Remind_T" CssClass="form-control" TextMode="MultiLine" style="height:150px;"/>
            </td>
        </tr>
         <tr>
            <td><strong>是否启用：</strong></td>
            <td>
                <asp:RadioButtonList runat="server" ID="rd1" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">禁用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td><strong>操作：</strong></td>
            <td>
                <asp:Button ID="BtnCommit" runat="server" Text="提交" class="btn btn-primary" OnClick="Button1_Click" />
                <input type="button" value="返回" class="btn btn btn-primary" onclick="history.go(-1);"/>
            </td>
        </tr>
    </table>
</asp:Content>
