/**
 * 登录框和注册框的数据验证
 */
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
			$.get("../Login?action=checkPas&password="+log_pas_input.val()+"&"+new Date().getTime(),
				function(data){
					if(data == "pasIsError"){
						//密码错误则提示
						showErrorTip("密码错误，请输入正确密码！",log_pas,log_pas_gly,log_pas_tip);
					}else if(data == "ok"){
						//密码正确则刷新本页
						window.location.reload();
					}
			})
		}
	})
	
	/*
	 * 注册表单的验证
	 */
	//获取各个元素
	var reg_acc = $("#reg-account");
	var reg_acc_input = $("#reg-account>div>input");
	var reg_acc_gly = $("#reg-account-gly");
	var reg_acc_tip = $("#reg-account-tip");
	
	var reg_name = $("#reg-name");
	var reg_name_input = $("#reg-name>div>input");
	var reg_name_gly = $("#reg-name-gly");
	var reg_name_tip = $("#reg-name-tip");
	
	var reg_pas = $("#reg-password");
	var reg_pas_input = $("#reg-password>div>input");
	var reg_pas_gly = $("#reg-password-gly");
	var reg_pas_tip = $("#reg-password-tip");
	
	var reg_rep = $("#reg-repassword");
	var reg_rep_input = $("#reg-repassword>div>input");
	var reg_rep_gly = $("#reg-repassword-gly");
	var reg_rep_tip = $("#reg-repassword-tip");
	
	var reg_sub = $("#reg-submit");
	
	//初始时时提示信息隐藏
	reg_acc_tip.hide();
	reg_name_tip.hide();
	reg_pas_tip.hide();
	reg_rep_tip.hide();
	
	//输入框获得焦点后清除提示信息
	reg_acc_input.focus(function(){cleanTip(reg_acc,reg_acc_gly,reg_acc_tip)});
	reg_name_input.focus(function(){cleanTip(reg_name,reg_name_gly,reg_name_tip)});
	reg_pas_input.focus(function(){cleanTip(reg_pas,reg_pas_gly,reg_pas_tip)});
	reg_rep_input.focus(function(){cleanTip(reg_rep,reg_rep_gly,reg_rep_tip)});
	
	//当昵称框获得焦点时检查账号是否为空，是否为邮箱
	//为空或不是邮箱的格式则进行提示，如果通过则检查账号是否存在
	reg_name_input.focus(function(){
		if(reg_acc_input.val() == ""){
			//不能为空
			showErrorTip("邮箱不能为空！",reg_acc,reg_acc_gly,reg_acc_tip);
		}else{
			//检查是否是邮箱的格式
			if(!emaliReg.test(reg_acc_input.val())){
				showErrorTip("请输入合法的邮箱！",reg_acc,reg_acc_gly,reg_acc_tip);
			}else{
				//检查账号是否存在
				$.get("../Register?action=checkAcc&account="+reg_acc_input.val()+"&"+new Date().getTime(),
					function(data){
						if(data == "accExist"){
							showErrorTip("此邮箱已存在，请重新输入！",reg_acc,reg_acc_gly,reg_acc_tip);
						}else if(data == "ok"){
							showOk(reg_acc,reg_gly,reg_acc_tip);
						}
				})
			}
		}
	})
	
	//当密码框获得焦点时检查昵称是否为空
	//为空则提示，不为空则检查昵称是否存在
	reg_pas_input.focus(function(){
		if(reg_acc_input.val() == ""){
			//不能为空
			showErrorTip("邮箱不能为空！",reg_acc,reg_acc_gly,reg_acc_tip)
		}
		if(reg_name_input.val() == ""){
			//不能为空
			showErrorTip("昵称不能为空！",reg_name,reg_name_gly,reg_name_tip);
		}else{
			//检查账号是否存在
			$.get("../Register?action=checkName&name="+reg_name_input.val()+"&"+new Date().getTime(),
				function(data){
					if(data == "nameExist"){
						showErrorTip("此昵称已存在，请重新输入！",reg_name,reg_name_gly,reg_name_tip);
					}else if(data == "ok"){
						showOk(reg_name,reg_name,reg_name_tip);
					}
			})
		}
	})
	
	//当密码确认框获得焦点时检查密码是否为空
	//为空则提示，不为空则检查是否与上次输入的密码一致
	reg_rep_input.focus(function(){
		if(reg_acc_input.val() == ""){
			//不能为空
			showErrorTip("邮箱不能为空！",reg_acc,reg_acc_gly,reg_acc_tip)
		}
		if(reg_name_input.val() == ""){
			//不能为空
			showErrorTip("昵称不能为空！",reg_name,reg_name_gly,reg_name_tip);
		}
		if(reg_pas_input.val() == ""){
			//不能为空
			showErrorTip("密码不能为空！",reg_pas,reg_pas_gly,reg_pas_tip);
			showErrorTip("请先输入密码！",reg_rep,reg_rep_gly,reg_rep_tip);
		}
	})
	

	//当点击注册按钮后进行数据验证，通过后注册
	//两次密码要一致
	reg_sub.click(function(){
		if(reg_acc_input.val() == ""){
			//不能为空
			showErrorTip("邮箱不能为空！",reg_acc,reg_acc_gly,reg_acc_tip)
		}
		if(reg_name_input.val() == ""){
			//不能为空
			showErrorTip("昵称不能为空！",reg_name,reg_name_gly,reg_name_tip);
		}
		if(reg_pas_input.val() == ""){
			//不能为空
			showErrorTip("密码不能为空！",reg_pas,reg_pas_gly,reg_pas_tip);
		}
		if(reg_rep_input.val() == ""){
			//不能为空
			showErrorTip("请输入密码！",reg_rep,reg_rep_gly,reg_rep_tip);
		}else{
			 if(reg_rep_input.val() != reg_pas_input.val())
				 showErrorTip("两次输入的密码不一致!",reg_rep,reg_rep_gly,reg_rep_tip);
			 else{
				$.post("../Register",
					{
						account:reg_acc_input.val(),
						name:reg_name_input.val(),
						password:reg_pas_input.val()
					},
					function(data){
						if(data == "regOk"){
							window.location = location;
						}
					}
				)
			}
		}
	})

})