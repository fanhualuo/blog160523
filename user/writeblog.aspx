<%@ Page Title="" Language="C#" MasterPageFile="~/master/Main2.master" AutoEventWireup="true" CodeFile="writeblog.aspx.cs" Inherits="user_writeblog" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


     <script type="text/javascript">

         document.title = '写博客';
         CKEDITOR.replace('ckeAContent');
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <asp:HiddenField  ID="Coverimg" runat="server"/>


    <h2 style="margin-bottom:20px;margin-top:30px;float:left;margin-left:20px"><a  href="writeblog.aspx">写博客</a></h2> 
    <div style="margin-bottom:15px;border:1px solid #808080;clear:both" ></div>


    <table cellpadding="5" cellspacing="5" style="clear:both">

        <tr>
            <td >标题*：</td>
            <td><asp:TextBox ID="tbTitle" runat="server" style=" font-size:15px;" MaxLength="27" Height="32px" Width="250px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbTitle"  ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>分类：</td>
            <td><asp:DropDownList ID="ddlCategoryID" runat="server" style=" font-size:15px;" Height="32px" Width="250px">
                
                </asp:DropDownList></td>
            <td></td>
        </tr>

         <tr>
            <td >标签：</td>
            <td><asp:TextBox ID="Keywords" runat="server" style=" font-size:15px;" Height="32px" Width="250px"></asp:TextBox></td>
            <td></td>
        </tr>

         <tr>
            <td>文章简介*：</td>
            <td><asp:TextBox ID="tbDescription" runat="server" style=" font-size:15px;" Height="32px" Width="250px"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbDescription"  ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>

        <tr>
             <td style=" font-size:15px;">封面：</td>
            <td>
               
                <input type="file" id="btnfile" name="btnfile" value="提交" />
 <input type="button" id="btn" value="上传" />
 <div id="divimg"></div>
                
            </td>
            <td></td>
        </tr>


        <tr>
            <td>正文：</td>
            <td>
               
                <asp:TextBox ID="ckeAContent" runat="server" TextMode="MultiLine" class="ckeditor"></asp:TextBox>
             
            </td>
            <td></td>
        </tr>

        <tr>
            <td></td>
            <td>
              <asp:Button ID="btnSubmit" runat="server" Text=" 保 存 " OnClick="btnSubmit_Click" style="color:#ffffff; background-color:#00b33b;  font-size:17px; margin:-2px;height:40px;width:96px;" Height="32px" Width="122px" /></td>
            <td></td>
        </tr>
        
    </table>

 
     

 

</asp:Content>

