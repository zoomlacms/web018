<%@ page language="C#" autoeventwireup="true" inherits="Plat_Task_Default, App_Web_dhogkoqw" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <link href="/Plugins/Uploadify/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Plugins/Uploadify/jquery.uploadify.js"></script>
    <title>公司名称_信息分享</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <asp:TextBox runat="server" ID="MsgContent" style="height:120px;width:100%;max-width:100%;" class="form-control" placeholder="输入你想分享的内容.." TextMode="MultiLine"></asp:TextBox>
        <br />
        <div class="msgOP">
            <div style="position:relative;bottom:5px;">
                <a href="javascript:;" onclick="ShowDiv('attachDiv');">上传附件</a>
                <a href="javascript:;" style="color:gray;">发起投票</a>
                <span class="alert alert-success" id="file_upload_span" style="padding:3px;display:none;"></span>
                <div style="float:right;margin-right:10px;display:inline;">
                    <span class="glyphicon glyphicon-eye-open" style="color:black;margin-right:5px;"></span><a href="#" onclick="ShowDiv('viewGroup_Div');">所有同事</a>
                      <asp:Button runat="server" ID="Share_Btn" Text="分享" OnClientClick="return DataChk();" OnClick="Share_Btn_Click" />
                    <div id="viewGroup_Div" style="position: absolute; top: 30px; width: 200px; background-color: #f7f7f7; border: 1px solid #cfcfcf; z-index: 99; display: none;">
                        <ul>
                            <li>
                                <input type="checkbox" id="chkAll" onclick="selectAllByName(this, 'GroupIDS_Chk')" checked="checked" />全选
                                <a href="javascript:;" onclick="$('#viewGroup_Div').hide();" style="margin-left:30px;" title="保存">保存</a>
                            </li>
                            <asp:Repeater runat="server" ID="GroupRpt" EnableViewState="false">
                                <ItemTemplate>
                                    <li>
                                        <input type="checkbox" name="GroupIDS_Chk" value="<%#Eval("ID") %>" checked="checked" />
                                        <%#Eval("GroupName") %>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="attachDiv" class="msgOP_attach" style="display:none;">
                <input type="file" id="file_upload_1" />
                <input type="hidden" id="Attach_Hid" name="Attach_Hid"/>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div id="contentDiv">
        <asp:Repeater runat="server" ID="MsgRepeater" OnItemDataBound="MsgRepeater_ItemDataBound" EnableViewState="false">
            <ItemTemplate>
                <div class="msg_div">
                    <div class="msg_left_div padding0 col-lg-1 col-md-1 col-sm-1 col-xs-1">
                        <img class="userFaceImg" src="/Images/userface/noface.gif" />
                    </div>
                    <div class="msg_content_div padding0 col-lg-11 col-md-11 col-sm-11 col-xs-11">
                        <div>
                           <a href="#" title="用户详情"><%#Eval("CreateUName") %></a>
                            <%#GetColled() %>
                        </div>
                        <div>
                            <%#Eval("MsgContent") %>
                            <%#GetAttach() %>
                        </div>
                    <div class="reply">
                        <input type="text" id="MsgContent_<%#Eval("ID") %>" class="form-control"/>
                        <a href="javascript:;" onclick="AddReply(<%#Eval("ID") %>);">回复</a>
                    </div>
                    <div id='reply_<%#Eval("ID") %>'>
                       <asp:Literal runat="server" ID="ReplyList_L" EnableViewState="false"></asp:Literal>
                    </div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <br />
            </ItemTemplate>
        </asp:Repeater>
        <asp:Literal runat="server" ID="MsgPage" EnableViewState="false"></asp:Literal>
    </div>
    <div style="position:fixed;bottom:5px;text-align:center;width:100%;">
        <asp:Literal runat="server" ID="MsgPage_L" EnableViewState="false"></asp:Literal>
    </div>
     <!--模态框弹出-->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog" style="width:1150px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <span class="modal-title">文件预览</span>
                    <a href="#" id="preview_down_a" title="下载该文档">下载</a>
                    <a href="#" title="全屏浏览">全屏</a>
                </div>
                <div class="modal-body">
                    <iframe id="preview_if" src="/PreView.aspx" style="border:none;width:100%;height:700px;overflow-y:hidden;"></iframe>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div><!--model end-->
    <a href="javascript:;" data-toggle="modal" data-target="#myModal" id="Model_Btn"></a>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
     .msg_div {border-bottom:1px dashed gray;min-height:80px;padding-bottom:1px;}
     .reply {margin-bottom:2px;}
      div {border-radius:2px;}
     .uploadify {float:left;}
     .msg_content_attach {display:inline-block;cursor:pointer;margin-top:2px;margin-bottom:2px;}
     .colled{color:red;cursor:pointer;font-size:1.5em;float:right;margin-right:10px;}
     .nocolled{color:#7fB2E5;cursor:pointer;font-size:1.5em;float:right;margin-right:10px;}
    </style>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        function DataChk() {
            var val = $("#MsgContent").val().replace(" ", "");
            if (val == "") {
                TextAlert("MsgContent", 3);
                return false;
            }
        }
        //背景色警告
        function TextAlert(id, time) {
            if (!time || time < 1) time = 3;
            for (var i = 0, span = 200; i < time; i++) {
                setTimeout(function () { $("#" + id).css("background-color", "#f9f2f4") }, span);
                span += 200;
                setTimeout(function () { $("#" + id).css("background-color", "white") }, span);
                span += 200;
            }
        }
        function ShowDiv(id) {
            $("#" + id).show();
        }
        function DisReply() {
            $(event.srcElement).parent().parent().parent().find(".reply").show();
        }
        function DisReplyOP() {
            $(event.srcElement).parent().siblings(".replyOP").show();
        }
        function CollFunc(obj,id)//收藏,取消收藏
        {
            if ($(obj).hasClass("colled"))//如已收藏,取消收藏
            {
                $(obj).removeClass("colled").addClass("nocolled");
                PostToCS("CancelColl", id, function () { });
            }
            else//加入收藏
            {
                $(obj).removeClass("nocolled").addClass("colled");
                PostToCS("AddColl", id, function () { });
            }
        }
        //-------
        $(function () {
            $("#file_upload_1").uploadify({
                //按钮宽高
                width: 120,
                height: 35,
                auto: true,
                swf: '/Plugins/Uploadify/uploadify.swf',
                uploader: '/Plugins/Uploadify/UploadFileHandler.ashx',
                buttonText: "上传附件",
                buttonCursor: 'hand',
                fileTypeExts: "*.*",
                fileTypeDesc: "请选择文件",
                fileSizeLimit: "50000KB",
                formData: { "action": "Blog"},
                queueSizeLimit: 1,
                removeTimeout: 2,
                multi: false,
                onUploadStart: function (file) { },
                onUploadSuccess: function (file, data, response) {
                    $("#file_upload_span").text(file.name+"上传成功").show();
                    $("#Attach_Hid").val(file.name);
                },
                onQueueComplete: function (queueData){},
                onUploadError: function (file) { alert(file.name + "上传失败"); }
            });
        });
        function PreView(vpath)
        {
            $("#Model_Btn").click();
            if (vpath != $("#preview_down_a").attr("href"))
            {
                $("#preview_down_a").attr("href", vpath);
                $("#preview_if").attr("src", "/PreView.aspx?vpath=" + escape(vpath));
            }
        }
        function LoadReply(pid,pageSize,pageIndex)
        {
            $("#reply_" + pid).load("ReplyList.aspx?pid=" + pid + "&PageSize=" + pageSize + "&PageIndex=" + pageIndex + " start");
        }
        var pageSize =<%=replyPageSize%>
        function AddReply(id) {//回复主信息
            var msg = $("#MsgContent_" + id).val();
            if (msg == "") { alert('信息不能为空!!'); return; }
            var value = id + ":" + msg;
            PostToCS("AddReply", value, function () { LoadReply(id, pageSize, 1); });
        }
        function AddMessage(id) {//对回复者回复
            var msg = $("#MsgContent_" + id).val();
            var pid = $("#MsgInfo_" + id + "_Hid").val().split(':')[0];
            if (msg == "") { alert('信息不能为空!!'); return; }
            var value = pid + ":" + id + ":" + msg;
            PostToCS("AddReply2", value, function () { LoadReply(pid, pageSize, 1); });
        }
        function PostToCS(a, v, CallBack) {
            $.ajax({
                type: "Post",
                data: { action: a, value: v },
                success: function (data) {
                    CallBack(data);
                },
                error: function (data) {

                }
            });
        }//Post To CS end;
        function ClearChk(name){
            $("input[name='GroupIDS_Chk']").each(function () { this.checked = false; });
        }
    </script>
</asp:Content>