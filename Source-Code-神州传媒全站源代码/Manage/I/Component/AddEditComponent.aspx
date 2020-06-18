<%@ page language="C#" autoeventwireup="true" inherits="manage_Component_AddEditComponent, App_Web_bhchc4rv" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>组件编辑</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center">
                <asp:Literal ID="LTitle" runat="server" Text="添加组件"></asp:Literal></td>
        </tr>
        <tr>
            <td style="width: 200px">
                <strong>标题：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtName" class="form-control" runat="server" MaxLength="200" /><font color="red">*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtName">标题不能为空</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <strong>链接地址：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtUrl" class="form-control" runat="server" MaxLength="50" /><font color="red">*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtUrl">链接地址不能为空</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <strong>图标地址：</strong><br />

            </td>
            <td>
                <asp:TextBox ID="txtIcon" class="form-control" runat="server" MaxLength="50" />推荐使用45px*45px大小<br />
            </td>
        </tr>
        <tr class="tdbgbottom">
            <td colspan="2">
                <asp:HiddenField ID="HdnModelId" runat="server" />
                <asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="保存" OnClick="EBtnSubmit_Click" runat="server" />
                <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="取消" onclick="location.href = 'Component.aspx'" />
            </td>
        </tr>
    </table>
</asp:Content>
