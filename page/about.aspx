<%@ Page Title="" Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="page_about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .about_center{
            
        }
        .about_center h1{
            text-align:center;
            font-weight:bold;
            font-size:19px;
        }

        .about_center h2{
            margin-top:10px;
            margin-bottom:5px;
            font-size:17px;
            font-weight:bold;
        }
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        document.title = '关于本站';
    </script>
    <div class="about_center">
        <h1 >关于&留言</h1>
        <br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本站使用.net技术开发的多人博客系统（主要自己使用），借鉴参考绿叶博客系统界面。如果出现使用bug问题请联系<a href="http://www.xieqinghe.cn/index.html">我</a>，非常感谢！<br/><br/>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;主要用来记录我的学习积累，经验分享，以及个人成长经历的博客。<br/><br/>



        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;qq：1301817765<br/><br/>

       

        
           </div>
   
</asp:Content>

