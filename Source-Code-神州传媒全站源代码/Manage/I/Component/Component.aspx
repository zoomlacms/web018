<%@ page language="C#" autoeventwireup="true" inherits="manage_Component_Component, App_Web_bhchc4rv" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>组件列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab1000" onclick="ShowTabs(1000)">所有组件</a></li>
            <li><a href="#tab0" onclick="ShowTabs(0)">待审核</a></li>
            <li><a href="#tab99" onclick="ShowTabs(99)">已审核</a></li>
        </ul>
    </div>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有内容">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="chkSel" title="" value='<%#Eval("Id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="所属会员" DataField="UID" />
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate>
                    <%# getSubstring(25, Eval("Title"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="链接地址">
                <ItemTemplate>
                    <%# getSubstring(25, Eval("Url"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <%#GetStatus(Eval("Status", "{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改时间">
                <ItemTemplate>
                    <%# Convert.ToDateTime(Eval("UpdateTime")).ToString("yyyy-MM-dd")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddEditComponent.aspx?Id=<%# Eval("ID") %>">修改</a> |
                    <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Hiddle" CommandArgument='<%# Eval("Id")%>'>审核</asp:LinkButton>
                    |
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del1" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('确实要删除此项组件吗？');">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div>
        <asp:Button ID="btnAudit" CausesValidation="false" runat="server" Text="审核通过" CssClass="btn btn-primary" OnClick="btnShow_Click" OnClientClick="if(!IsSelectedId()){alert('请选择一项项以上');return false;}else{return confirm('你确定要审核选中内容吗？')}" />
        <asp:Button ID="btnUnAudit" CausesValidation="false" runat="server" Text="取消审核" CssClass="btn btn-primary" OnClick="btnHanddle_Click" OnClientClick="if(!IsSelectedId()){alert('请选择一项项以上');return false;}else{return confirm('你确定要取消审核选中内容吗？')}" />
        <asp:Button ID="btnDeleteAll" CausesValidation="false" runat="server" Text="删除" CssClass="btn btn-primary" OnClick="btnDal_Click" OnClientClick="if(!IsSelectedId()){alert('请选择一项项以上');return false;}else{return confirm('你确定要将选中项删除吗？')}" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () {
            $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
            if (getParam("status")) {
                $("li a[href='#tab" + getParam("status") + "']").parent().addClass("active").siblings("li").removeClass("active");;
            }
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
    <script type="text/javascript">
        function ShowTabs(ID)
        {
            location.href = 'Component.aspx?status=' + ID;
        }
    </script>
    <script src="/JS/pacalendar.js" type="text/javascript"></script>
</asp:Content>
