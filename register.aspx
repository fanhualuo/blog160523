<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="keywords" content="谢庆贺,fh博客,博客,繁华" />   <!--关键字搜索-->
<meta name="author" content="谢庆贺,email：qinghe101@qq.com"/>  <!--作者-->
<meta name="description" content="谢庆贺的个人博客"/>  <!--页面描述信息-->
    <link rel="stylesheet" type="text/css" href="static/Style/stylesheet.css" />
    <link rel="stylesheet" type="text/css" href="static/Style/register.css"/>
    <title >注册用户</title>
    
     <style type="text/css">
    .code
    {
                   
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
         </style>
    <script language="javascript" type="text/javascript">

        function code(source, args) {
            var str = args.Value;
            if (str!=code) {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }

        var code;
        function createCode() {
            code = "";
            var codeLength = 4; //验证码的长度
            var checkCode = document.getElementById("checkCode");
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
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
              账号注册 
            </div>

        <div class="log2">
            
            <div class="log2_1">
                <asp:Label runat="server" Width="80px" style="text-align:right;">用户名&nbsp;</asp:Label><asp:TextBox ID="loginid" runat="server" Height="35px"   placeholder="设置自己的用户名"  MaxLength="20"   class="log2_1_1" Width="310px" ></asp:TextBox>
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="loginid" Display="Dynamic" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>                
                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="loginid" Display="Dynamic" ErrorMessage="*此用户名已经注册" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                </div>
            <div class="log2_1">
               
                 <asp:Label runat="server" Width="80px" style="text-align:right;">密码&nbsp;</asp:Label><asp:TextBox ID="pass1" runat="server"   class="log2_1_1" Height="35px" MaxLength="20" TextMode="Password" placeholder="设置登录密码"  Width="310px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass1" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                

            </div>


            <div class="log2_1">
                  <asp:Label runat="server" Width="80px" style="text-align:right;">确认密码&nbsp;</asp:Label><asp:TextBox ID="pass2" runat="server" Height="35px"  Width="310px" class="log2_1_1"  placeholder="确认输入密码" MaxLength="20" TextMode="Password" ></asp:TextBox>
                

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pass2" ErrorMessage="*请确认登录密码" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pass1" ControlToValidate="pass2" Display="Dynamic" ErrorMessage="*密码不一致" ForeColor="Red"></asp:CompareValidator>
                </div>


            
            <div class="log2_3">
               
                <asp:Label runat="server" Width="80px" style="text-align:right;">验证码&nbsp;</asp:Label><asp:TextBox ID="TextBox3" placeholder="输入验证码" class="log2_2_1" Height="35px" runat="server" Width="100px" ></asp:TextBox>
                
                <div style="position:relative;display:inline">
                    <img src="static/image/1.png" style="width:100%;position:absolute;z-index:999;height:55px;"/>
                    <asp:Label id="checkCode" runat="server" Height="35px" class="code"  Width="70px"  ReadOnly="True" ></asp:Label>              
                    
                </div>
                <a  href="#" onclick="createCode()">看不清楚换一下</a>
                
              

                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="*请输入验证码" ForeColor="Red"></asp:RequiredFieldValidator>

                

            </div>
            <div class="log2_4">
                <asp:Button ID="Button1"  class="log2_4_1" runat="server"  Width="310px" Text="注     册" OnClick="Button1_Click"    />
                   
                     
                </div>
            <div class="log2_5">
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

