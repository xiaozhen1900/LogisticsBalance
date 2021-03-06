<%@ page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>物流对账管理平台</title>
<link rel="icon" href="images/favicon.ico" mce_href="images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="images/favicon.ico" mce_href="images/favicon.ico" type="image/x-icon" />
<style>
body{font-size:12px;font-family:Arial;background:#fff url(/resource/images/loginbg.jpg) repeat-x 0 0}
*{margin:0;padding:0}
.login{width:739px;height:290px;margin:auto;position:absolute;left:50%;margin-left:-370px;top:213px;background:url(/resource/images/login.png) no-repeat 0 0}
.err{ text-align:center;color:#f00}
.lgBtn{ border:none;background:url(/resource/images/btn_login.png) no-repeat 0 0;width:114px;height:40px;cursor:pointer}
.boxIn{ padding:65px 0 0 415px}
.boxIn th,.boxIn td{ font-weight:normal;padding:10px 0 5px;color:#333}
.boxIn th{ text-align:right;padding:10px 5px 5px 0}
.copyright{ text-align:right;padding:55px 5px 0 0}
.txt{ width:184px;height:20px;border:1px solid #cdcdcd;background-color:#fff;line-height:20px;text-indent:5px;-webkit-border-radius:1px;-moz-border-radius:1px;border-radius:1px}
.txt:focus{ border-color:#56b3fb;background-color:#f2f9ff}
</style>
<script type="text/javascript" src="/lib/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/resource/script/common.js"></script>
<script language="JavaScript" type="text/JavaScript">
function validateForm(){

	return true;
}

function submitForm() {
    var  username = document.getElementById("username");
    var  password = document.getElementById("password");

    if(username.value == ""){
        $(".err").html("用户名不能为空！");
        return false;
    }
    if(password.value == ""){
        $(".err").html("密码不能为空！");
        return false;
    }

    $("#lgBtn").css("disabled","disabled");
    $.post(
        "/user/verifyLogin.do",
        {"username":$("#username").val(),"password":$("#password").val()},
        function(json){
            if(json){
                if("true" == json.success){
                    loginForm.submit();
                } else {
                    $(".err").html(json.message);
                }
            } else {
                $(".err").html("登录失败，系统错误！");
            }
        },
        "json"
    );
	//loginForm.submit();
}
document.onkeydown=keyListener;
function keyListener(e){    
    e = e ? e : event;   
    if(e.keyCode == 13){    
    	submitForm();   
    }    
}    

	
</script>
</head>
<body>
<form name="loginForm" action="/user/index.do" method="post" >
<div class="login">
<div class="boxIn"><table width="260" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="71">用户名：</th>
    <td width="189"><input type="text" name="username" id="username" class="txt" value=""/></td>
  </tr>
  <tr>
    <th>密&nbsp;&nbsp;&nbsp;&nbsp;码：</th>
    <td><input type="password" name="password" id="password" class="txt" value="" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center">
        <%--<input type="checkbox" id="anonymity" value=""><label for="anonymity">匿名登录</label>--%>
        <input name="" id="lgBtn" type="button" class="lgBtn" onClick="submitForm();" />
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center"><span class="err"></span></td>
    </tr>
</table>
</div>
<div class="copyright"><img src="/resource/images/copyright.gif" width="134" height="9" />Copyright</div>
</div>
</form>
</body>
</html>