<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="loginModal">
  <div class="modal-dialog">
    <div class="modal-content">
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        	<h4 class="modal-title">登录</h4>
      	</div>
      
      <div class="modal-body">
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
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="login-submit">登录</button>
      </div>
    </div>
  </div>
</div>