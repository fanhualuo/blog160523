<%@ Page Title="" Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true"   EnableViewState="false"  CodeFile="myblog.aspx.cs" Inherits="user_myblog" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .TextBox
        {
             margin:30px;
            border-right: #ffffff 0px solid;
            border-top: #ffffff 0px solid;
            font-size: 9pt;
            border-left: #ffffff 0px solid;
            border-bottom: #c0c0c0 1px solid;
            background-color: #ffffff;
        }
        table.gridview_m
        {
            border-collapse: collapse;
            margin:30px;
            width: 98%;
            font-size: 14px;
        }
        table.gridview_m td, th
        {
            border-collapse: collapse;
           
             font-size: 14px;
        }
        table.gridview_m1
        {
            border-collapse: collapse;
          
            width: 98%;
             font-size: 14px;
        }
        table.gridview_m1 td1, th1
        {
            border-collapse: collapse;
           
             font-size: 14px;
        }
        table.gridview_m1 a
        {
           color: #105cb6;
        }
         table.gridview_m1 a:hover
        {
           color:#d9534f;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h2 style="margin-bottom:20px;margin-top:10px;margin-left:10px;float:left"><a  href="myblog.aspx">我的博客</a></h2>    
    
    <div style="margin-bottom:15px;border:1px solid #808080;clear:both" ></div>
    <!--<span id="sec" style="float:left;font-size:18px;color:#1e8449;padding-left:40px"><%=Request.QueryString["jieguo"] %> </span>-->
   <script type="text/javascript">

       document.title = '我的博客';
       $(function () {
           var time = $('#sec').html();
           var interval = setInterval(function () {
               --time;
               $('#sec').html(time);
               if (time <= 0) {
                   $('#text').hide();
                   clearInterval(interval);
               }
           }, 2000);
       });
</script>
               
         <asp:GridView  ID="GridView1" onrowdeleting="GridView1_RowDeleting"  ShowFooter="True" CssClass="gridview_m1"  ShowHeader="false" runat="server" AutoGenerateColumns="False"  GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>

                <asp:BoundField DataField="ArticleID" HeaderText="编号"  />
                <asp:HyperLinkField DataNavigateUrlFields="ArticleID" DataNavigateUrlFormatString="~/Page/content.aspx?id={0}"  DataTextField="title" HeaderText="标题" Text="删除" />  
                <asp:BoundField DataField="CreateTime"  HeaderText="时间"  />
                    
                
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClientClick="return confirm('确定要删除吗？')"   CommandName="Delete" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                    

            </Columns>
               

               
        </asp:GridView>

</asp:Content>

