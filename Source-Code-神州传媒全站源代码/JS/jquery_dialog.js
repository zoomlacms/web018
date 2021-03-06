﻿
var JqueryDialog = {
	
	//配置项
	//模态窗口背景色
	"cBackgroundColor"			:	"#ffffff",
	
	//阴影距离(右)
	"cShdowRight"				:	4,
	//阴影距离(下)
	"cShdowDown"				:	8,
	
	//边框尺寸(像素)
	"cBorderSize"				:	1,
	//边框颜色
	"cBorderColor"				:	"#839DAB",

	//Header背景色
	"cHeaderBackgroundColor"	:	"#f0f0f0",
	//右上角关闭显示文本
	"cCloseText"				:	"关闭",
	//鼠标移上去时的提示文字
	"cCloseTitle"				:	"关闭",
	
	//Bottom背景色
	"cBottomBackgroundColor"	:	"#f0f0f0",
	//提交按钮文本
	"cSubmitText"				:	"提 交",
	//取消按钮文本
	"cCancelText"				:	"取 消",
	
	//拖拽效果
	"cDragTime"					:	"100",
	
	/// <summary>创建对话框(自定义)</summary>
	/// <param name="dialogTitle">对话框标题</param>
	/// <param name="iframeSrc">iframe嵌入页面地址</param>
	/// <param name="iframeWidth">iframe嵌入页面宽</param>
	/// <param name="iframeHeight">iframe嵌入页面高</param>
	Open:function(dialogTitle, iframeSrc, iframeWidth, iframeHeight){
		JqueryDialog.init(dialogTitle, iframeSrc, iframeWidth, iframeHeight, true, true);
	},
	
	/// <summary>创建对话框(自定义1,不包含底部)</summary>
	/// <param name="dialogTitle">对话框标题</param>
	/// <param name="iframeSrc">iframe嵌入页面地址</param>
	/// <param name="iframeWidth">iframe嵌入页面宽</param>
	/// <param name="iframeHeight">iframe嵌入页面高</param>
	//加了刷新父页
	Open1:function(dialogTitle, iframeSrc, iframeWidth, iframeHeight){
	JqueryDialog.init2(dialogTitle, iframeSrc, iframeWidth, iframeHeight, false, true);
	},
	
	init: function (dialogTitle, iframeSrc, iframeWidth, iframeHeight, isBottom, isDrag) {
	    var _px_shadow = 0; var _px_top = 25; var _px_bottom = 0; if (!isBottom) { _px_bottom = 0; } var _client_width = document.body.clientWidth; var _client_height = document.documentElement.scrollHeight; if (typeof ($("#jd_shadow")[0]) == "undefined") { $("body").prepend("<div id='jd_shadow'>&nbsp;</div>"); var _jd_shadow = $("#jd_shadow"); _jd_shadow.css("width", _client_width + "px"); _jd_shadow.css("height", _client_height + "px"); } if (typeof ($("#jd_dialog")[0]) != "undefined") { $("#jd_dialog").remove(); } $("body").prepend("<div id='jd_dialog'></div>"); var _jd_dialog = $("#jd_dialog"); var _left = (_client_width - (iframeWidth + JqueryDialog.cBorderSize * 2 + JqueryDialog.cShdowRight)) / 2; _jd_dialog.css("left", (_left < 0 ? 0 : _left) + document.documentElement.scrollLeft + "px"); var _top = (document.documentElement.clientHeight - (iframeHeight + JqueryDialog.cBorderSize * 2 + _px_top + _px_bottom + JqueryDialog.cShdowDown)) / 2; _jd_dialog.css("top", "100px");//_jd_dialog.css("top", (_top < 0 ? 0 : _top) + document.documentElement.scrollTop + "px");
	    _jd_dialog.append("<div id='jd_dialog_s'>&nbsp;</div>"); var _jd_dialog_s = $("#jd_dialog_s"); _jd_dialog_s.css("width", iframeWidth + JqueryDialog.cBorderSize * 2 + "px"); _jd_dialog_s.css("height", iframeHeight + JqueryDialog.cBorderSize * 2 + _px_top + _px_bottom + "px"); _jd_dialog_s.css("left", JqueryDialog.cShdowRight + "px"); _jd_dialog_s.css("top", JqueryDialog.cShdowDown + "px");//_jd_dialog_s.css("top", JqueryDialog.cShdowDown + "px");
	    _jd_dialog.append("<div id='jd_dialog_m'></div>"); var _jd_dialog_m = $("#jd_dialog_m"); _jd_dialog_m.css("border", JqueryDialog.cBorderColor + " " + JqueryDialog.cBorderSize + "px solid"); _jd_dialog_m.css("width", iframeWidth + "px"); _jd_dialog_m.css("background-color", JqueryDialog.cBackgroundColor); _jd_dialog_m.append("<div id='jd_dialog_m_h'></div>"); var _jd_dialog_m_h = $("#jd_dialog_m_h"); _jd_dialog_m_h.css("background-color", JqueryDialog.cHeaderBackgroundColor); _jd_dialog_m_h.append("<span id='jd_dialog_m_h_l'>" + dialogTitle + "</span>"); _jd_dialog_m_h.append("<span id='jd_dialog_m_h_r' title='" + JqueryDialog.cCloseTitle + "' onclick='JqueryDialog.Close();'>" + JqueryDialog.cCloseText + "</span>"); _jd_dialog_m.append("<div id='jd_dialog_m_b'></div>"); var _jd_dialog_m_b = $("#jd_dialog_m_b"); _jd_dialog_m_b.css("width", iframeWidth + "px"); _jd_dialog_m_b.css("height", iframeHeight + "px"); _jd_dialog_m_b.append("<div id='jd_dialog_m_b_1'>&nbsp;</div>"); var _jd_dialog_m_b_1 = $("#jd_dialog_m_b_1"); _jd_dialog_m_b_1.css("top", "25px"); _jd_dialog_m_b_1.css("width", iframeWidth + "px"); _jd_dialog_m_b_1.css("height", iframeHeight + "px"); _jd_dialog_m_b_1.css("display", "none"); _jd_dialog_m_b.append("<div id='jd_dialog_m_b_2'></div>"); $("#jd_dialog_m_b_2").append("<iframe id='jd_iframe' src='" + iframeSrc + "' frameborder='0' width='" + iframeWidth + "' height='" + iframeHeight + "' />"); if (isDrag) { DragAndDrop.Register(_jd_dialog[0], _jd_dialog_m_h[0]); } $("#jd_iframe")[0].focus();
	},

	init2: function (dialogTitle, iframeSrc, iframeWidth, iframeHeight, isBottom, isDrag) {
	    var _px_shadow = 0; var _px_top = 25; var _px_bottom = 0; if (!isBottom) { _px_bottom = 0; } var _client_width = document.body.clientWidth; var _client_height = document.documentElement.scrollHeight; if (typeof ($("#jd_shadow")[0]) == "undefined") { $("body").prepend("<div id='jd_shadow'>&nbsp;</div>"); var _jd_shadow = $("#jd_shadow"); _jd_shadow.css("width", _client_width + "px"); _jd_shadow.css("height", _client_height + "px"); } if (typeof ($("#jd_dialog")[0]) != "undefined") { $("#jd_dialog").remove(); } $("body").prepend("<div id='jd_dialog'></div>"); var _jd_dialog = $("#jd_dialog"); var _left = (_client_width - (iframeWidth + JqueryDialog.cBorderSize * 2 + JqueryDialog.cShdowRight)) / 2; _jd_dialog.css("left", (_left < 0 ? 0 : _left) + document.documentElement.scrollLeft + "px"); var _top = (document.documentElement.clientHeight - (iframeHeight + JqueryDialog.cBorderSize * 2 + _px_top + _px_bottom + JqueryDialog.cShdowDown)) / 2; _jd_dialog.css("top", "100px");// _jd_dialog.css("top", (_top < 0 ? 0 : _top) + document.documentElement.scrollTop + "px");
	    _jd_dialog.append("<div id='jd_dialog_s'>&nbsp;</div>"); var _jd_dialog_s = $("#jd_dialog_s"); _jd_dialog_s.css("width", iframeWidth + JqueryDialog.cBorderSize * 2 + "px"); _jd_dialog_s.css("height", iframeHeight + JqueryDialog.cBorderSize * 2 + _px_top + _px_bottom + "px"); _jd_dialog_s.css("left", JqueryDialog.cShdowRight + "px"); _jd_dialog_s.css("top", JqueryDialog.cShdowDown + "px"); _jd_dialog.append("<div id='jd_dialog_m'></div>"); var _jd_dialog_m = $("#jd_dialog_m"); _jd_dialog_m.css("border", JqueryDialog.cBorderColor + " " + JqueryDialog.cBorderSize + "px solid"); _jd_dialog_m.css("width", iframeWidth + "px"); _jd_dialog_m.css("background-color", JqueryDialog.cBackgroundColor); _jd_dialog_m.append("<div id='jd_dialog_m_h'></div>"); var _jd_dialog_m_h = $("#jd_dialog_m_h"); _jd_dialog_m_h.css("background-color", JqueryDialog.cHeaderBackgroundColor); _jd_dialog_m_h.append("<span id='jd_dialog_m_h_l'>" + dialogTitle + "</span>"); _jd_dialog_m_h.append("<span id='jd_dialog_m_h_r' title='" + JqueryDialog.cCloseTitle + "' onclick='JqueryDialog.Close2();'>" + JqueryDialog.cCloseText + "</span>"); _jd_dialog_m.append("<div id='jd_dialog_m_b'></div>"); var _jd_dialog_m_b = $("#jd_dialog_m_b"); _jd_dialog_m_b.css("width", iframeWidth + "px"); _jd_dialog_m_b.css("height", iframeHeight + "px"); _jd_dialog_m_b.append("<div id='jd_dialog_m_b_1'>&nbsp;</div>"); var _jd_dialog_m_b_1 = $("#jd_dialog_m_b_1"); _jd_dialog_m_b_1.css("top", "25px"); _jd_dialog_m_b_1.css("width", iframeWidth + "px"); _jd_dialog_m_b_1.css("height", iframeHeight + "px"); _jd_dialog_m_b_1.css("display", "none"); _jd_dialog_m_b.append("<div id='jd_dialog_m_b_2'></div>"); $("#jd_dialog_m_b_2").append("<iframe id='jd_iframe' src='" + iframeSrc + "' frameborder='0' width='" + iframeWidth + "' height='" + iframeHeight + "' />"); if (isDrag) { DragAndDrop.Register(_jd_dialog[0], _jd_dialog_m_h[0]); } $("#jd_iframe")[0].focus();
	},

Close:function(){if(typeof($("#jd_shadow")[0]) != "undefined"){$("#jd_shadow").remove();}if(typeof($("#jd_dialog")[0]) != "undefined"){$("#jd_iframe")[0].src = "";$("#jd_dialog").remove();}},

Close2: function () {
    window.top.opener = '';
    window.top.close();
    if (typeof ($("#jd_shadow")[0]) != "undefined") {
        $("#jd_shadow").remove(); 
    } if (typeof ($("#jd_dialog")[0]) != "undefined") {
        $("#jd_iframe")[0].src = ""; $("#jd_dialog").remove();
window.location.href = window.location.href;
}},

Ok:function(){var frm = $("#jd_iframe");frm[0].contentWindow.Ok();frm[0].focus();},
SubmitCompleted:function(alertMsg, isCloseDialog, isRefreshPage){if($.trim(alertMsg).length > 0 ){alert(alertMsg);}if(isCloseDialog){JqueryDialog.Close();}if(isRefreshPage){window.location.href = window.location.href;}},
SubmitCompleted1:function(alertMsg, parentUrl){if($.trim(alertMsg).length > 0 ){alert(alertMsg);}JqueryDialog.Close();window.location.href = parentUrl;}};var DragAndDrop = function(){var _clientWidth;var _clientHeight;var _controlObj;var _dragObj;var _flag = false;var _dragObjCurrentLocation;var _mouseLastLocation;var getElementDocument = function(element){return element.ownerDocument || element.document;};var dragMouseDownHandler = function(evt){if(_dragObj){evt = evt || window.event;_clientWidth = document.body.clientWidth;_clientHeight = document.documentElement.scrollHeight;$("#jd_dialog_m_b_1").css("display", "");_flag = true;_dragObjCurrentLocation = {x : $(_dragObj).offset().left,y : $(_dragObj).offset().top};_mouseLastLocation = {x : evt.screenX,y : evt.screenY};$(document).bind("mousemove", dragMouseMoveHandler);$(document).bind("mouseup", dragMouseUpHandler);if(evt.preventDefault){evt.preventDefault();}else{evt.returnValue = false;}}};var dragMouseMoveHandler = function(evt){	if(_flag){	evt = evt || window.event;var _mouseCurrentLocation = {x : evt.screenX,y : evt.screenY};_dragObjCurrentLocation.x = _dragObjCurrentLocation.x + (_mouseCurrentLocation.x - _mouseLastLocation.x);_dragObjCurrentLocation.y = _dragObjCurrentLocation.y + (_mouseCurrentLocation.y - _mouseLastLocation.y);_mouseLastLocation = _mouseCurrentLocation;$(_dragObj).css("left", _dragObjCurrentLocation.x + "px");$(_dragObj).css("top", _dragObjCurrentLocation.y + "px");if(evt.preventDefault){evt.preventDefault();}else{evt.returnValue = false;}}};var dragMouseUpHandler = function(evt){if(_flag){evt = evt || window.event;$("#jd_dialog_m_b_1").css("display", "none");cleanMouseHandlers();_flag = false;}};var cleanMouseHandlers = function(){if(_controlObj){$(_controlObj.document).unbind("mousemove");$(_controlObj.document).unbind("mouseup");}};return {Register : function(dragObj, controlObj){_dragObj = dragObj;_controlObj = controlObj;$(_controlObj).bind("mousedown", dragMouseDownHandler);}}}();
//-->