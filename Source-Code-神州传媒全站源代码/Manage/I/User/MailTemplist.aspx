<%@ page language="C#" autoeventwireup="true" inherits="manage_User_MailTemplist, App_Web_3i5lpjsb" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件模板</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="divbox" id="nocontent" runat="server">
        <div style="width: 100%; height: 19px; text-align: center;" class="title">邮件模板</div>
        暂无模板
    </div>
    <asp:GridView ID="EGV" runat="server" Width="100%" AutoGenerateColumns="False" OnRowCommand="Row_Command" class="table table-striped table-bordered table-hover">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <ItemTemplate>
                    <asp:CheckBox ID="cheCk" runat="server" />
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="5%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="模板名称">
                <ItemTemplate><a href="AddMailTemp.aspx?id=<%#Eval("ID")%>" title='<%# Eval("TempName")%>'><%# Eval("TempName")%></a> </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="20%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="缩略图">
                <ItemTemplate>
                    <img src="<%# Eval("Pic")%>" alt="缩略图" width="50" height="50" onerror="this.src='/UploadFiles/nopic.gif';" />
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="10%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="模板类型">
                <ItemTemplate><a href="MailTemplist.aspx?type=<%#Eval("Type")%>" title='<%# Eval("TempName")%>'><%# GetType(Convert.ToInt32(Eval("Type")))%> </a></ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="8%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建人">
                <ItemTemplate><%# Eval("AddUser")%> </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="8%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建日期">
                <ItemTemplate><%# Eval("CreateTime", "{0:yyyy-MM-dd}")%> </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="13%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="View" runat="server" CommandName="View" CommandArgument='<%# Eval("ID")%>'>预览</asp:LinkButton>
                    <asp:LinkButton ID="update" runat="server" CommandName="update" CommandArgument='<%# Eval("ID")%>'>修改</asp:LinkButton>
                    <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实要删除此模板吗？');" CommandArgument='<%# Eval("ID")%>' Text="删除"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="9%" HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td style="height: 22px; text-align: center;" colspan="10"><span style="text-align: center">共
          <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条数据
          <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：
          <asp:Label ID="Nowpage" runat="server" Text="" />
                /
          <asp:Label ID="PageSize" runat="server" Text="" />
                页
          <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" Text="10" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                条数据/页 转到第
          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
              OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
          </asp:DropDownList>
                页
          <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </span></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
