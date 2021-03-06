﻿<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="Weibo_Content, App_Web_204teml0" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎访问<%Call.Label("{$SiteName/}");%>微博-首页</title>
    <link href="../App_Themes/Microblog/global.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../App_Themes/Microblog/style.css" />
    <script type="text/javascript" src="../js/jquery.js" language="javascript"></script>
    <script src="../js/popup_js.js" type="text/javascript" language="javascript"></script>
    <style>
        <!--  .toolbar{ position: absolute; border: 1px solid #CCCCCC; background-color: #FDFFEA;  text-align:left;  font-size:12px; z-index:1000;
            }        -->
    </style>
    <script type="text/javascript" src="/js/interface.js"></script>
    <script src="/JS/ajaxrequest.js"></script>
    <script src="/JS/Microb.js"></script>
    <script src="/js/artZoom.js" type="text/javascript"></script>
    <script type="text/javascript">
        var url = window.location.href;
        var num=0; //处理覆盖图片和文件的逻辑
    function g_del(id) {   //删除
        g_dels(id, url);
    }

    function g_Dile(userid, forid, id) {  //添加
        g_Diles(userid, forid, id, url);
    }

    function Comm(Obj, val) {
        var value = Obj.value.replace(/(^\s*)|(\s*$)/g, "");
        var tips = document.getElementById("tip" + val);

        if (Obj.value.length <= 140) {
            tips.innerHTML = "还能输入" + (140 - Obj.value.length) + "个字";
            document.getElementById("btnCom_" + val).disabled = "";
        } else {
            tips.innerHTML = "<font color='red'>超出" + (Obj.value.length - 140) + "个字</font>";
            document.getElementById("btnCom_" + val).disabled = "disabled";
        }
    }

    function Og_Dile(userid, forid, id,conid) {  //添加
        Og_Diles(userid, forid, id, url,conid);
    }
     
    function OComm(Obj, val) {
        var value = Obj.value.replace(/(^\s*)|(\s*$)/g, "");
        var tips = document.getElementById("Otip" + val);
        if (Obj.value.length <= 140) {
            tips.innerHTML = "还能输入" + (140 - Obj.value.length) + "个字";
            document.getElementById("ObtnCom_" + val).disabled = "";
        } else {
            tips.innerHTML = "<font color='red'>超出" + (Obj.value.length - 140) + "个字</font>";
            document.getElementById("ObtnCom_" + val).disabled = "disabled";
        }
    }
	   
        $(document).ready(function () {
            uploadcreate($("#uploadbox"));
            //uploadcreate_Docment($("#uploadDocment"));
	    });

	    var hideDiv = function (idName) {
	        $("#" + idName).fadeOut("fast");
	    };

	    //载入中的GIF动画
	    var loadingUrl = "../images/ajax-loader.gif";

	    //选择文件后的事件,iframe里面调用的
	    var uploading = function (imgsrc) {
	        var strSub = imgsrc.split(".");
	        if(strSub[1]=="png"||strSub[1]=="gif"|| strSub[1]=="jpg")
	        {
	            if($("#txtImgurl").val()!="")
	            {
	                if(confirm("将会覆盖已经上传的"+imgsrc+"图片，是否继续上传？")==true)
	                {
	                    $("#txtContent").empty();
	                    uploadImgOrDocment(imgsrc);
	                }else
	                {
	                    alert("图片上传失败！");
	                    num=1;
	                }
	            }else
	            {
	                uploadImgOrDocment(imgsrc);
	            }
	        }else
	        {
	            if($("#txtDocumenturl").val()!="")
	            {
	                if(confirm("将会覆盖已经上传的"+imgsrc+"文件，是否继续上传？")==true)
	                {
	                    $("#divDocment").empty();
	                    uploadImgOrDocment(imgsrc);
	                }else
	                {
	                    alert("文件上传失败！");
	                    num=1;
	                }
	            }else
	            {
	                uploadImgOrDocment(imgsrc);	                
	            }
	        }
	    };

	    function uploadImgOrDocment(src)
	    {
	        var strSub = src.split(".");
	        if(document.getElementById("checkPhoto").checked==true||document.getElementById("checkFile").checked==true)
	        {
	            if(strSub[1]=="png"||strSub[1]=="gif"|| strSub[1]=="jpg")
	            {
	                document.getElementById("checkPhoto").checked=false;
	                return;
	            }else
	            {
	                document.getElementById("checkFile").checked=false;
	                return;
	            }
	        }else
	        {
	            if(strSub[1]=="png"||strSub[1]=="gif"|| strSub[1]=="jpg")
	            {
	                var el = $("#uploading");
	                $("#ifUpload").fadeOut("fast");
	                el.fadeIn("fast");
	                el.html("<img src='" + loadingUrl + "' align='absmiddle' /> 上传中...");
	                return el;
	            }else
	            {
	                var el = $("#uploadingDocment");
	                $("#ifUploadDocment").fadeOut("fast");
	                el.fadeIn("fast");
	                el.html("<img src='" + loadingUrl + "' align='absmiddle' /> 上传中...");
	                return el;
	            }
	        }
	    }

	    //重新上传方法    
	    var uploadinit = function (id) {
	        if(id=="1")
	        {
	            $("#uploading").fadeOut("fast", function () {
	                $("#ifUpload").fadeIn("fast");
	            });
	        }else
	        {
	            $("#uploadingDocment").fadeOut("fast", function () {
	                $("#ifUploadDocment").fadeIn("fast");
	            });
	        }
	    };

	    //上传时程序发生错误时，给提示，并返回上传状态
	    var uploaderror = function () {
	        alert("程序异常，上传未成功。");
	        uploadinit();
	        num=0;
	    };

	    //上传成功后的处理
	    var uploadsuccess = function (type,newpath,FileName,upName) {
	        alert(newpath);
	        if(num!=1)
	        {
	            if(type=='1')
	            {
	                $("#txtContent").append("<img src="+upName+"/"+ newpath +" onload='javascript:if(this.width>300){this.width=300;}' />");
	                $("#txtImgurl").val(newpath);
	                var el = $("#uploading");
	                el.html("上传成功,<a href=\"javascript:void(0);\" onclick=\"uploadinit('1');\">[重新上传]</a>.");
	            }
	            if(type=='0')
	            {
	                $("#divDocment").append(FileName + "<br/>");
	                $("#txtDocumenturl").val(newpath);
	                $("#txtDocmentName").val(FileName);
	                var ele = $("#uploadingDocment");
	                ele.html("上传成功,<a href=\"javascript:void(0);\" onclick=\"uploadinit('2');\">[重新上传]</a>.");
	            }	 
	        }
	    };

	    //创建一个上传控件
	    var uploadcreate = function (el) {
	        var strContent = "<div class='uploadcontrol'><div id=\"\" style=\"text-align:left;\"><input type=\"checkbox\" value=\"1\" id=\"checkPhoto\" onclick=\"changeF('photo','1')\">加入公司或群组文件中心</div><iframe src=\"upload.aspx\" id=\"ifUpload\" frameborder=\"no\" scrolling=\"no\" style=\"width:400px; height:28px;\"></iframe>";
	        strContent += "<div class=\"uploading\" id=\"uploading\" style=\"display:none;\" ></div>";
	        strContent += "<div class=\"image\" id=\"panelViewPic\" style=\"display:none;\"></div></div>";
	        el.append(strContent);
	    };
	 	
	    var uploadcreate_Docment=function(el)
	    {
	        var strContent = "<div class='uploadcontrol'><div id=\"\" style=\"text-align:left;\"><input type=\"checkbox\" value=\"1\" id=\"checkFile\" onclick=\"changeF('file','2')\">加入公司或群组文件中心</div><iframe src=\"upload.aspx\" id=\"ifUploadDocment\" frameborder=\"no\" scrolling=\"no\" style=\"width:400px; height:28px;\"></iframe>";
	        strContent += "<div class=\"uploadingDocment\" id=\"uploadingDocment\" style=\"display:none;\" ></div>";
	        strContent += "<div class=\"image\" id=\"panelViewPicDocment\" style=\"display:none;\"></div></div>";
	        el.append(strContent);
	    };

	    function changeF(fil,id)
	    {
	        if(id=="1")
	        {
	            document.getElementById("ifUpload").src="upload.aspx?Type="+fil;
	        }else
	        {
	            document.getElementById("ifUploadDocment").src="upload.aspx?Type="+fil;
	        }
	    }
    // <!CDATA[

	    function CallServer(input1,input2,input3,input4,context)
	    {
	        //为你在文本框中输入的信息，并且arg在这里就是将其值传递到
	        //RaiseCallbackEvent(String eventArgument)方法对应的eventArgument中
	        arg=input1.value+"|gzjoin|"+input2.value+"|gzjoin|"+input3.value+"|gzjoin|"+input4.innerHTML;
	        //arg = infokind.value+"|gzjoin|"+infotitle.value+"|gzjoin|"+infosource.value+"|gzjoin|"+ input.innerHTML;
	        //获取一个对客户端函数的引用；调用该函数时，将启动一个对服务器端事件的客户端回调。
	        <%= ClientScript.GetCallbackEventReference(this, "arg", "ReceiveServerData", "context")%>; 
	    }
    
        //客户端回调---回收处理
        function ReceiveServerData(result, context)
        {
            //context.innerText = result;
            //alert(title.value+"  录入成功！");
            //title.value=result;
            //self.location="addimage.aspx?infoid="+result;
        }

        function btup_onclick() 
        {
            //其他参数可以通过string类型上传，但是图片如何同时上传？
        }

        function btadd_onclick() {
            //此处点击一次，添加一个inputfile控件
        }

    // ]]>

        function showinput() {
            var obj = document.getElementById("txt_Content");
            var value = obj.value.replace(/(^\s*)|(\s*$)/g, "");

            if (obj.value == "") {
                document.getElementById("lastNummber").innerHTML = 140;
            }
            else if (obj.value.length <= 140) {
                document.getElementById("tip").innerHTML = "你还可以输入";

                document.getElementById("ibFabu").disabled = "";
                document.getElementById("lastNummber").innerHTML = 140 - obj.value.length;
            }
            else {
                document.getElementById("tip").innerHTML = "超出";
                document.getElementById("ibFabu").disabled = "disabled";
                document.getElementById("lastNummber").innerHTML = obj.value.length - 140;
            }
        }

        window.onload = function () {
            showinput();
        }

        function clickhuati() {
            addcontent("#请在这里输入自定义话题#");
        }

        function addcontent(content) {
            document.getElementById("txt_Content").innerHTML += content;
        }

        function addico(content) {
            document.getElementById("txt_Content").innerHTML += content;
            var div = document.getElementById("close1");
            div.click();
        }

        function addFile() {
            document.getElementById("txtmusic").value = document.getElementById("musictxt").value;
            var div = document.getElementById("close4");
            div.click();
        }

        function Postto() {
            var jqueryObj = $("#txt_Content");
            document.getElementById("txtimages").value += document.getElementById("txtImgurl").value;
            document.getElementById("txtDocment").value += document.getElementById("txtDocumenturl").value;
            //获取节点的值
            var cont = jqueryObj.val();
            if (cont != "") {
                $.get("DataCommon.aspx?menu=login", null, callback);
            }
            else
            {
                alert("请输入内容！");
            }
        }

        //回调函数
        function callback(data) {
            if (data == "1") {
                alert("请先登录！");
            } else {
                document.getElementById("Button1").click();   
            }
        }

        function success() {
            //location.href = 'Content.aspx';
        }
        
        //$("#blk5").html($("#blk2").html());
        $(document).ready(function () {            
            //示例1，默认弹出层
            new PopupLayer({ trigger: "#ele1", popupBlk: "#blk1", closeBtn: "#close1",dType:"1",
                offsets: {
                    x: 0,
                    y: 10
                }
            });
            
            new PopupLayer({ trigger: "#ele2", popupBlk: "#blk2", closeBtn: "#close2",dType:"2",
                offsets: {
                    x: 0,
                    y: 10
                }
            });
            new PopupLayer({ trigger: "#ele3", popupBlk: "#blk3", closeBtn: "#close3",dType:"3",
                offsets: {
                    x: 0,
                    y: 10
                }
            });
            new PopupLayer({ trigger: "#ele4", popupBlk: "#blk4", closeBtn: "#close4",dType:"4",
                offsets: {
                    x: 0,
                    y: 10
                }
            });
            
           new PopupLayer({ trigger: "#ele5", popupBlk: "#blk5", closeBtn: "#close5",dType:"5",
                offsets: {
                    x: 0,
                    y: 10
                }
            });
            new PopupLayer({ trigger: "#ele6", popupBlk: "#blk6", closeBtn: "#close6",dType:"6",
                offsets: {
                    x: 0,
                    y: 10
                }
            });
        });

        function addvideo() {
            document.getElementById("txtvidio").value = document.getElementById("video_txt").value;
            var div = document.getElementById("close3");
            div.click();
        }

        function addmusic() {
            document.getElementById("txtmusic").value = document.getElementById("musictxt").value;
            var div = document.getElementById("close4");
            div.click();
        }

        function getvoteTit(tit,url){
         document.getElementById("txt_Content").value ="发起了一个投票【"+ tit+"】，地址："+url;
            document.getElementById("txtVoite").value = url;
            var div = document.getElementById("close6");
                div.click();
        }

        function showVot(id){
            if($("#vtThumbs"+id).css("display")=="none")
            {
                $("#vtThumbs"+id).css("display","block");
                $("#vBox"+id).css("display","none");
            }
            else{
                $("#vtThumbs"+id).css("display","none");
                $("#vBox"+id).css("display","block");         
            }        
        }

        function upBtnClick()
        {
            alert(1);
            document.getElementById("upBtn").click(); 
        }
    </script>
