<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_ServerClusterConfig, App_Web_5mkcq5mn" masterpagefile="~/Manage/Site/SiteMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content runat="server" ContentPlaceHolderID="head">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>集群配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p style="float:left;"> 站群中心 >> 集群配置</p></div>
    <div id="site_main" style="margin-left:2%;">
    <div id="tab3">
    <div style="width:100%">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="True" RowStyle-CssClass="tdbg" 
            MouseOverCssClass="tdbgmouseover" CellPadding="2" CellSpacing="1" Width="100%" OnRowCommand="EGV_RowCommand" OnRowCancelingEdit="EGV_RowCancelingEdit"
            GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！"  AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" ReadOnly="true"/>
                <asp:TemplateField HeaderText="网址">
                    <ItemTemplate>
                        <a href="<%#Eval("SiteUrl") %>" target="_blank" title=""><%#Eval("SiteUrl") %></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eSiteUrl" Text='<%#Eval("SiteUrl") %>' style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="网站名称">
                    <ItemTemplate>
                        <%#Eval("SiteName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eSiteName" Text='<%#Eval("SiteName") %>'  style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用户名">
                    <ItemTemplate>
                        <%#Eval("SiteUser") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eSiteUser" Text='<%#Eval("SiteUser") %>'  style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="密码" Visible="false">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eSitePasswd" Text='<%#cr.Decrypt(Eval("SitePasswd")as string) %>'  style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="后台路径">
                    <ItemTemplate>
                        <%#Eval("CustomPath") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eCustomPath" Text='<%#Eval("CustomPath") %>'  style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CommandName="Edit2" CommandArgument='<%# Container.DisplayIndex %>'>修改</asp:LinkButton>
                       <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗');">删除</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                     <asp:LinkButton ID="Save" runat="server" CommandName="Save" CommandArgument='<%# Container.DisplayIndex+":"+Eval("ID") %>'>更新</asp:LinkButton>
                     <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Container.DisplayIndex %>'>取消</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>  
    </div> 
    </div>
    <table>
            <tr>
                <td>网址：</td>
                <td>
                    <asp:TextBox runat="server" ID="siteUrl" CssClass="site_input" />示例:http://www.baidu.com/</td>
            </tr>
            <tr>
                <td>用户名：</td>
                <td>
                    <asp:TextBox runat="server" ID="siteUser" CssClass="site_input" />
                </td>
            </tr>
            <tr>
                <td>密码：</td>
                <td>
                    <asp:TextBox runat="server" ID="sitePasswd" CssClass="site_input" />
                </td>
            </tr>

            <tr>
                <td>网站名称：</td>
                <td>
                    <asp:TextBox runat="server" ID="siteName" CssClass="site_input" />
                    <asp:Button runat="server" ID="GetCustomPath" Text="获取" OnClick="GetCustomPath_Click" CssClass="site_button" />
                </td>
            </tr>
            <tr>
                <td>后台管理路径：</td>
                <td>
                    <asp:TextBox runat="server" ID="NewcustomPath" CssClass="site_input" />

                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button runat="server" ID="addBtn" OnClick="addBtn_Click" Text="添加" CssClass="site_button" />
                    <asp:Button runat="server" ID="Button1" Text="取消" CssClass="site_button" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
