<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="keywords" content="谢庆贺,fh博客,博客,繁华" />   <!--关键字搜索-->
    <meta name="author" content="谢庆贺,email：qinghe101@qq.com"/>  <!--作者-->
    <meta name="description" content="谢庆贺的个人博客"/>  <!--页面描述信息-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="static/Style/stylesheet.css" />
    <link rel="stylesheet" type="text/css" href="static/Style/login.css"/>
    <title >账号登陆</title>
    
     <style type="text/css">
    .code
    {
             background:url(static/image/);            
             color:blue;
             display:block;
             font-size:20px;                         
                         
             cursor:pointer;
             width:150px;
             height:60px;
             line-height:40px;
             text-align:center;

    }
    a
    {

        text-decoration:none;
        font-size:12px;
        color:#288bc4;
        }
    a:hover
    {
       text-decoration:underline;
        }
         .auto-style1 {
             clear: both;
             font-size: 17px;
         }
    </style>
    <script language="javascript" type="text/javascript">

        var code;
        function createCode() {
            code = "";
            var codeLength = 4; //验证码的长度
            var checkCode = document.getElementById("checkCode");
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',  'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
            for (var i = 0; i < codeLength; i++) {
                var charNum = Math.floor(Math.random() * 10);
                code += codeChars[charNum];
            }
            if (checkCode) {
                checkCode.className = "code";
                checkCode.innerHTML = code;
                document.getElementById("code1").value = code;
            }
        }   
     </script>                                                                                                                                        

</head>
<body onload="createCode()" >
    <form id="form1" runat="server">
        <div class="top">

        </div> 

        <div class="login">           

        <div class="log1">
              账号登录   
            </div>

        <div class="log2">
            <div class="log2_1">
                <asp:TextBox ID="loginid" runat="server" Height="35px"   placeholder="输入用户名/邮箱/手机号"    class="log2_1_1" Width="290px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="loginid" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>                
                </div>

            <div class="log2_1">
                 <asp:TextBox ID="pass" runat="server"   class="log2_1_1" Height="35px" TextMode="Password" placeholder="输入密码"  Width="290px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

            <div class="log2_1">
                
                <asp:TextBox ID="TextBox3" placeholder="输入验证码" class="log2_1_1" runat="server" Width="100px" ></asp:TextBox>
                <div style="position:relative;display:inline">
                    <img src="static/image/1.png" style="width:100%;position:absolute;z-index:999;height:55px;"/>
                    <asp:Label id="checkCode" runat="server" Height="35px" class="code"  Width="70px"  ReadOnly="True" ></asp:Label>              
                    
                </div>
                <a  href="#" onclick="createCode()">看不清楚换一下</a>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>


            </div>


            <div class="log2_3">
               
                 <a href="register.aspx" >还没有账号？立即注册 </a>
                </div>

            <div class="log2_4">
                <asp:Button ID="Button1" class="log2_4_1" runat="server"  Width="290px" Text="登    录" OnClick="Button1_Click1"   />                                     
                </div>
            <div class="log2_2">
                <asp:Label ID="Label1"   runat="server" ForeColor="Red"></asp:Label>   
            </div>
            </div>
            

        <div class="log3">
              
            </div>

        <div class="log4">                         
                
            </div>
       </div>               
      	   <asp:HiddenField ID="code1"  runat=Server /> 
	
    </form>
</body>
</html>
