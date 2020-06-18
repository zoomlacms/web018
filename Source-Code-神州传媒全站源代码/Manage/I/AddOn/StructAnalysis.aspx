<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_StructAnalysis, App_Web_bq35uzuk" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>分析结构</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr class="gridtitle" align="center" style="height: 25px;">
                <td width="5%">ID</td>
                <td>结构名</td>
                <td>成员数</td>
                <td>查看</td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeat1_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td align="center" height="25">
                            <input type="checkbox" name="idChk" value="<%#Eval("ID") %>"/>
                            <%#Eval("ID") %>
                        </td>
                        <td align="center"><a href="<%#getUrl(Eval("Group").ToString(), Eval("ID").ToString()) %>"><%#Eval("Name") %></a> </td>
                        <td align="center"><%#GetNums(Eval("ID").ToString()) %></td>
                        <td align="center"><a href="<%#getUrl(Eval("Group").ToString(), Eval("ID").ToString()) %>">查看</a> </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td height="24" colspan="77" align="center">共
                        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条信息
                        <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />
                    /
                        <asp:Label ID="PageSize" runat="server" Text="" />
                    页
                        <span style="text-align: center">
                            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        </span>
                    条信息/页  转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    页
                </td>
            </tr>
            <tr>
            <tr>
                <td colspan="2" align="right">结构总数 </td>
                <td colspan="2">
                    <asp:Label ID="AllCount" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" align="right">系统结构总数 </td>
                <td colspan="2">
                    <asp:Label ID="mAllNum" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" align="right">用户结构总数 </td>
                <td colspan="2">
                    <asp:Label ID="uAllNum" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="6">
                    <asp:Button ID="del_btn" Text="一键删除结构" runat="server" CssClass="btn btn-primary" OnClick="del_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
