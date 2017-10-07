<%@ Page Title="" Language="C#" MasterPageFile="~/master/user.master" AutoEventWireup="true" CodeFile="password.aspx.cs" Inherits="user_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .pass_1{
    height:35px;
    font-size:14px;
    display:block;
    margin-top:20px;
    margin-bottom:20px;
}
        .pass_top{
              border-top:2px solid #808080;
        }

        .pass_1_1{
            text-align:right;
            width:260px;
            font-size:14px;
            font-weight: 600;
        }
        .pass_1_2{
            width:460px;
        }
        .pass_1_2 input{
            font-size:17px;
        }
 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        document.title = '修改密码';
    </script>

    <div class="pass_top">


    </div>
    <div class="pass_center">  
             
        <table style="width: 100%;">
            <tr class="pass_1">
                <td class="pass_1_1"><span>原始密码：</span></td>
                <td class="pass_1_2"> 
                    <asp:TextBox ID="pass0" runat="server"  Height="35px" MaxLength="20" TextMode="Password" placeholder="输入密码"  Width="290px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pass0" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>

            </tr>

            <tr class="pass_1">
                <td class="pass_1_1">   <span >新密码：</span></td>
                <td class="pass_1_2"> <asp:TextBox ID="pass1" runat="server"    Height="35px" MaxLength="20" TextMode="Password" placeholder="设置新登录密码"  Width="290px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass1" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>

            <tr class="pass_1">
                <td class="pass_1_1"><span >确认新密码：</span></td>
                <td class="pass_1_2">
                    <asp:TextBox ID="pass2" runat="server" Height="35px"  Width="290px"   placeholder="确认输入密码" MaxLength="20" TextMode="Password" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pass2" ErrorMessage="*请确认登录密码" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pass1" ControlToValidate="pass2" Display="Dynamic" ErrorMessage="*密码不一致" ForeColor="Red"></asp:CompareValidator>

                </td>
            </tr>

            <tr class="pass_1">
                <td class="pass_1_1">  </td>
                <td class="pass_1_2"> 
                    <asp:Button ID="Button1" runat="server" style="color:#ffffff;background-color:#00b33b;  font-size:17px; margin:-2px;height:40px;width:96px;" Text="修改" OnClick="Button1_Click" />
                </td>
            </tr>

            <tr class="pass_1">
                <td class="pass_1_1">  </td>
                <td class="pass_1_2"> 
                    <asp:Label ID="Label1" runat="server"  Text=""></asp:Label>
                </td>
            </tr>

        </table>
        
            


        

     </div>

   
    
</asp:Content>