</head>
<body> 
    <form id="form1" runat="server"  method="post" enctype="multipart/form-data">
    <input type="hidden" id="hftype" />
    <div id="blk1" class="blk" style="display: none;">
        <div class="head">
            <div class="head-right">
            </div>
        </div>
        <div class="main">
            <h2>
                常用表情</h2>
            <a href="javascript:void(0)" id="close1" class="closeBtn" title="关闭">×</a>
            <ul>
                <span id="biaoqing" name="biaoqing"></span>
                <script language="javascript" type="text/javascript">
                    var ico = "[呵呵],smile.gif|[嘻嘻],tooth.gif|[哈哈],laugh.gif|[爱你],love.gif|[泪],sad.gif|[晕],dizzy.gif|[困],sleepy.gif|[汗],sweat.gif|[怒],angry.gif|[哼],hate.gif|[抓狂],crazy.gif|[蛋糕],cake.gif|[咖啡],cafe_org.gif|[伤心],unheart.gif|[下雨],rain.gif|[猪头],pig.gif|[月亮],moon.gif|[冰棍],ice.gif|[帽子],hat_org.gif|[干杯],cheer.gif|[礼花],bingo_org.gif|[微风],wind_org.gif|[雨伞],umb_org.gif|[电视机],tv_org.gif|[星],star_org.gif|[话筒],m_org.gif|[音乐],music_org.gif|[电影],movie_org.gif|[唱歌],ktv_org.gif|[房子],house_org.gif|[足球],football.gif|[阴天],dark_org.gif";
                    var EmoticonsArr = ico.split('|');
                    var biaoqcontent = "";
                    for (var i = 0; i < EmoticonsArr.length; i++) {
                        var emotarr = EmoticonsArr[i].toString().split(',')
                        biaoqcontent += "<li class='box'><a href=\"javascript:void(0)\" onclick=\"addico('" + emotarr[0] + "')\"><img src='/App_Themes/Microblog/images/" + emotarr[1] + "' title='" + emotarr[0].replace(']', '').replace('[', '') + "' /></a></li>"
                    }
                    window.onload = function () {
                        document.getElementById("biaoqing").innerHTML = biaoqcontent;
                    }
                </script>
            </ul>
        </div>
        <div class="foot">
            <div class="foot-right">
            </div>
        </div>
    </div>
    <div id="blk2" class="blk" style="display: none;">
        <div class="head">
            <div class="head-right">
            </div>
        </div>
        <div class="main">            
            <h2 id="txth2">
                上传图片</h2>
            <a href="javascript:void(0)" id="close2" class="closeBtn" title="关闭">×</a>
            <ul style="margin-top: 5px; text-align: center; padding: 10px">
                <div id="txtContent" runat="server" style="width: 381px; height: 181px; overflow: auto;
                    border-right: darkgray 1px solid; border-top: darkgray 1px solid; border-left: darkgray 1px solid;
                    border-bottom: darkgray 1px solid;" contenteditable="true">
                </div>
                <input type="hidden" id="txtImgurl" runat="server" />
                <input type="hidden" id="txtFile" runat="server" />
                <br />
                <div style="height: 35px; text-align: center" id="uploadbox">
                </div>
            </ul>
            <ul style="text-align: center" id="txttips">
                仅支持JPG、GIF、PNG图片文件，且文件小于5M，网络图片支持粘贴<br />
                <br />
            </ul>
        </div>
        <div class="foot">
            <div class="foot-right">
            </div>
        </div>
    </div>
    <div id="blk3" class="blk" style="display: none; width: 420px">
        <div class="head">
            <div class="head-right">
            </div>
        </div>
        <div class="main">
            <h2>
                插入视频</h2>
            <a href="javascript:void(0)" id="close3" class="closeBtn" title="关闭">×</a>
            <ul style="margin: 5px; text-align: center">
                请输入<a href="http://video.sina.com.cn/" target="_blank">新浪播客</a>、<a href="http://www.youku.com/"
                    target="_blank">优酷网</a>、<a href="http://www.tudou.com/" target="_blank">土豆网</a>、<a
                        href="http://www.ku6.com/" target="_blank">酷6网</a>等视频网站的视频播放页链接<br />
            </ul>
            <ul style="margin: 5px; text-align: center">
                <asp:TextBox ID="video_txt" runat="server" Width="300px"></asp:TextBox>
                <asp:Button ID="Button3" runat="server" Width="80px" OnClientClick="addvideo();return false;"
                    Text="确定" />
            </ul>
            <ul>
                <br />
            </ul>
        </div>
        <div class="foot">
            <div class="foot-right">
            </div>
        </div>
    </div>
    <div id="blk4" class="blk" style="display: none;">
        <div class="head">
            <div class="head-right">
            </div>
        </div>
        <div class="main">
            <h2>
                插入音乐</h2>
            <a href="javascript:void(0)" id="close4" class="closeBtn" title="关闭">×</a>
            <ul style="margin: 5px;">
                请输入音乐地址:
            </ul>
            <ul style="text-align: center; text-align: center">
                <asp:TextBox ID="musictxt" runat="server" Width="280px"></asp:TextBox>
                <asp:Button ID="Button4" runat="server" Width="80px" OnClientClick="addmusic();return false;"
                    Text="确定" />
                <br />
            </ul>
            <ul style="text-align: center; text-align: center">
                <br />
            </ul>
        </div>
        <div class="foot">
            <div class="foot-right">
            </div>
        </div>
    </div>
    <div id="blk5" class="blk" style="display: none;">
        <div class="head">
            <div class="head-right">
         </div>
        </div>
        <div class="main">
            <h2 id="H1">
                上传文件</h2>
            <a href="javascript:void(0)" id="close5" class="closeBtn" title="关闭">×</a>
            <ul style="margin-top: 5px; text-align: center; padding: 10px">
                <div id="divDocment" name="divDocment" runat="server" style="width: 381px; height: 181px; overflow: auto;
                    border-right: darkgray 1px solid; border-top: darkgray 1px solid; border-left: darkgray 1px solid;
                    border-bottom: darkgray 1px solid;" contenteditable="true">
                </div>
                <input type="hidden" id="txtDocumenturl" runat="server" />
                <input type="hidden" id="txtFiles" runat="server" />
                <br />
                <div style="height: 35px; text-align: center" id="uploadDocment">
                    <div class='uploadcontrol'>
                        <div style="text-align:left;">
                            <input type="checkbox" value="1" id="checkFile" onclick="changeF('file','2')" />加入公司或群组文件中心

                        </div>
                    <asp:FileUpload ID="file2" runat="server" onchange="upBtnClick()"  />
                    <asp:Button ID="upBtn" runat="server" Text="Button" Style="display: none" OnClick="upBtn_Click" />
                    <div class="uploading" id="uploadingDocment" style="display:none;" ></div>
                </div>
            </ul>
            <ul style="text-align: center" id="Ul1">
                仅支持PDF、DOC、TXT、DOCX、压缩文件，且文件小于20M<br />
            </ul>
        </div>
        <div class="foot">
            <div class="foot-right">
            </div>
        </div>
    </div>
    <div id="blk6" class="blk" style="display: none;">
        <div class="head">
            <div class="head-right">
            </div>
        </div>
        <div class="main">
        
            <h2>
                发布投票</h2>
            <a href="javascript:void(0)" id="close6" class="closeBtn" title="关闭">×</a>
           <iframe src="PubAction.aspx" frameborder="0" scrolling="no" width="400" height="200"></iframe>
        </div>
        <div class="foot">
            <div class="foot-right">
            </div>
        </div>
    </div> 
    <div id="warp">
        <div id="warp_l">
            <div id="warp_write">
            </div>
            <!--顶部白色撑下来 -->
            <div id="warp_ltop">
            </div>
            <div class="warp_lbgs">
                <div id="reg_l">
                    <div style="float: left; width: 80px; text-align: center;">
                        <asp:Image ID="userface" runat="server" /></div>
                    <div style="float: left;">
                        <ul>
                            <li class="warp_d"><a href="UserInfo/info_Jiben.aspx">
                                <asp:Literal ID="lblName" runat="server"></asp:Literal></a></li>
                            <li class="font1">
                                <asp:Literal ID="lblAddress" runat="server"></asp:Literal></li>
                        </ul>
                    </div>
                    <br />
                </div>
                <div class="gan_k">
                    <p class="p1">
                        <font class="gok"><a href="Attation.aspx?Type=0">
                            <asp:Literal ID="Attention" runat="server"></asp:Literal></a></font><br />
                        <a href="/t/Attation.aspx?Type=0>">关注</a>
                    </p>
                    <p class="p2">
                        <font class="gok"><a href="Attation.aspx?Type=1">
                            <asp:Literal ID="Fans" runat="server"></asp:Literal></a></font><br />
                        <a href="/t/Attation.aspx?Type=1">粉丝</a>
                    </p>
                    <p class="p2">
                        <font class="gok"><a href="UserInfo/info_MyWeibo.aspx">
                            <asp:Literal ID="Allnum" runat="server"></asp:Literal></a></font><br />
                        <a href="/t/UserInfo/info_MyWeibo.aspx">微博</a>
                    </p>
                </div>
                <div class="lin" style="display: none">
                </div>
                <div id="mobil" style="display: none">
                    <a href="">绑定手机上微博 随时随地看微博</a></div>
                <div class="nav">
                </div>
            </div>
            <div class="warp_lbot">
            </div>
            <div id="search">
                <div id="sear_b">
                    <asp:ImageButton ID="ibSearch" runat="server" ImageUrl="../App_Themes/Microblog/images/s_b.jpg"
                        OnClick="ibSearch_Click" /></div>
                <asp:TextBox ID="sear_input" runat="server" Text="搜索者吧、找人"></asp:TextBox>
            </div>
            <div class="wrap01_tit">
                <span>投票</span></div>
            <div class="warp_lbg">
            <div class="wrap02_content" style=" padding-left:10px;">
          <iframe src="/Common/Vote.aspx?sid=1" width="210" height="210" frameborder="0" scrolling="no"  ></iframe> 
            </div>
                <ul class="wrap02_bottom">
                </ul>
            </div>
              
            <div class="wrap01_tit">
                <span>日程安排</span></div>
            <div class="warp_lbgs">
            <div>
            今日日程
            明日日程
            </div>
                <ul class="wrap02_bottom">
                </ul>
            </div>
             <div class="wrap01_tit">
                <span>去年今日</span></div>
            <div class="warp_lbgs">
            <div id="PreTopic">
           <ul> <asp:Repeater ID="Repeater5" runat="server">
            <ItemTemplate> 
                    <li class="tli">
                      <div> <%#ShowIco(Eval("id", "{0}"))%><%# GetBroads(Eval("id","{0}"))%></div>
                            <div> <%#GetLink(Eval("MbID", "{0}"), Eval("id", "{0}"))%></div>
                       <%#Eval("CreateTime")%>
                      <div id='con_<%#Eval("id") %>' name="divCont" style="width: 99%; border: solid 1px #999; display: none; float: right">
                        <div id='divCont<%#Eval("id") %>' style="width: 100%; margin-left: 5px; margin-top: 5px;
                                            float: left"> </div>
                        <div style="width: 100%;">
                          <div id='tip<%#Eval("id") %>' style="float: left"> </div>
                          <input type="text" id='txtCommon<%#Eval("id") %>' name='<%#Eval("id") %>' style="margin-left: 5px;
                                                margin-right: 5px; width: 98%; height: 23px" onkeyup='Comm(this,this.name)' />
                        </div>
                        <div style="float: right;">
                          <input id='btnCom_<%#Eval("id") %>' type="button" value="转发 " onclick="g_Dile('<%#Eval("MbID") %>','<%#Eval("ForId") %>','<%#Eval("id") %>')" />
                        </div>
                        
                      </div>
                    </li> 
            </ItemTemplate>
            </asp:Repeater>
            </ul> 
          <label id="preNon" runat="server">去年今日没发原创广播，今天说两句，明年再来看。
