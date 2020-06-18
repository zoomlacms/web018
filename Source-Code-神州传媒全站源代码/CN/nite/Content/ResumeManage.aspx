<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Content_ResumeManage, App_Web_wyrlwthp" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="Head" runat="Server">
    <title>应聘职位简历列表</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div class="us_topinfo">
        <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">应聘职位简历列表</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" />   

            <div class="cleardiv">
            </div>
        </div>
        <div class="clearbox">
        </div>
        <div style="position: relative;">

     <ul class="nav nav-tabs">
        <li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)">未邀请应聘者</a></li>
        <li><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)">已邀请应聘者</a></li>
    </ul>
           <ZL:ExGridView ID="EGV" RowStyle-HorizontalAlign="Center" DataKeyNames="Mid" runat="server" AutoGenerateColumns="False" AllowPaging="True"
         PageSize="10" class="table table-bordered table-hover table-striped" OnPageIndexChanging="EGV_PageIndexChanging"   EmptyDataText="<font color='red'>暂时没有数据</font>">
                <Columns>
                    <asp:BoundField HeaderText="简历ID" DataField="Mid" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField HeaderText="应聘者" HeaderStyle-Width="25%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#GetUname(Eval("UserID").ToString(), Eval("JobID").ToString())%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="应聘职位" HeaderStyle-Width="25%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#GetJob(Eval("JobID").ToString())%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="投递时间" DataField="Mtime" HeaderStyle-Width="25%" ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField HeaderText="操作" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text="邀请面试" OnClientClick="return confirm('确定要邀请这位应聘者吗？');"
                                Visible ='<%#GetE(Eval("UserID").ToString(), Eval("JobID").ToString()) %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" Text="删除" OnClientClick="return confirm('确定删除该这封简历吗？');"
                                OnClick="LinkButton2_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                  <PagerStyle HorizontalAlign="Center"/>
            </ZL:ExGridView>
        </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
    <script  type="text/javascript" src="../../../JS/calendar.js"></script>
    <script type="text/javascript">
         var tID = 0;
         var arrTabTitle = new Array("TabTitle0", "TabTitle1");
         var arrTabs = new Array("Div0", "Div1");

    function ShowTabs(ID) {
        location.href = 'ResumeManage.aspx?id=' + ID;
    }
    function pload() {
        var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID) {
            document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            tID = ID;
        }
    }
</script>
</asp:Content>



