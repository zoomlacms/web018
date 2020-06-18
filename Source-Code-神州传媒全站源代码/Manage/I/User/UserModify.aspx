<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.UserPassModify, App_Web_3i5lpjsb" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>修改用户信息</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tbody>
            <tr align="center">
                <td colspan="4" class="spacingtitle"><strong>修改
        <asp:Label ID="LblUserName" runat="server" Text="Label"></asp:Label>
                    的信息</strong></td>
            </tr>
            <tr>
                <td colspan="4">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#Tabs0" data-toggle="tab">基本信息</a></li>
                        <li><a href="#Tabs1" data-toggle="tab">联系信息</a></li>
                        <li><a href="#Tabs2" data-toggle="tab">其他信息</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="Tabs0">
                            <table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <td style="width: 15%;" class="text-right">用户名： </td>
                                    <td class="text-left">
                                        <asp:Label ID="lblUser" runat="server" Text="Label"></asp:Label></td>
                                    <td style="width: 15%;" class="text-right">用户昵称： </td>
                                    <td colspan="3" class="text-left">
                                        <asp:TextBox ID="txtHoneyName" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">新密码： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbNewPwd" runat="server" TextMode="Password" class="form-control" Style="max-width: 200px;"></asp:TextBox>
                                        如果不修改密码，请不要输入新密码和确认密码
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ErrorMessage="密码不能少于6位" ControlToValidate="tbNewPwd" ValidationExpression="[\s\S]{6,}" ForeColor="Red"></asp:RegularExpressionValidator>
                                    </td>
                                    <td style="width: 15%;" class="text-right">工号： </td>
                                    <td>
                                        <asp:TextBox ID="WorkNum_T" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="WorkNum_T" Display="Dynamic" ErrorMessage="格式不正确" ValidationExpression="^\d[0-9]*$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">新密码确认： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbConPwd" runat="server" TextMode="Password" class="form-control" Style="max-width: 200px;"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="新密码和确认密码必须一样" ControlToValidate="tbConPwd" ControlToCompare="tbNewPwd"></asp:CompareValidator>
                                    </td>
                                    <td style="width: 15%;" class="text-right">VIP类型： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:DropDownList ID="VIPUser" CssClass="form-control" Width="80" runat="server">
                                            <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                                            <asp:ListItem Value="1">是</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">Email： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbEmail" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox>
                                        <span style="color: red">*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="Email地址不能为空"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="格式不正确" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Visible="False"></asp:RegularExpressionValidator>
                                    </td>
                                    <td style="width: 15%;" class="text-right">所属会员组： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:DropDownList ID="DDLGroup" CssClass="form-control" Width="150" runat="server"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">提示问题： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbQuestion" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox>
                                    </td>
                                    <td style="width: 15%;" class="text-right">提示问题答案： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbAnswer" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox>
                                        <span style="color: red">*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbAnswer" ErrorMessage="提示答案不能为空"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane" id="Tabs1">
                            <table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <td style="width: 15%;" class="text-right">真实姓名： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbTrueName" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">性别： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:RadioButtonList ID="tbUserSex" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="1">男</asp:ListItem>
                                            <asp:ListItem Value="0">女</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">出生日期： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbBirthday" runat="server" onblur="setday(this);" onclick="WdatePicker()"
                                            class="form-control"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">办公电话： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbOfficePhone" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr class="tdbg">
                                    <td style="width: 15%;" class="text-right">省市县：  </td>
                                    <td style="height: 22px" class="text-left">
                                        <asp:TextBox ID="tbProvince" runat="server" class="form-control" Style="width: 80px;"></asp:TextBox>
                                        -
                 <asp:TextBox ID="tbCity" runat="server" class="form-control" Style="width: 80px;"></asp:TextBox>
                                        -
                 <asp:TextBox ID="tbCoutry" runat="server" class="form-control" Style="width: 80px;"></asp:TextBox>
                                        地区字典：
                 <select runat="server" id="selprovince" onchange="javascript:area()">
                 </select>
                                        <select runat="server" id="selcity" onchange="area2();">
                                        </select>
                                        <select runat="server" id="selcoutry" onchange="area3()">
                                        </select></td>

                                    <td style="width: 15%;" class="text-right">推荐人： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbParentUserID" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>

                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">家庭电话： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbHomePhone" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">传真： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbFax" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">手机号码： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbMobile" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">小灵通： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbPHS" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">联系地址： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbAddress" runat="server" Columns="40" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">邮政编码： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbZipCode" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">身份证号码： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbIDCard" runat="server" Columns="40" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">个人主页： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbHomepage" runat="server" Columns="40" class="form-control" Style="max-width: 200px;">http://</asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">QQ号码： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbQQ" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">ICQ号码： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbICQ" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">MSN账号： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbMSN" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">雅虎通账号： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbYahoo" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">UC账号： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbUC" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%; height: 26px;" class="text-right">头像地址： </td>
                                    <td style="width: 35%; height: 26px;" class="text-left">
                                        <asp:TextBox ID="tbUserFace" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">头像宽度： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbFaceWidth" runat="server" class="form-control" Style="max-width: 200px;">16</asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">头像高度： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbFaceHeight" runat="server" class="form-control" Style="max-width: 200px;">16</asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">公司名称： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="CompanyNameT" runat="server" class="form-control" Style="max-width: 200px;" Columns="40"></asp:TextBox>
                                    </td>
                                    <td style="width: 15%;" class="text-right">公司简介： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="CompanyDescribeT" runat="server" TextMode="MultiLine" Rows="4" Columns="28"></asp:TextBox></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane" id="Tabs2">
                            <table class="table table-striped table-bordered table-hover">
                                <tr class="tdbg">
                                    <td style="width: 15%;" class="text-right">剩余资金： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtMoney" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">用户信誉值</td>
                                    <td>
                                        <asp:TextBox ID="txtUserCrite" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">点券： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtUserPoint" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">用户积分： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtPoint" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">虚拟币： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtPurm" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">用户银币：</td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtSilverCoin" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">商铺认证有效期截止： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtCerificateDeadLine" runat="server" class="form-control" Style="max-width: 200px;" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' })"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">有效期截止时间： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtDeadLine" runat="server" class="form-control" Style="max-width: 200px;" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' })"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">卖家积分： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtboffExp" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">消费积分： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtConsumeExp" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">签名档： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbSign" runat="server" class="form-control" Style="max-width: 200px;" TextMode="MultiLine" Width="253px"
                                            Height="60"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">隐私设定： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:RadioButtonList ID="tbPrivacy" runat="server">
                                            <asp:ListItem Selected="True" Value="0">公开信息</asp:ListItem>
                                            <asp:ListItem Value="1">只对好友公开</asp:ListItem>
                                            <asp:ListItem Value="2">完全保密</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="padding-left: 0;">
                                        <table width="100%" border="0" cellpadding="0">
                                            <asp:Literal ID="lblHtml" runat="server"></asp:Literal>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Literal ID="ltlTab" runat="server"></asp:Literal>
    <asp:Literal ID="models" runat="server"></asp:Literal>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="4">
                <asp:HiddenField ID="HdnUserID" runat="server" />
                <asp:Button ID="BtnSubmit" runat="server" Text="修改" OnClick="BtnSubmit_Click" class="btn btn-primary" />
                <asp:Button ID="Button1" runat="server" Text="取消" class="btn btn-primary" OnClick="Button1_Click" CausesValidation="False" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" class="btn btn-primary" />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="../Common/Common.js"></script>
    <script type="text/javascript" src="../../JS/calendar.js"></script>
    <script type="text/javascript" src="../JS/ajaxrequest.js"></script>
    <script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2"<%=tabTitles %>);
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2"<%=tabs %>);
        function ShowTabss(SID) {
            if (SID != tID) {
                if (document.getElementById(arrTabTitle[tID].toString()) != null)
                    document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                if (document.getElementById(arrTabTitle[SID].toString()) != null)
                    document.getElementById(arrTabTitle[SID].toString()).className = "titlemouseover";
                if (document.getElementById(arrTabs[tID].toString()) != null)
                    document.getElementById(arrTabs[tID].toString()).style.display = "none";
                if (document.getElementById(arrTabs[SID].toString()) != null)
                    document.getElementById(arrTabs[SID].toString()).style.display = "";
                tID = SID;
            }
        }
    </script>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript">
        function area() {
            $.ajax({
                type: "POST",
                url: "UserModify.aspx",
                data: "action=area&value=" + $("#selprovince option:selected").val(),
                success: function (msg) {
                    var s = new Array();
                    s = msg.split("|");
                    var str = "";
                    for (var i = 0; i < s.length; i++) {
                        if (s[i] != null && s[i] != "")
                            str += "<option>" + s[i] + "</option>"
                    }
                    $("#selcity").html(str);
                    area2();
                },
                Error: function (msg) {
                    alert("地址获取失败");
                }
            });
            $("#tbProvince").val($("#selprovince").val());
        }
        function area2() {
            $.ajax({
                type: "POST",
                url: "UserModify.aspx",
                data: "action=area2&pro=" + $("#selprovince option:selected").val() + "&city=" + $("#selcity option:selected").val(),
                success: function (msg) {
                    var s = new Array();
                    s = msg.split("|");
                    var str = "";
                    for (var i = 0; i < s.length; i++) {
                        if (s[i] != null && s[i] != "")
                            str += "<option>" + s[i] + "</option>";
                    }
                    $("#selcoutry").html(str);
                },
                Error: function (msg) {
                    alert("地址获取失败");
                }
            });
            $("#tbCity").val($("#selcity").val());
        }
        function area3() {
            $("#tbCoutry").val($("#selcoutry").val());
        }
    </script>
</asp:Content>
