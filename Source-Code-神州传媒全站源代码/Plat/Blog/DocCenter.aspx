<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_DocCenter, App_Web_dhogkoqw" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <title>知识中心</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="doc_head">
       <span class="doc_head_title">
           <span class="glyphicon glyphicon-file"></span>
           <a href="#">文档中心</a>
       </span>
        <div class="input-group" style="width: 260px;float:right;">
            <input type="text" id="keyWord" style="margin-top: 0px;" class="form-control" placeholder="智能搜索..." />
            <span class="input-group-btn">
                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" style="color: black;"></span></button>
            </span>
        </div>
    </div>
    <div class="doc_middle">
        <span style="margin-left:20px;">
            <asp:DropDownList runat="server" ID="DocType_DP">
                <asp:ListItem Value="1">所有文档</asp:ListItem>
                <asp:ListItem Value="1">我上传的</asp:ListItem>
                <asp:ListItem Value="1">我收藏的</asp:ListItem>
            </asp:DropDownList>
        </span>
        <span style="margin-left:30px;">
            <asp:DropDownList runat="server" ID="DocArea_DP">
                <asp:ListItem Value="1">所有范围</asp:ListItem>
                <asp:ListItem Value="2">所在组1</asp:ListItem>
                <asp:ListItem Value="2">所在组2</asp:ListItem>
            </asp:DropDownList>
        </span>
        <span style="float:right;margin-right:10px;">
            <input type="button" id="UpNewDoc_Btn" value="上传新文档" class="btn btn-primary" onclick="" />
        </span>
    </div>
    <div class="doc_content">
        <ul class="doc_content_list">
            <asp:Repeater runat="server" ID="MyFileRepeater">
                <ItemTemplate>
                    <li>
                        <div><a href="javascript::" onclick="PreView('<%#Eval("Attach") %>');"><%#GetFileName(Eval("Attach").ToString()) %></a></div>
                        <div>
                            <span><%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy年MM月dd日 HH:mm") %></span>
                            <span><%#Eval("CreateUName") %></span>
                        </div>
                        <div>
                            <span>文档类型</span>
                            <span><a href="javascript::" onclick="PreView('<%#Eval("Attach") %>');">阅读</a></span>
                            <span><a href="javascript::">回复</a></span>
                            <span><a href="<%#Eval("Attach") %>" target="_blank">下载</a></span>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
       <div class="doc_content_r" style="overflow-y:hidden;">
           <div class="doc_content_r_purview" style="overflow-y:hidden;"><!--预览区-->
               <iframe id="preview_if" src="/PreView.aspx" style="border:none;width:100%;height:500px;border-bottom:1px dashed #ddd;padding-bottom:1px;" scrolling="no" ></iframe>
           </div>
           <div style="margin-top:20px;">
               <div>
                   <img src="/Images/userface/noface.gif"/>
                   <span>徐林</span>
                   <span>2014-08-22 14:07 上传</span>
                   <span>121109测试文档</span>
               </div>
           </div>
           <div class="doc_content_r_comment">
               <ul class="doc_content_r_comment_ul">
                   <li>
                       <div style="border-bottom:1px dashed #ddd;padding-bottom:3px;">
                           <img src="/Images/userface/noface.gif" style="width:25px;height:25px;"/>
                           <span>徐林</span>
                           <span>2014-08-27 15:32</span>
                           <asp:TextBox runat="server" ID="MsgContent" TextMode="MultiLine" style="width:100%;height:40px;margin:5px 0 5px 0;" />
                           <input type="button" value="提交"/>
                       </div>
                   </li>
               </ul>
           </div>
       </div>
        <div style="clear:both;"></div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        .doc_head{border:1px solid #7fB2E5;background-color:#CCE0F5;height:45px;line-height:40px; }
        .doc_head_title{font-size:20px;margin-left:10px;}
        .doc_middle{border:1px solid #7fB2E5;border-top:none;height:60px;line-height:60px; }
        .doc_content{border:1px solid #7fB2E5;border-top:none;min-height:800px;}
        .doc_content li{text-decoration:none;list-style:none;}
        .doc_content img{width:25px;height:25px;}
        .doc_content_list{list-style:none;padding-left:5px;width:30%;min-height:800px;float:left;border-right:1px solid #CCE0F5;}
        .doc_content_list li{border-bottom:1px dashed #ddd;}
        .doc_content_r{width:68%;float:right;}
        .doc_content_r_purview{height:500px;width:100%;}
        .doc_content_r_comment{width:100%;margin-top:5px;}
        .doc_content_r_comment_ul{padding-left:0px;}
 </style>
    <script type="text/javascript">
        function PreView(vpath) {
            $("#preview_if").attr("src", "/PreView.aspx?vpath=" + escape(vpath));
        }
    </script>
</asp:Content>