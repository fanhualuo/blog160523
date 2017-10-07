<%@ Control Language="C#" AutoEventWireup="true" CodeFile="right2.ascx.cs" Inherits="master_right2" %>


<div class="right">
    <div class="right_title icon icon9">站内搜索</div>
    <div class="right_content">
        <input type="text"  class="searchbox" id="searchbox" />
        <input type="button" value="搜索" class="searchbtn" onclick="search()" />
        <script type="text/javascript">
            window.onkeypress = function () {
                if (event.keyCode == 10) {
                    return false;
                }
            }
            function search() {
                var keyword = $('#searchbox').val();
                if (keyword != null&&keyword!='') {
                    document.location = '<%=ResolveUrl("~/page/shousuo.aspx?akey=")%>' + encodeURI(keyword);
                }
                
            }
        </script>


        </div>
    
        <div>

        </div>
        
    <div class="right_title icon icon1">文章分类</div>
    <div class="right_content">

        <asp:Repeater ID="fenlei" runat="server">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li><a href="<%#ResolveUrl("~/index.aspx?CategoryID="+Eval("CategoryID"))%>" ><%#Eval("CategoryName") %>(<%#Eval("acount") %>)</a></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>

    <div class="right_title icon icon2">标签</div>
    <div class="right_content">

        <asp:Repeater ID="biaoqian" runat="server">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li><a href="<%#ResolveUrl("~/page/shousuo.aspx?akey="+Eval("name"))%>" ><%#Eval("name") %>(<%#Eval("keycount") %>)</a></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>

    <div class="right_title icon icon4">文章推荐</div>
    <div class="right_content">
        <asp:Repeater ID="rpArticles" runat="server">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li> <a href="<%#ResolveUrl("~/Page/content.aspx?id="+Eval("ArticleID")) %>"><%#Eval("Title") %>(阅读：<%#Eval("ReadCount") %>次)</a></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    
</div>

