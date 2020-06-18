<%@ page language="C#" autoeventwireup="true" inherits="User.Message, App_Web_0qcgjazw" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>信息管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
        <table class="table table-striped table-bordered table-hover">
            <tr align="center">
                <td colspan="4" class="spacingtitle"><b>批量删除操作</b></td>
            </tr>
            <tr>
                <td style="text-align:right;width:25%;"><strong>批量删除会员（发件人）短消息：<br />
                </strong>可以用英文状态下的逗号将用户名隔开实现多会员同时删除 </td>
                <td>
                    <asp:TextBox class="form-control" ID="TxtSender" runat="server" style="float:left;margin-right:5px;"></asp:TextBox>
                    <asp:Button ID="BtnDelSender" runat="server" Text="删除" OnClientClick="return confirm('确定要删除吗？');" OnClick="BtnDelSender_Click" class="btn btn-primary"/>
                </td>
                <td><strong>批量删除指定日期范围内的短消息：<br />
                </strong>默认为删除已读信息 </td>
                <td style="height: 28px; width: 511px;">
                    <asp:DropDownList ID="DropDelDate" runat="server" class="btn btn-default dropdown-toggle">
                        <asp:ListItem Value="1">一天前</asp:ListItem>
                        <asp:ListItem Value="3">三天前</asp:ListItem>
                        <asp:ListItem Value="7">一星期前</asp:ListItem>
                        <asp:ListItem Value="30">一个月前</asp:ListItem>
                        <asp:ListItem Value="60">两个月前</asp:ListItem>
                        <asp:ListItem Value="180">半年前</asp:ListItem>
                        <asp:ListItem Value="0">所有短消息</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="BtnDelDate" runat="server" Text="删除" OnClientClick="return confirm('确定要删除吗？');" OnClick="BtnDelDate_Click"  class="btn btn-primary"/>
                </td>
            </tr>
        </table>
        <div class="divbox" id="nocontent" runat="server">
            <div style="width: 100%; height: 19px; text-align: center;" class="title"> 消&nbsp;息&nbsp;管&nbsp;理</div>暂无短消息</div><div class="clearbox"></div>
        <asp:GridView ID="GridView1" runat="server" Width="100%"  AutoGenerateColumns="False"  OnRowCommand="Row_Command"  class="table table-striped table-bordered table-hover" onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <input type="checkbox" name="idChk" value="<%#Eval("MsgID") %>"/>
                    </ItemTemplate>
                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="短消息主题">
                    <ItemTemplate> <a href="MessageRead.aspx?id=<%#Eval("MsgID")%>" title='<%# Eval("Title")%>'> <%# Eval("Title")%></a> </ItemTemplate>
                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="短消息类型">
                    <ItemTemplate><asp:LinkButton runat ="server" ID="ok" CommandArgument="ss" href="#" onclick="SelectType_Click"><%#GetMsgType(Convert.ToInt32(Eval("MsgType")))%> </asp:LinkButton></a></ItemTemplate>
                    <ItemStyle Width="8%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="收件人">
                    <ItemTemplate>
                        <%# GetUserName(Eval("Incept","{0}")) %>
                        <headerstyle Width="13%" />
                        <itemstyle HorizontalAlign="Center" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="收件人状态">
                    <HeaderStyle Width="9%" />
                    <ItemTemplate> <%#GetInceptStatus(Convert.ToInt32(Eval("MsgID")))%> </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发件人">
                    <ItemTemplate>
                        <%# GetUserName(Eval("Sender","{0}")) %>
                    </ItemTemplate>
                    <ItemStyle Width="13%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发件人状态">
                    <ItemTemplate> <%#GetSenderStatus(Convert.ToInt32(Eval("MsgID")))%> </ItemTemplate>
                    <ItemStyle Width="9%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发送日期">
                    <ItemTemplate> <%# Eval("PostDate","{0:yyyy-MM-dd}")%> </ItemTemplate>
                    <ItemStyle Width="13%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实要删除此信息吗？');"  CommandArgument='<%# Eval("MsgID")%>' Text="删除"></asp:LinkButton>
                        <asp:LinkButton ID="lbRead" runat="server" CommandName="ReadMsg" CommandArgument='<%# Eval("MsgID")%>'>阅读信息</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" Width="9%" HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView> 
        <table class="table table-striped table-bordered table-hover">
            <tr class="tdbg">
                <td style="height: 22px; text-align: center;" colspan="10" class="tdbgleft"><span style="text-align: center">共
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
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    页
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                    </span>
                </td>
            </tr>
        </table><div class="clearbox"></div>
        <input type="checkbox" id="chkAll" onclick="selectAllByName(this,'idChk')" />
        <asp:Button ID="FindSystemText" runat="server" Font-Size="9pt" Text="系统短信" class="btn btn-primary" onclick="FindSystemText_Click"/>
        <asp:Button ID="FindmobileText" runat="server" Font-Size="9pt" Text="手机短信" class="btn btn-primary"  OnClick="FindmobileText_Click"/>
        <asp:Button ID="Button2" runat="server" Font-Size="9pt" Text="批量删除" OnClick="Button2_Click" class="btn btn-primary" /><br />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>
