<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

    <head>
        <title>修改密码</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <jsp:include page="/views/resources/head.jsp" flush="true"/>

<style>
.error{
	color:red;
}
</style>
    </head>

    <body>
        <!-- WRAPPER -->
        <div id="wrapper">
            <!-- NAVBAR -->
        <jsp:include page="/views/common/nav.jsp" flush="true"/>
        <!-- END NAVBAR -->
        <!-- LEFT SIDEBAR -->
        <jsp:include page="/views/common/left.jsp" flush="true"/>
        <!-- END LEFT SIDEBAR -->
        <!-- MAIN -->
            <!-- MAIN -->
            <div class="main">
                <!-- MAIN CONTENT -->
                <div class="main-content">
                    <div class="container-fluid">
                        <h3 class="page-title">修改密码</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <form id="user-modify" >
                                    <p>
                                        <label for="pwd_fir">密码:</label>
                                        <input type="password" name="pwd_fir" class="form-control" id="pwd_fir" placeholder="Password">
                                    </p>
                                    <p>
                                        <label for="pwd_sec">重复一遍:</label>
                                        <input type="password" name="pwd_sec" class="form-control" id="pwd_sec" placeholder="Re-Password">
                                    </p>
                                    <button id="modify-submit" class="btn btn-default">确定修改</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MAIN CONTENT -->
            </div>

            <!-- END MAIN -->
            <div class="clearfix"></div>
            <jsp:include page="/views/common/copyright.jsp" flush="true" />
        </div>
	<!-- END WRAPPER -->

<script src="${ctx}/views/assets/vendor/jquery/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>


<script type="text/javascript">

$.validator.setDefaults({
    submitHandler: function() {
         var pwd=$('#pwd_fir').val(); 
		       	 $.ajax({
					  type: 'post',
				        url: '${ctx}/secretary/secretary-update',
				        data: {password:pwd},
				        success:function(flag){
			        		  if(flag==1||flag=='1'){alert('新密码请牢记,下次登陆使用新密码!');location.href ="home";}
			        		  else{alert("密码修改失败,请重试.");}
				        }
					})   //调用删除
    }
});


$().ready(function() {	
$("#user-modify").validate({
                    event:'keyup',
                rules : {
                	  pwd_fir : {
                          required : true,
                          minlength : 6,
                          maxlength : 16
                      },
                	  pwd_sec : {
                        required : true,
                        equalTo : "#pwd_fir"
                       },
                    
                     messages : {
                    	     pwd_fir : {
                             required : "必填项",
                             minlength : "长度不少于6位",
                             maxlength : "长度不超过16位"
                              },
                          pwd_sec : {
                              required : "必填项",
                              equalTo : "密码不一致"
                              }
                        }//messages
                  }//rules.
            });//validate
});//ready
			

		</script>
    </body>

</html>