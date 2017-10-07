<%@ Page Title="" Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="content.aspx.cs" Inherits="page_content1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        document.title="<%=article.Title1%>"


    </script>
    <h2 class="article_title" >
        <%=article.Title1%>
    </h2>
    <script src="../static/Script/jquery.js" type="text/javascript"></script>
    <div class="summary">
        发布时间：<span ><%=article.Createtime.ToString("yyyy-MM-dd HH:mm:ss ") %></span> 
             
    </div>
    <div class="article_content">
        <%=article.Acontent%>
    </div>
       
    <div class="comment">
        <div class="comment_form">
            <table>
                <tr>
                    <td style="width: 421px;">我要评论+</td>
                </tr>
                <tr>
                    <td>
                       <asp:TextBox ID="ccontent" TextMode="MultiLine" runat="server"></asp:TextBox>                     
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="pinglun" runat="server" class="commentsubmit" onclick="commentSubmit" Text="提交" Height="34px" Width="89px" />

                       
                        </td>
                    <td></td>
                </tr>
            </table>

        </div>

    </div>


    

    <asp:PlaceHolder ID="phCommentList" runat="server">


    <div class="commentlist">
        <table>
            <tr>
                <td>评论列表</td>
            </tr>
            <tr>
                <td>
                    <ul id="commentul">
                        <asp:Repeater ID="rpCommentList" runat="server">
                            <ItemTemplate>
                                <li><%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy-MM-dd HH:mm:ss ") %> &nbsp;&nbsp;<%#Eval("NickName") %>：<%#Eval("CContent") %></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                    </ul>

                </td>
            </tr>
        </table>
    </div>
    </asp:PlaceHolder>
    


</asp:Content>

