<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 在页面中使用jquery调用下面两句话来使用模态框显示提示信息
	$("#messageModal-body").html("您已经是此社团的成员了，可以加入其它社团哦。");
	$("#messageModal").modal('show');
--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="messageModal">
  <div class="modal-dialog">
    <div class="modal-content">
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        	<h4 class="modal-title">提示</h4>
      	</div>
      
      <div class="modal-body" id="messageModal-body">
      	<!-- 此处输入要显示的信息 -->
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>