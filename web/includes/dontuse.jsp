<%-- 
    Document   : dontuse
    Created on : Sep 26, 2015, 3:17:05 AM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<list category name>
<!-- S: Filter -->
<div id="fillter" class="module categories">
    <form>	
        <!--S: all by category -->
        <div class="box">
            <h4 style="font-size: 20px">Danh mục sản phẩm</h4>
            <div class="content">
                <ul class="child-category">
                    <jsp:useBean id="categoryName" class="model.ProductProcess" scope="session"/>
                    <c:forEach var="i" items="${categoryName.listNameCategory}">
                        <li class="">
                            <a href="category.html" style="font-size: large">
                                ${i}
                            </a>
                        </li>  
                    </c:forEach>                           
                </ul>
            </div>
        </div>
        <!--E: all by category -->
    </form>
</div>
<!-- E: Filter -->