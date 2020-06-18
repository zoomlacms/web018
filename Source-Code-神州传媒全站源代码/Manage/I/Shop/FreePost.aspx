<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_FreePost, App_Web_1qn0akdt" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>运费设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="spacingtitle" colspan="2" align="center">
                <asp:Literal ID="LTitle" runat="server" Text="免邮设置"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td style="width: 12%" class="tdbgleft">免邮方式：
            </td>
            <td>购买商品超出[<asp:TextBox ID="Ghowm" CssClass="form-control" Style="width: 80px" runat="server"></asp:TextBox>]元， 免邮(0为不免邮)
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">是否包括特价商品
            </td>
            <td>
                <asp:RadioButton ID="Freetrue" GroupName="free" runat="server" /><label for="Freetrue">是</label>
                <asp:RadioButton ID="FreeFalse" GroupName="free" runat="server" /><label for="FreeFalse">否</label>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" class="tdbg" style="height: 49px">
                <asp:Button ID="SaveFree" runat="server" class="btn btn-primary" Text="保存设置" OnClick="SaveFree_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>