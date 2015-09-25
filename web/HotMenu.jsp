<%-- 
    Document   : HotMenu
    Created on : Sep 25, 2015, 7:41:46 AM
    Author     : Windows 10
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="images/favicon.ico">

        <title>Home - bancangi</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="css/slider.css" rel="stylesheet">

        <!-- thegioinguoidep core CSS -->
        <link href="css/bcg.css" rel="stylesheet">

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-slider.js"></script>

        <!-- thegioinguoidep core JS -->
        <script src="js/bcg.js"></script>    

    </head>

    <jsp:include page="includes/login_register.jsp" flush="true"/>

    <body>

        <!--S:top header-->
        <jsp:include page="includes/header.jsp" flush="true" />
        <!--E:top header-->

        <!--S:mainbody-->
        <div id="mainwrapper">

            <!--S: mainbody -->
            <div id="mainbody" class="container" style="margin-top: 20px">
                <!--S:maincontent -->
                <section id="maincontent" class="hasSidebar" style="width: 100%">
                    <!--S:hot category-->
                    <div id="hotcategory" class="module">
                        <h3 class="title"><span>Thực đơn nổi bật</span></h3>
                        <div class="module_content hotcategory">
                            <ul class="col4">
                                <c:forEach var="i" begin="0" end="31">
                                    <li>
                                        <a href="HotMenu.jsp" class="cover_category">
                                            <div style="margin: auto; height: 100%">
                                                <img style="height: 100%; width: 100%" src="images/bgcategory/anchoigiaitri.jpg">
                                            </div>
                                        </a>
                                        <a class="name_category" href="categories.html">Thực đơn ${i}</a>
                                    </li>	
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="module_footer hotcategory">
                            <a href="allcategories.html"> Xem toàn bộ danh mục </a>
                        </div>
                    </div>
                    <!--E:hot category-->

                    <!--S:news-->

                    <!--E:news-->
                </section>
                <!--E:maincontent -->

                <!--S:sidebar -->

                <!--E:sidebar -->
            </div>
            <!--E: mainbody -->
            <!--S: mainbottom -->

            <!--E: mainbottom -->
        </div>
        <!--E:mainbody-->

        <!--S:footer-->
        <jsp:include page="includes/footer.jsp" flush="true" />
        <!--E:footer-->


    </body>
</html>
