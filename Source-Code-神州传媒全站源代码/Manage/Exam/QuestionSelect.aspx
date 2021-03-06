﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Exam_QuestionSelect, App_Web_usklqwfv" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>添加试题</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" charset="utf-8" src="/Plugins/kindeditor/kindeditor.js"></script>
</head>
<body>
<form id="form1" runat="server">
    <div class="clearbox"></div>
    <table style="width: 100%; margin: 0 auto;" cellpadding="2" cellspacing="1" class="border">       
        <tbody id="Tabs0">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label6" runat="server" Text="题型："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label1" runat="server" Text="缺省分数："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                   <asp:TextBox ID="txtCourse" runat="server" class="l_input"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label12" runat="server" Text="试题内容："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright"> 
                <div style="color:Red">名词约定 <br />声明：  为更好在网页显示效果，请配合名词约定，该约定与HTML语法一致。<br />
                    1，“&amp;nbsp;”或“&#160;”表示空格；<br />2，“&lt;br/&gt;”表示换行。<br />
                    3，关于填空题：使用“()”表示填空位置；
                </div>  
                    <div id="content1" runat="server">
                        <asp:TextBox ID="txtP_Content" runat="server" class="l_input"  TextMode="MultiLine" Height="173px" Width="470px"></asp:TextBox>
                        &nbsp;<font color="red">*</font>
                        <script type="text/javascript">
                            KE.show({
                                id: 'txtP_Content'
                            });
                         </script>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="试题内容不能为空!" ControlToValidate="txtP_Content"></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr>          
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label3" runat="server" Text="试题信息："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                <div id="tip" runat="server" style="color:Red"></div>
                        <div id="num1" runat="server">
                        选项：<asp:DropDownList ID="ddlNumber1" runat="server" AutoPostBack="true" onselectedindexchanged="ddlNumber1_SelectedIndexChanged"> 
                            <asp:ListItem Value="1">1</asp:ListItem>                          
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                            <asp:ListItem Value="9">9</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList><asp:Literal ID="Tips" runat="server"  ></asp:Literal>
                        </div>
                        <div id="optionDiv" runat="server"></div>
                </td>
            </tr>          
        </tbody>
        <tbody id="Tabs1">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label4" runat="server" Text="答案：" ></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">                                    
                     <div id="anwDiv" runat="server"></div>            
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label11" runat="server" Text="试题解析："></asp:Label> &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtJiexi" runat="server" TextMode="MultiLine" 
                        CssClass="l_input" Height="61px" Width="440px"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg" id="shumi" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td align="right">说明：</td>
                <td><asp:TextBox runat="server" ID="shuming" class="l_input" cols="40" rows="6" Height="80px" Width="500px" ></asp:TextBox></td>
            </tr>
        </tbody>
        <tr class="tdbgbottom">
            <td colspan="2">
            <asp:HiddenField  ID="hfpid" runat='server'/>
            <asp:HiddenField ID="hffilename" runat="server" />
            <asp:HiddenField ID="hfoption" runat="server" />
            <asp:HiddenField ID="hfanw" runat="server" />
            <asp:HiddenField ID="hfParentId" runat="server" />
                <asp:Button ID="EBtnSubmit" class="C_input" Text="保存试题" OnClick="EBtnSubmit_Click" runat="server" />
                &nbsp;
                <asp:Button ID="BtnBack" class="C_input" runat="server" Text="返回" OnClick="BtnBack_Click"
                    UseSubmitBehavior="False" CausesValidation="False" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
