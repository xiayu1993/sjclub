<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录 | 视界</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 使浏览器默认启用极速模式，但并不是所有浏览器都能正确执行 -->
<meta name="renderer" content="webkit">
<!-- 使IE浏览器启用最新的版本 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 使页面宽度与视口宽度相同，并且禁止用户缩放页面 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- 页面关键字 -->
<meta name="keywords" content="">
<!-- 页面描述 -->
<meta name="description" content="">
<!-- IE8下调用以使用HTML5和媒体查询 -->
<%@include file="../global-page/IE8.jsp" %>
<link rel="shortcut icon" href="../global-img/icon.ico">
<link rel="stylesheet" href="../global-css/bootstrap.min.css">
<link rel="stylesheet" href="../global-css/global.css">
</head>
<body>
<div class="login">
	<h4 class="modal-title">登录</h4>
	<form class="form-horizontal" role="form">
		<!-- account -->
		<div class="form-group has-feedback" id="login-account">
			<label class="col-sm-2 control-label">邮箱</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" placeholder="输入邮箱">
				<span class="glyphicon form-control-feedback" id="login-account-gly"></span>
				<span class="help-block" id="login-account-tip"></span>
			</div>
		</div>
		<!-- password -->
		<div class="form-group has-feedback" id="login-password">
			<label class="col-sm-2 control-label">密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" placeholder="输入密码">
				<span class="glyphicon form-control-feedback" id="login-password-gly"></span>
				<span class="help-block" id="login-password-tip"></span>
			</div>
		</div>
	</form>
	<button type="button" class="btn btn-primary" id="login-submit">登录</button>
</div>

<script src="../global-js/jquery.min.js"></script>
<script src="../global-js/bootstrap.min.js"></script>
<!-- 数据验证 -->
<script>
$(document).ready(function(){
	//邮箱格式的正则表达式
	var emaliReg = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+(com|cn)$/);
	//显示错误信息
	function showErrorTip(message,div,gly,tip){
		div.addClass("has-error");
		gly.addClass("glyphicon-remove");
		tip.show().html(message);
	}
	//显示通过
	function showOk(div,gly,tip){
		div.removeClass("has-error");
		gly.removeClass("glyphicon-remove");
		tip.html("").hide();
		div.addClass("has-success");
		gly.addClass("glyphicon-ok");
	}
	//清除显示的信息
	function cleanTip(div,gly,tip){
		div.removeClass("has-error");
		gly.removeClass("glyphicon-remove");
		tip.html("").hide();
	}
	
	/*
	 * 登录表单的验证 
	 */
	//获取各个元素
	var log_acc = $("#login-account");
	var log_acc_input = $("#login-account>div>input");
	var log_acc_gly = $("#login-account-gly");
	var log_acc_tip = $("#login-account-tip");
	
	var log_pas = $("#login-password");
	var log_pas_input = $("#login-password>div>input");
	var log_pas_gly = $("#login-password-gly");
	var log_pas_tip = $("#login-password-tip");
	
	var log_sub = $("#login-submit");
	
	//初始时时提示信息隐藏
	log_acc_tip.hide();
	log_pas_tip.hide();
	
	//输入框获得焦点后清除提示信息
	log_acc_input.focus(function(){cleanTip(log_acc,log_acc_gly,log_acc_tip)});
	log_pas_input.focus(function(){cleanTip(log_pas,log_pas_gly,log_pas_tip)});
	
	//当密码框获得焦点时检查账号是否为空，是否为邮箱
	//为空或不是邮箱的格式则进行提示，如果通过则检查账号是否存在
	log_pas_input.focus(function(){
		if(log_acc_input.val() == ""){
			//不能为空
			showErrorTip("邮箱不能为空！",log_acc,log_acc_gly,log_acc_tip);
		}else{
			//检查是否是邮箱的格式
			if(!emaliReg.test(log_acc_input.val())){
				showErrorTip("请输入合法的邮箱！",log_acc,log_acc_gly,log_acc_tip);
			}else{
				//检查账号是否存在
				$.get("../Login?action=checkAcc&account="+log_acc_input.val()+"&"+new Date().getTime(),
					function(data){
						//邮箱不存在则提示信息
						if(data == "notExist"){
							showErrorTip("此邮箱不存在！",log_acc,log_acc_gly,log_acc_tip);
						}else if(data == "ok"){
							showOk(log_acc,log_acc_gly,log_acc_tip);
						}
				})
			}
		}
	})
	
	//当点击登录按钮后进行数据验证，通过后登录
	log_sub.click(function(){
		if(log_acc_input.val() == ""){
			//不能为空
			showErrorTip("邮箱不能为空！",log_acc,log_acc_gly,log_acc_tip);
		}
		if(log_pas_input.val() == ""){
			showErrorTip("密码不能为空！",log_pas,log_pas_gly,log_pas_tip);
		}else{
			$.get("../Login?action=checkPas&password="+log_pas_input.val()+"&page=login.jsp"+new Date().getTime(),
				function(data){
					if(data == "pasIsError"){
						//密码错误则提示
						showErrorTip("密码错误，请输入正确密码！",log_pas,log_pas_gly,log_pas_tip);
					}else{
						//临时使用，密码正确则发送到波波的后台页面
						//window.location.href = data;
						//密码正确则跳转到首页
						window.location.href = "../sjclub/index.jsp";
					}
			})
		}
	})
	
})
</script>
</body>
</html>