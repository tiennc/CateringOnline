<%-- 
    Document   : Home.jsp
    Created on : Sep 25, 2015, 1:49:28 AM
    Author     : Windows 10
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

        <!--S:header-->
        <div id="hfHeader" style="background: none">
            <div class="container" style="height: 375px; background-color: #088">			


            </div>
        </div>
        <!--E:header-->
        <!--S:mainbody-->
        <div id="mainwrapper">
            <!--S: maintop -->
            <div id="maintop" class="container">

            </div>
            <!--E: maintop -->
            <!--S: mainbody -->
            <div id="mainbody" class="container">
                <!--S:maincontent -->
                <section id="maincontent" class="hasSidebar">
                    <!--S:hot menu-->
                    <div id="hotcategory" class="module">
                        <h3 class="title"><span>Thực đơn nổi bật</span></h3>
                        <div class="module_content hotcategory">
                            <ul class="col4">
                                <c:forEach var="i" begin="0" end="15">
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
                            <a href="HotMenu.jsp"> Xem toàn bộ danh mục </a>
                        </div>
                    </div>
                    <!--E:hot menu-->

                    <!--S:hot caterer-->
                    <div id="hotcategory" class="module">
                        <h3 class="title"><span>Cửa hàng nổi bật</span></h3>
                        <div class="module_content hotcategory">
                            <ul class="col4">
                                <c:forEach begin="0" end="15">
                                    <li>
                                        <a href="categories.html" class="cover_category iconcat1"></a>
                                        <a class="name_category" href="categories.html">Điện thoại, máy tính bảng</a>
                                    </li>  
                                </c:forEach>				
                            </ul>
                        </div>
                        <div class="module_footer hotcategory">
                            <a href="HotCaterer.jsp"> Xem toàn bộ danh mục </a>
                        </div>
                    </div>
                    <!--E:hot caterer-->

                    <!--S:news-->
                    <div id="news" class="module">
                        <h3 class="title">
                            <span>Tin tức thị trường</span>
                            <ul class="commontools">
                                <li><a href="news.html">Xem thêm <i class="fa fa-caret-right"></i></a></li>
                            </ul>
                        </h3>
                        <div class="module_content news">
                            <!-- S: bignews -->
                            <div class="bignews">
                                <div class="image-news">
                                    <a href="news-details.html">
                                        <img src="samples/news/1.jpg">
                                    </a>
                                </div>
                                <div class="info-news">
                                    <a class="title-news" href="news-details.html">Apple có thể phát hành ba mẫu iPhone mới trong năm nay</a>
                                    <div class="extra-news">
                                        <ul>
                                            <li class="timepost">Thứ 6, 29/3/2015</li>
                                            <li class="view">3000</li>
                                        </ul>
                                    </div>								
                                    <div class="descreption-news">
                                        <a href="news-details.html">
                                            Nguồn tin của trang DigiTimes (Đài Loan) cho biết, Apple sẽ giới thiệu tới 3 mẫu iPhone trong nửa cuối năm 2015. Tên gọi dự đoán của các sản phẩm là iPhone 6S, iPhone 6S Plus và iPhone 6C, mẫu smartphone hứa hẹn có giá bán tốt...
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- E: bignews -->
                            <!-- S: normalnews -->
                            <div class="normalnews">
                                <ul class="col4">
                                    <!-- S: normal item news -->
                                    <li class="news">
                                        <a class="image-news" href="news-details.html">
                                            <img src="samples/news/2.jpg">
                                        </a>
                                        <a class="title-news">03GEN f concept thiết kế tương lai của Yamaha</a>
                                    </li>
                                    <!-- E: normal item news -->
                                    <!-- S: normal item news -->
                                    <li class="news">
                                        <a class="image-news" href="news-details.html">
                                            <img src="samples/news/3.jpg">
                                        </a>
                                        <a class="title-news">Những bí kíp cần thuộc làu khi mặc áo sơ mi kẻ</a>
                                    </li>
                                    <!-- E: normal item news -->
                                    <!-- S: normal item news -->
                                    <li class="news">
                                        <a class="image-news" href="news-details.html">
                                            <img src="samples/news/4.jpg">
                                        </a>
                                        <a class="title-news">10 món đồ nâng tầm đẳng cấp trang phục</a>
                                    </li>
                                    <!-- E: normal item news -->
                                    <!-- S: normal item news -->
                                    <li class="news">
                                        <a class="image-news" href="news-details.html">
                                            <img src="samples/news/5.jpg">
                                        </a>
                                        <a class="title-news">Mùa hè của nữ công sở mê sơ mi trắng</a>
                                    </li>
                                    <!-- E: normal item news -->
                                </ul>
                            </div>
                            <!-- E: normalnews -->
                        </div>
                    </div>				
                    <!--E:news-->
                </section>
                <!--E:maincontent -->

                <!--S:sidebar -->
                <aside id="sidebar" class="w200">
                    <div class="list-group">
                        <a href="#" class="list-group-item active" style="background-color: #EA7373;">
                            <h4>Danh mục thực đơn</h4>
                        </a>
                        <c:forEach var="i" items="${categoryName.listNameCategory}">
                            <a href="#" class="list-group-item" style="height: 100px">
                                <img src="https://wgom.org/wp-content/uploads/2015/02/active-tag-happy-birthday-HBD16.png" style="height: 60px; width: auto"><br/>
                                ${i}</a>
                        </c:forEach>    
                    </div>
                </aside>
                <!--E:sidebar -->


            </div>
            <!--E: mainbody -->
            <!--S: mainbottom -->
            <div id="mainbottom" class="container">
                <!-- S:advbottom -->
                <div class="advtop">

                </div>
                <!-- E:advtop -->			
            </div>
            <!--E: mainbottom -->
        </div>
        <!--E:mainbody-->

        <!--S:footer-->
        <jsp:include page="includes/footer.jsp" flush="true" />
        <!--E:footer-->



    </body>
</html>
