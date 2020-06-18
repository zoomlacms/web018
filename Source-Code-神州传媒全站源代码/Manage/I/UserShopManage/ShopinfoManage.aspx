<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_ShopinfoManage, App_Web_dhharc22" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>信息配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class=" text-center" colspan="2">店铺信息配置</td>
        </tr>
        <tr style="display: none">
            <td style="width: 20%; text-align: left;"><b>启用多用户商城</b></td>
            <td style="width: 80%; text-align: left;">
                <asp:RadioButtonList ID="IsOpen" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False">否</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: left;"><b>商家发布商品需要审核</b></td>
            <td style="width: 80%; text-align: left;">
                <asp:RadioButtonList ID="Auditing" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: left;"><b>允许匿名购买</b></td>
            <td style="width: 80%; text-align: left;">
                <asp:RadioButtonList ID="Anonymity" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display: none">
            <td style="width: 20%; text-align: left;"><b>允许使用点卡</b></td>
            <td style="width: 80%; text-align: left;">
                <asp:RadioButtonList ID="Pointcard" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: left;"><b>允许使用虚拟货币</b></td>
            <td style="width: 80%; text-align: left;">
                <asp:RadioButtonList ID="Dummymoney" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: left;"><b>允许评论</b></td>
            <td style="width: 80%; text-align: left;">
                <asp:RadioButtonList ID="Comment" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: left;"><b>允许用户修改订单价格</b></td>
            <td style="width: 80%; text-align: left;">
                <asp:RadioButtonList ID="ChangOrder" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False" Selected="True">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: left;"><b>好评积分</b></td>
            <td style="width: 80%; text-align: left;">
                <asp:TextBox ID="goodpl" class="form-control" runat="server">0</asp:TextBox></td>
        </tr>

        <tr>
            <td style="width: 20%; text-align: left;"><b>中评积分</b></td>
            <td style="width: 80%; text-align: left;">
                <asp:TextBox ID="centerpl" class="form-control" runat="server">0</asp:TextBox></td>
        </tr>

        <tr>
            <td style="width: 20%; text-align: left;"><b>差评积分</b>
            </td>
            <td style="width: 80%; text-align: left;">
                <asp:TextBox ID="badpl" class="form-control" runat="server">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: left;"><b>赠送积分折算率</b>
            </td>
            <td style="width: 80%; text-align: left;">
                <asp:TextBox ID="ScorePoint" class="form-control" runat="server">0</asp:TextBox>%（即扣除现金比率）</td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="2">
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="更新设置" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
</asp:Content>
