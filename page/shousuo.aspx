<%@ Page Title="" Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="shousuo.aspx.cs" Inherits="page_shousuo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        document.title = '搜索-'+"<%=Request["akey"]%>";
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

                        <a >标签:<%#Eval("KeyWords") %></a>

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
    </div> 
</asp:Content>


