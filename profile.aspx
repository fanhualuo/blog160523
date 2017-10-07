<%@ Page Title="" Language="C#" MasterPageFile="~/master/user.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         
    
    <link type="text/css" href="<%=ResolveUrl("~/static/Style/profile.css") %>" rel="stylesheet" />
    <title>个人资料</title>


     <script type="text/javascript">

         document.title = '个人资料';

         $(function () {

             $("#file_upload").uploadify({
                 'auto': true,
                 'swf': '/static/Script/uploadify/uploadify.swf',
                 'uploader': 'Handler/UploadHandler.ashx',
                 'multi': false, //是否能选择多个文件
                 'queueID': 'fileQueue', //显示上传文件队列的元素id，可以简单用一个div来显示
                 'cancelImage': '/static/Script/uploadify/uploadify-cancel.png', //[必须设置]取消图片的路径
                 'buttonText': '上传头像', //上传按钮的文字
                 // 'buttonImage': '/js/uploadify/uploadify-cancel.png', //上传按钮的背景图片
                 //  'width': 100, //上传按钮的高和宽
                 // 'height': 30,
                 'removeCompleted': true,  //表示在上传完成后是否删除队列中的对应元素。默认是True，即上传完成后就看不到上传文件进度条了
                 "removeTimeout": "0", //表示上传完成后多久删除队列中的进度条，默认为3
                 "fileSizeLimit": "4096KB", //上传文件大小限制，默认单位是KB
                 "fileTypeExts": "*.jpg;*.gif;*.png", //指定允许上传的文件类型。默认*.*
                 "formData": { "folder_name": "UserHead" },
                 "onSelect": function () { //选择文件后触发
                     //禁用Uploadify
                     //$("#file_upload").uploadify("disable", true);
                 },
                 'overrideEvents': ['onSelectError', 'onDialogClose'], //屏蔽内部错误提示
                 'onFallback': function () { //检测FLASH失败调用
                     FunMsg("您未安装FLASH控件，无法上传！请安装FLASH控件后再试。");
                 },
                 "onSelectError": function (file, errorCode, errorMsg) {
                     //选择文件出错时触发，返回file,erroCode,errorMsg三个参数
                     $('#uploadstatus').html('上传失败！');

                     var settings = this.settings;
                     if (errorCode == -110) {
                         FunMsg("文件最大限制" + settings.fileSizeLimit);
                     }
                     if (errorCode == -130) {
                         FunMsg("图片格式只支持：*.jpg;*.gif;*.png");
                     }
                 },
                 "onUploadStart": function (file) {


                     //动态设置参数的值
                     //$("#file_upload").uploadify("settings", "formData", {"id":"1"});
                 },
                 "onUploadError": function (file, errorCode, erorMsg, errorString) {

                 },
                 "onUploadSuccess": function (file, data, response) {

                     //上传成功触发，data是用来接受从后台返回来的数值
                     $('#uploadstatus').html('上传成功！');
                     $('#imgurl').val(response.data);
                     //  data: { "name": $("#name").val() ;
                     $('#imgcontainer').html('<img style="width:180px;height:180px;" src="' + data + '" />');
                 }
             });

         });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        
        <div class="pro-bottom">

           <table class="table_1">
                <tr class="table_tr_2">
                    <td class="table_td_1">头像：</td>  

                    <td class="table_td_11">

                        <table>
                            <tr>
                                <td>
                                    
                                    <div id="imgcontainer"  style="width:180px;height:180px;">
                                        <img  alt="头像" style="width:180px;height:180px;" src="<%=c.Headimg %>" />
                           </div>
                                </td>

                                <td>
                                    <input  type="file" id="file_upload" name="file_upload"/>
                        <span id="uploadstatus">建议选择正方形图片</span>
                                </td>
                            </tr>
                        </table>

                    </td> 

                    
                    <td class="table_td_21">
                        

                    </td>
                </tr>

               <tr class="table_tr_1">
                    <td class="table_td_1">用户名：*</td>  <td class="table_td_12">
                      
                        <input class="table_td_12_1" readonly="readonly" name="loginid" type="text" value="<%=Session["loginid"] %>" style="width:290px;height:35px;display:block;"/>
                         
                    </td><td class="table_td_22"></td>
                </tr>

               <tr class="table_tr_1">
                    <td class="table_td_1">邮箱：</td>  <td class="table_td_12">
                     <asp:TextBox ID="email" class="table_td_12_1" Text="<%#c.Email %>"  style="width:290px;height:35px;" runat="server" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="email" ErrorMessage="*必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*邮箱格式错误" ControlToValidate="email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                    </td><td class="table_td_22"></td>
                </tr>

               <tr class="table_tr_1">
                    <td class="table_td_1">电话：</td>  <td class="table_td_12">
                        <asp:TextBox ID="phone" class="table_td_12_1" Text="<%#c.Phone %>"  style="width:290px;height:35px;" runat="server" />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="phone" Display="Dynamic" ErrorMessage="*必填" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*格式错误" ControlToValidate="phone" Display="Dynamic" ForeColor="Red" ValidationExpression="^1[3|4|5|7|8]\d{9}$" CssClass="yanzheng"></asp:RegularExpressionValidator>

                    </td><td class="table_td_22"></td>
                </tr>

               <tr class="table_tr_1">
                    <td class="table_td_1">年龄：</td>  
                   <td class="table_td_12">     
                        
                     <asp:TextBox ID="age" class="table_td_12_1" Text="<%#c.Age %>" style="width:290px;height:35px;" runat="server" />
                      <asp:RangeValidator style="line-height:60px;" ID="RangeValidator1" Display="Dynamic" ControlToValidate="age" Type="Integer" MinimumValue="0" MaximumValue="1000" runat="server" ForeColor="Red" ErrorMessage="*年龄不合法"></asp:RangeValidator>
                    </td>
                   
                   <td class="table_td_22"></td>
                </tr>


                <tr class="table_tr_1">
                    <td class="table_td_1">性别： </td>
                        <td class="table_td_12">
                        <asp:RadioButton ID="RadioButton0"  GroupName="sex" Text="女"  runat="server" />&nbsp;&nbsp;
                         <asp:RadioButton ID="RadioButton1"  GroupName="sex" Text="男"  runat="server"  />
                    
                        </td>
                    
                    
                    <td class="table_td_22"></td>
                </tr>



                <tr class="table_tr_3">
                    <td class="table_td_1">简介：</td>  <td class="table_td_13">
                        <textarea name="explain"  cols="20" rows="2" style=" font-size:15px;color:#787d82;width:398px;height:110px;resize: none;padding:4px;
        border: 1px solid #60a3ff;"><%=c.Explain %></textarea>
                    
                    </td><td class="table_td_22"></td>
                </tr>


               <tr class="table_tr_1">
                    <td class="table_td_1"></td>  <td class="table_td_12">
                        <asp:Button ID="Button1" runat="server" style="color:#ffffff;background-color:#00b33b;  font-size:17px; height:40px;width:96px;margin:-1px" Text="修改" OnClick="Button1_Click" />

                                                  </td><td class="table_td_22"></td>
               
               
               </tr>
                </table>
        </div>

    



     <script type="text/javascript" src="<%=ResolveUrl("~/Static/Script/ajaxupload.js") %>"></script>
    <script type="text/javascript" src="<%=ResolveUrl("~/Static/Script/Comm.js") %>"></script>

    <script type="text/javascript">
        var action = '<%=ResolveUrl("~/Handler/Upload.ashx")%>';
        upload('uploadbtn', 'uploadstatus', 'image', action, callback)
        function callback(file, response) {
            if (response.status) {
                $('#uploadstatus').html('上传成功！');
                $('#imgurl').val(response.imgurl);
                $('#imgcontainer').html('<img src="' + response.imgurl + '" />');

            }
        }
    </script>

</asp:Content>