<a href="#txt_Content">现在写</a></label> </div>
                <ul class="wrap02_bottom">
                </ul>
            </div>
               <div class="wrap01_tit">
                <span>云盘</span></div>
            <div class="wrap02_content">
            <ul>
<li><a href="/user/CloudManage.aspx?Type=file" target="main_right">我的文档</a></li>
<li><a href="/user/CloudManage.aspx?Type=photo" target="main_right">我的相册</a></li>
<li><a href="/user/CloudManage.aspx?Type=music" target="main_right">我的音乐</a></li>
<li><a href="/user/CloudManage.aspx?Type=video" target="main_right">我的视频</a></li>
            </ul>
                <ul class="wrap02_bottom">
                </ul>
            </div>
            <div class="wrap01_tit">
                <span>24小时活跃用户</span></div>
            <div class="warp_lbg">
                <ul>
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <li>
                                <img src="<%#GetUserFace(Eval("UserName","{0}")) %>" />
                                <span><font class="blue"><a href="UserInfo/info_MyWeibo.aspx?uid=<%#Eval("userID") %>">
                                    <%#Eval("UserName") %></a></font><br />
                                    <%#GetRemark(Eval("Remark","{0}"))%><br />
                                    <%#GetLastMob(Eval("UserID","{0}")) %><br />
                                </span></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <ul class="wrap02_bottom">
                </ul>
            </div>
            <div class="clear">
            </div>
            <div class="wrap01_tit">
                <span><a href="#">大家关注的主题</a></span></div>
            <div class="wrap02_content">
                <ul>
                    <asp:Repeater ID="repTheme" runat="server">
                        <ItemTemplate>
                            <li><a href="ThemeVBlog.aspx?id=<%#Eval("Id") %>">
                                <%#Eval("ThemeCon","{0}")%></a>(<%#Eval("TopicNum")%>)</li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <span><a href="Topic.aspx">更多关注主题.....</a></span>
            </div>
            <div class="wrap02_bottom">
            </div>
            <div class="wrap01_tit">
                <span>人气推荐  </span></div>
            <div class="warp_lbg">
                <ul>
                    <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <li>
                                <img src="<%#GetUserFace(Eval("UserName","{0}")) %>" />
                                <span><font class="blue"><a href="UserInfo/info_MyWeibo.aspx?uid=<%#Eval("userID") %>">
                                    <%#Eval("UserName") %></a></font>
                                    <div style="margin-top: 5px">
                                        <%#GetAttion(Eval("Userid","{0}")) %></div>
                                </span></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <span style="float: right; margin-right: 10px;"><a href="/t/Fans.aspx">更多人气推荐...</a></span>
                <div style="clear: both;" class="wrap02_bottom">
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <!--左边结束 -->
        <div id="warp_r">
            <div id="warp_rtop">
                <div id="nav">
                    <ul>
                        <li><a href="Content.aspx">者吧首页</a></li>
                        <li><a href="Topic.aspx">主题者吧</a></li>
                        <li><a href="TongCheng.aspx">同城者吧</a></li>
                        <li><a href="blogLiving.aspx">直播室</a></li>
                        <li><a href="/t/MyMicrob.aspx">我的首页</a></li>
                        <li><a href="UserInfo/info_MyWeibo.aspx">我的者吧</a></li>
                        <li> <asp:Literal ID="liSite" runat="server"></asp:Literal></li>
                        <li style="float: right; margin-right: 40px !important; margin-right: 30px;">  <asp:Literal ID="logtxt" runat="server"></asp:Literal></li>
                    </ul>
                </div>
            </div>
            <!--右边顶部 -->
            <div class="r_ni">
                <div class="ni_top">
                    <div style="width: 200px; float: right; margin-right: 50px; margin-top: 18px; margin-bottom: 10px;  text-align: right;">
                        <div id="tip" style="width: 80px; float: left; margin-top: 10px; color: #ffffff">你还可以输入</div>
                        <div id="lastNummber" style="color: #ffffff; font-family: Constantia, Georgia; font-size: 30px; width: 50px; float: left; margin-top: -10px; text-align: center">140</div>
                        <div style="float: right; margin-right: 45px; margin-top: 10px; color: #ffffff">个字</div>
                    </div>
                </div>
                <div class="ni_ln">
                    <div class="ni_text">
                        <asp:TextBox ID="txt_Content" runat="server" Text="" TextMode="MultiLine"></asp:TextBox>
                        <asp:HiddenField ID="txtimages" runat="server" />
                        <asp:HiddenField ID="txtDocment" runat="server" />
                        <asp:HiddenField ID="txtDocmentName" runat="server" />
                        <asp:HiddenField ID="txtmusic" runat="server" />
                        <asp:HiddenField ID="txtvidio" runat="server" />
                        <asp:HiddenField ID="txtVoite" runat="server" />
                        <asp:HiddenField ID="txtIsCloud" runat="server" />
                    </div>
                </div>
                <div class="ni_hd">
                    <div class="ni_hd_m">
                        <span id="ele1"><a href="javascript:void(0)">
                            <img src="../App_Themes/Microblog/images/14.jpg" alt="" /></a><a href="javascript:void(0)">表情</a></span>
                            <span  id="ele2">
                            <a href="javascript:void(0)"><img src="../App_Themes/Microblog/images/15.jpg" alt="" /></a><a href="javascript:void(0)">图片</a></span>
                            <span id="ele3"><a href="javascript:void(0)"><img src="../App_Themes/Microblog/images/16.jpg" alt="" /></a><a href="javascript:void(0)">视频</a></span>
                            <span id="ele4"><a href="javascript:void(0)"><img src="../App_Themes/Microblog/images/17.jpg" alt="" /></a><a href="javascript:void(0)">音乐</a></span>
                             <span id="ele5"><a href="javascript:void(0)"><img src="../App_Themes/Microblog/images/19.gif" alt="" /></a><a href="javascript:void(0)">文件</a></span>
                           <span onclick="clickhuati()"><a href="javascript:void(0)"><img src="../App_Themes/Microblog/images/18.jpg" alt="" /></a><a href="javascript:void(0)">话题</a></span>
                           <span  id="ele6"> <a href="javascript:void(0)"><img src="../App_Themes/Microblog/images/20.gif" alt="" /></a><a href="javascript:void(0)">投票</a></span>
                    </div>
                    <div class="ni_hd_n">
                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" Style="display: none" />
                        <img src="../App_Themes/Microblog/images/fb.jpg" border="0" id="ibFabu" name="ibFabu"  style="cursor: pointer" alt="发表" title="发表微博" onclick="Postto()" />
                    </div>
                </div>
            </div>
            <div id="r_k_top">
            </div>
            <div id="r_k_main">
                <div class="top_tit">
                    <span><a href="Topic.aspx">更多>></a></span><b>推荐主题</b></div>
                <div class="lin">
                </div>
                <div class="r_k_main_content">
                    <a class="bar_l_zt" id="bar_l_zt"></a>
                    <div class="pic_div_zt">
                        <ul id="photo_ul_zt">
                            <asp:Repeater ID="repeateTheme" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <p>
                                            <%#GetImg(Eval("imgUrl","{0}"),Eval("ID","{0}"))%></p>
                                        <div>
                                            <span><a href="ThemeVBlog.aspx?id=<%#Eval("ID") %>"><font color="#1A74E2">
                                                <%#Eval("ThemeCon")%></font></a></span> <span>
                                                    <%#Eval("Title")%></span>
                                            <label>
                                                <%#GetNewTheme(Eval("ID","{0}")) %></label></div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <a class="bar_r_zt" id="bar_r_zt"></a>
                    <script type="text/javascript" src="/js/ued_func.js?1"></script>
                </div>
                <div class="top_tit01">
                    <b>TT推荐</b></div>
                <div class="lin">
                </div>
                 <asp:Repeater ID="Repeater4" runat="server">
                    <ItemTemplate>
                        <table width="100%">
                <div class="r_k_wp">
                  <ul>
                    <li style="float:left;margin-right:10px; padding-right:10px"><img src="<%#GetUserFace(Eval("Inputer","{0}")) %>" width="50px" height="50px" /></li>
                    <li style="float:left;width: 88%">
                      <div><a href="UserInfo/info_MyWeibo.aspx?uid=<%#Eval("MbID")%>"><font color="#1A74E2"> <%#Eval("Inputer")%></font></a>：<%#ShowIco(Eval("id", "{0}"))%><%# GetBroads(Eval("id","{0}"))%></div>
                    </li>
                    <li style="width:90%; float:left; margin-left:70px">
                      <div style="width:100%">
                        <ul>
                          <li style="float:left; width:50%;"><%#GetTime(Eval("CreateTime","{0}"))%></li>
                          <li style="float:left; width:49%; text-align:right;">
                            <div> <%#GetLink(Eval("MbID", "{0}"), Eval("id", "{0}"))%></div>
                          </li>
                        </ul>
                      </div>
                    </li>
                    <li style="width: 100%; float: right">
                      <div id='con_<%#Eval("id") %>' name="divCont" style="width: 99%; border: solid 1px #999; display: none; float: right">
                        <div id='divCont<%#Eval("id") %>' style="width: 100%; margin-left: 5px; margin-top: 5px;
                                            float: left"> </div>
                        <div style="width: 100%;">
                          <div id='tip<%#Eval("id") %>' style="float: left"> </div>
                          <input type="text" id='txtCommon<%#Eval("id") %>' name='<%#Eval("id") %>' style="margin-left: 5px;
                                                margin-right: 5px; width: 98%; height: 23px" onkeyup='Comm(this,this.name)' />
                        </div>
                        <div style="float: right;">
                          <input id='btnCom_<%#Eval("id") %>' type="button" value="转发 " onclick="g_Dile('<%#Eval("MbID") %>','<%#Eval("ForId") %>','<%#Eval("id") %>')" />
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="lin01"> </div>
                </table>
                    </ItemTemplate>
                </asp:Repeater>
               

                <div class="top_tit01">
                    <b>大家正在者.....</b></div>
                <div class="lin">
                </div>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <table width="100%">
                <div class="r_k_wp">
                  <ul>
                    <li style="float:left;margin-right:10px; padding-right:10px"><img src="<%#GetUserFace(Eval("Inputer","{0}")) %>" width="50px" height="50px" /></li>
                    <li style="float:left;width: 88%">
                      <div><a href="UserInfo/info_MyWeibo.aspx?uid=<%#Eval("MbID")%>"><font color="#1A74E2"> <%#Eval("Inputer")%></font></a>：<%#ShowIco(Eval("id", "{0}"))%><%# GetBroads(Eval("id","{0}"))%></div>
                    </li>
                    <li style="width:90%; float:left; margin-left:70px">
                      <div style="width:100%">
                        <ul>
                          <li style="float:left; width:50%;"><%#GetTime(Eval("CreateTime","{0}"))%></li>
                          <li style="float:left; width:49%; text-align:right;">
                            <div> <%#GetLink(Eval("MbID", "{0}"), Eval("id", "{0}"))%></div>
                          </li>
                        </ul>
                      </div>
                    </li>
                    <li style="width: 100%; float: right">
                      <div id='con_<%#Eval("id") %>' name="divCont" style="width: 99%; border: solid 1px #999; display: none; float: right">
                        <div id='divCont<%#Eval("id") %>' style="width: 100%; margin-left: 5px; margin-top: 5px;
                                            float: left"> </div>
                        <div style="width: 100%;">
                          <div id='tip<%#Eval("id") %>' style="float: left"> </div>
                          <input type="text" id='txtCommon<%#Eval("id") %>' name='<%#Eval("id") %>' style="margin-left: 5px;
                                                margin-right: 5px; width: 98%; height: 23px" onkeyup='Comm(this,this.name)' />
                        </div>
                        <div style="float: right;">
                          <input id='btnCom_<%#Eval("id") %>' type="button" value="转发 " onclick="g_Dile('<%#Eval("MbID") %>','<%#Eval("ForId") %>','<%#Eval("id") %>')" />
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="lin01"> </div>
                </table>
                    </ItemTemplate>
                </asp:Repeater>
                <div id="PageList" runat="server">
                </div>
                <div class="clear">
                </div>
                <div class="up">
                    <img src="../App_Themes/Microblog/images/up.jpg" /><a href="#">返回顶部</a>
                </div>
            </div>
            <div id="r_k_end">
            </div>
            <br />
            <br />
            <br />
        </div>
        <!--右边结束 -->
        <div class="clear">
        </div>
    </div>
    <div id="warp_bottom">
    </div>
    <div id="copyright">
        <ul>
            <li><a href="">关于我们们</a></li>
            <li>|</li>
            <li><a href="">网站地图</a></li>
            <li>|</li>
            <li><a href="">免责声明</a></li>
            <li>|</li>
            <li><a href="">版权申明</a></li>
            <li>|</li>
            <li><a href="">招贤纳士</a></li>
            <li>|</li>
            <li><a href="">广告服务</a></li>
            <li>|</li>
            <li><a href="">网站合作</a></li>
            <li>|</li>
            <li><a href="">帮助中心</a></li>
            <li>|</li>
            <li><a href="">投稿指南</a></li>
            <li>|</li>
            <li><a href="">联系我们</a></li>
            <li>|</li>
            <li><a href="">友情链接</a></li>
        </ul>
        <p>
            Copyright&copy;&nbsp;<%Call.Label("{$SiteName/}"); %>All rights reserved</p>
    </div>
    <div id="meages" class="toolbar" style="width: 300px; height: 30px; line-height: 30px;
        text-align: center; color: #666666" align="center">
        新消息：&nbsp;&nbsp;<a href="/t/pinglun.aspx">评论(<asp:Literal ID="licom" runat="server"></asp:Literal>)</a>
        &nbsp;&nbsp;<a href="Attation.aspx?Type=1">粉丝(<asp:Literal ID="Literal1" runat="server"></asp:Literal>)</a>
        &nbsp;&nbsp;<a href="/t/info_Letter.aspx">私信(<asp:Literal ID="liLetter" runat="server"></asp:Literal>)</a>
        &nbsp;&nbsp;<a href="/t/UserInfo/MyAttion.aspx?CurrPage=1">提到我的(<asp:Literal ID="Literal2"
            runat="server"></asp:Literal>)</a></div>
    <script language="JavaScript">
        function sc5() {
            document.getElementById("meages").style.top = 67.5 + "px"; // (document.documentElement.scrollTop + (document.documentElement.clientHeight - document.getElementById("meages").offsetHeight)/2-288) + "px";
            document.getElementById("meages").style.left = ((document.documentElement.clientWidth - document.getElementById("meages").offsetWidth) / 2 + 318) + "px";
        }
        setInterval(sc5, 200);

        function letBig(obj) {
            obj.style.width = parseInt(obj.style.width) * 2;
            obj.style.height = parseInt(obj.style.height) * 2;
        }
    </script>
    </form>
</body>
</html>
