﻿<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Guest_Default, App_Web_tn5tq5w3" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>留言列表</title>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
    <div style="margin-bottom: 10px;">
        <div class="pull-left" style="line-height: 32px;">
            按留言标题搜索：
        </div>
        <div class="input-group pull-left" style="width: 300px;">
            <asp:TextBox CssClass="form-control" ID="Key_T" runat="server"></asp:TextBox>
            <span class="input-group-btn">
                <asp:Button ID="SearchBtn" CssClass="btn btn-default" runat="server" Text="搜索" OnClick="SearchBtn_Click" />
            </span>
        </div><div class="clearfix"></div>
    </div>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="GID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Lnk_Click" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
        <Columns>
		    <asp:TemplateField>                            
			    <ItemTemplate>
                    <input type="checkbox" name="chkSel" title="" value='<%#Eval("GID") %>' />
			    </ItemTemplate>
			    <ItemStyle  CssClass="tdbg" HorizontalAlign="Center"/>
			    <HeaderStyle Width="5%"/>
		    </asp:TemplateField>
		    <asp:BoundField DataField="GID" HeaderText="ID">
		    <ItemStyle  CssClass="tdbg" HorizontalAlign="Center"/>
		    <HeaderStyle Width="5%"/>
		    </asp:BoundField>                                               
		    <asp:TemplateField HeaderText="标题">
			    <ItemTemplate>                                
			       <a href="guestbookshow.aspx?CateID=<%# Eval("CateID")%>&GID=<%# Eval("GID")%>"><%# Eval("Title")%></a>
			    </ItemTemplate>
			     <ItemStyle  CssClass="tdbg" HorizontalAlign="Center"/>
			     <HeaderStyle Width="20%"/>
		    </asp:TemplateField>
		    <asp:TemplateField HeaderText="留言时间">
			    <ItemTemplate>                                
			       <%#Eval("GDate") %>
			    </ItemTemplate>
			     <ItemStyle  CssClass="tdbg" HorizontalAlign="Center"/>
			     <HeaderStyle Width="15%"/>
		    </asp:TemplateField>   
		    <asp:TemplateField HeaderText="留言IP">
			    <ItemTemplate>                                
			       <%#Eval("IP") %>
			    </ItemTemplate>
			     <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
			     <HeaderStyle Width="10%"/>
		    </asp:TemplateField>                                                  
		    <asp:TemplateField HeaderText="操作">                
		    <ItemTemplate>                
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="RList" CommandArgument='<%# Eval("GID")+"&CateID="+Eval("CateID") %>'>回复列表</asp:LinkButton> | 
                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Reply" CommandArgument='<%# Eval("GID")+"&CateID="+Eval("CateID") %>'>回复</asp:LinkButton> | 
			    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("GID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton> | 
			    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="QList" CommandArgument='<%# Eval("GID")+"&CateID="+Eval("CateID") %>'>留言内容</asp:LinkButton>
		    </ItemTemplate>
		    <ItemStyle HorizontalAlign="Center"/>
		    <HeaderStyle Width="10%"/>
		    </asp:TemplateField>
	    </Columns>
        <PagerStyle CssClass="tdbg" HorizontalAlign="Center"  />
		<RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
<div class="clearbox"></div>           
<table  class="TableWrap"  border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
	<tr>
		<td style="height: 21px">                   
			<asp:Button ID="btndelete" runat="server" CssClass="btn btn-primary" OnClientClick="return confirm('确定要删除选中的项目吗？')" Text="批量删除" OnClick="btndelete_Click" />
			<asp:HiddenField ID="HdnCateID" runat="server" />
		</td>
	</tr>                
</table>
<style>
    th{ text-align:center;}
</style>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script>
    $().ready(function () {
        $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
        //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
        $("#chkAll").click(function () {//EGV 全选
            selectAllByName(this, "chkSel");
        });
    });
</script>
</asp:Content>