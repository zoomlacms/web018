﻿<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="manage_Template_TemplateLink, App_Web_j4ziqpsf" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.Get("m_TemplateLink_tag")%></title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<script type="text/javascript">    
function Switch(obj)
{
	obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
	var nextDiv;
	if (obj.nextSibling)
	{
		if(obj.nextSibling.nodeName=="DIV")
		{
			nextDiv = obj.nextSibling;
		}
		else
		{
			if(obj.nextSibling.nextSibling)
			{
				if(obj.nextSibling.nextSibling.nodeName=="DIV")
				{
					nextDiv = obj.nextSibling.nextSibling;
				}
			}
		}
		if(nextDiv)
		{
			nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none"; 
		}
	}
}
function OpenLink(lefturl,righturl)
{
	if(lefturl!="")
	{
		parent.frames["left"].location =lefturl;
	}
	try {
		parent.MDIOpen(righturl); return false;
	} catch (Error) {
		parent.frames["main_right"].location = righturl;
	}
}

function gotourl(url) {
	try {
		parent.MDILoadurl(url); void (0);
	} catch (Error) {
		parent.frames["main_right"].location = "../" + url; void (0);
	}
}
function search() {
	var LabelCate = "";
	var LabelName = document.getElementById("Lname").value;
	window.open('../Template/LabelManage.aspx?Cate=' + LabelCate + '&lblkey='+ LabelName,"main_right");
}
</script>
</head>
<body id="Guidebody" style="margin: 0px; margin-top:1px;">
<form id="formGuide" runat="server">
<div id="Div1">
    <ul>
        <li id="Guide_top">
            <div id="Guide_toptext"><%=lang.Get("m_TemplateLink_style")%></div>
        </li>
        <li id="Guide_main">
            <div id="Guide_box">
                <div class="guideexpand" onclick="Switch(this)"><%=lang.Get("m_TemplateLink_style")%></div>                    
                <div class="guide">
                <ul>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/TemplateSet.aspx" target="main_right"><%=lang.Get("m_TemplateLink_program")%></a></li>     
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/TemplateManage.aspx" target="main_right"><%=lang.Get("m_TemplateLink_template")%></a></li>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/LabelManage.aspx" target="main_right"><%=lang.Get("m_TemplateLink_tagmanage")%></a></li>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/CSSManage.aspx" target="main_right"><%=lang.Get("m_TemplateLink_stylemanage")%></a></li>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/CloudLead.aspx" target="main_right"><%=lang.Get("m_TemplateLink_TemplateSetOfficial")%></a></li>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/DSManage.aspx" target="main_right">外部数据库源</a></li>
                </ul>
                </div>
                <div class="guideexpand" onclick="Switch(this)">工作助手</div> 
               <div class="guide">
                <ul>             
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/LabelCallTab.aspx" target="main_right">标签助手</a></li>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="/api/GetPageHtml.aspx" target="main_right"><%=lang.Get("m_TemplateLink_TemplateCode")%></a></li>
                <%--<li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/LabelImport.aspx" target="main_right">标签导入</a></li>--%>                   
                </ul>
                </div>
            </div>
        </li>
    </ul>
</div>
<div style="margin-top:20px; padding-left:5px;">
<%=lang.Get("m_TemplateLink_byname")%>：<br />
<table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input"><tr ><td> 

<input id="Lname"  style="border-color:#fff" class="l_inpnon" runat="server" onkeypress="CheckInfo(this)"/>
<script type="text/javascript">
        function CheckInfo(obj) {
            if (event.keyCode == 13) {
                //alert(obj.value);
                search();
            }
        }
        </script>
<input type="button" onclick="search()"  class="C_sch"/>
</td></tr></table>
</div>
</form>
</body>
</html>