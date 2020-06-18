<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_MonthlyReport, App_Web_ojtrgi2n" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>省市报表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:GridView ID="EGV" RowStyle-HorizontalAlign="Center" DataKeyNames="code" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" PageSize="15" class="table table-striped table-bordered table-hover" OnRowCommand="Lnk_Click" EmptyDataText="无相关数据">
    <Columns>                                                                      
        <asp:BoundField DataField="name" HeaderText="省份">
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            <HeaderStyle Width="50%" />
        </asp:BoundField>  
        <asp:TemplateField HeaderText="订单总数">
            <ItemTemplate>
                <%# GetOrderNum(Container.DataItem) %>                                
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="订单总额">
            <ItemTemplate>
                <%# GetOrderAmount(Container.DataItem) %>                                
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        </asp:TemplateField>       
        <asp:TemplateField HeaderText="列表">                
            <ItemTemplate>
              <asp:LinkButton ID="LinkButton3" runat="server" CommandName="CheckList" CommandArgument='<%# Eval("code") %>'>订单列表</asp:LinkButton>
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        </asp:TemplateField>
    </Columns>
     <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />                
</asp:GridView>
    <asp:Label ID="thisall" runat="server"></asp:Label>
    <asp:HiddenField ID="HdnGradeID" Value="0" runat="server" />
    <asp:HiddenField ID="HdnParentID" Value="0" runat="server" />
    <asp:HiddenField ID="HdnCateID" Value="0" runat="server" />
    <asp:HiddenField ID="HdnLastLevel" Value="0" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
