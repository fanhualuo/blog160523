<%@ Page Title="" Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        document.title = '博客-主页';
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="news">
        <asp:Repeater ID="rpNews" runat="server">
            <ItemTemplate>
                <div class="news_li">
                    <h2 class="top"><a href="<%#ResolveUrl("~/page/content.aspx?id="+Eval("ArticleID"))%>"><%#Eval("Title") %></a></h2>

                    <div class="count">
                        <a href="<%#ResolveUrl("~/index.aspx?CategoryID=")+Eval("CategoryID") %>">分类：<%#Eval("CategoryName") %></a>                        

                        <a href="<%#ResolveUrl("~/Page/content.aspx?id="+Eval("ArticleID")) %>">浏览:<%#Eval("ReadCount") %>次</a>

                        <a >作者:<%#Eval("LoginID") %></a>
                    </div>


                    <div class="date"><%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy-MM-dd  HH:mm:ss") %></div>
                    <div class="description">
                        <%#(Eval("CoverImg")==null||Eval("CoverImg")==string.Empty)?string.Empty:"<div class=\"coverimg\"><img src=\""+Eval("CoverImg")+"\" /></div>" %>
                        
                        <div <%#(Eval("CoverImg")==null||Eval("CoverImg")==string.Empty)?string.Empty:"class=\"descriptiontxt\"" %> >
                            <p><%#Eval("Description") %></p>
                            
                        </div>
                        <div style="clear:both"></div> 
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        
        <table class="auto-style6">
            <tr>
                <td class="auto-style7" style="text-align: right;color:#000">
                    第<asp:Label ID="Label5" runat="server"></asp:Label>页
                    &nbsp;&nbsp;
                    共<asp:Label ID="Label1" runat="server" ></asp:Label>页 &nbsp;&nbsp;
                </td>
                <td >
                    <asp:LinkButton ID="LinkButton1" style="color:#555;" runat="server" OnClick="LinkButton1_Click">首页</asp:LinkButton>
                &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" style="color:#555" runat="server" OnClick="LinkButton2_Click">上一页</asp:LinkButton>
&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton3" style="color:#555" runat="server" OnClick="LinkButton3_Click">下一页</asp:LinkButton>
&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton4" style="color:#555" runat="server" OnClick="LinkButton4_Click">尾页</asp:LinkButton>
                </td>
            </tr>
        </table>

         <asp:Label ID="Label6" runat="server"></asp:Label>

    </div> 
</asp:Content>

