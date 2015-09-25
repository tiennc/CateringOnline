<%-- 
    Document   : Menu
    Created on : Sep 25, 2015, 7:59:32 AM
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

        <title>Menu - bancangi</title>

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

        <!-- Slide CSS -->
        <link rel="stylesheet" href="css/slide/demo.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/slide/flexslider.css" type="text/css" media="screen" />

        <!-- Modernizr -->
        <script src="css/slide/modernizr.js"></script>

        <!-- FlexSlider -->
        <script defer src="css/slide/jquery.flexslider.js"></script>

        <!-- ItemPreview css-->
        <link rel="stylesheet" href="css/itempreview/example.css" />

    </head>

    <jsp:include page="includes/login_register.jsp" flush="true"/>

    <body>

        <!--S:top header-->
        <jsp:include page="includes/header.jsp" flush="true" />
        <!--E:top header-->

        <!--S:mainbody-->
        <div id="mainwrapper" style="margin: 40px 0 0 0;">

            <!--S: maintop -->
            <!--E: maintop -->

            <!--S: mainbody -->
            <div id="mainbody" class="container">
                <!--S:maincontent -->
                <section id="maincontent" class="hasSidebar hasW200" style="width: 65%">
                    <!--S:categories-->
                    <div id="categories" class="module">
                        <h3 class="title">
                            <span>Thực đơn của bạn</span>
                            <ul class="commontools">
                                <li class="author"><a href="member.html">Ngọc Trinh</a></li>
                                <li class="timepost"><a>Thứ 6, 29/3/2015</a></li>
                            </ul>
                        </h3>
                        <div class="module_content itemdetails">

                            <!--S:Image Item-->

                            <section class="slider">

                                <div id="slider" class="flexslider">
                                    <ul class="slides">                                 
                                        <c:forEach var="i" begin="1" end="12" >
                                            <li>
                                                <img src="images/bgcategory/dienmay.jpg" />
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div id="carousel" class="flexslider">
                                    <ul class="slides">
                                        <c:forEach var="i" begin="1" end="12">
                                            <li>
                                                <img src="images/bgcategory/dienmay.jpg" />
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </section>

                            <!--E:Image Item-->

                            <!--S: social sharing-->
                            <div class="box socialshare">
                                <!-- Go to www.addthis.com/dashboard to customize your tools -->
                                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-51fb1dcd68d4a79c" async="async"></script>
                                <!-- Go to www.addthis.com/dashboard to customize your tools -->
                                <div class="addthis_native_toolbox"></div>
                            </div>
                            <!--E: social sharing-->

                            <div>
                                <h2>Danh sách món ăn</h2>
                                <div>

                                    <ul class="gallery-items">
                                        <c:forEach var="i" begin="0" end="10">
                                            <li class="gallery-item">
                                                <div class="gallery-contents">
                                                    <div class="thumbnail gallery-trigger"><img style="margin-top: -50px" src="images/bgcategory/anchoigiaitri.jpg" alt="" /></div>
                                                    <div class="title"></div>
                                                </div>
                                                <div class="gallery-expander" style="width: 60%; margin-left: 40px">
                                                    <div class="gallery-expander-contents">
                                                        <div class="gallery-trigger-close close">Close</div>
                                                        <div class="col">
                                                            <div class="image"><img src="images/bgcategory/anchoigiaitri.jpg" alt="" /></div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="title"></div>
                                                            <div class="contents">Giá:  </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                            <!--S: Comment Item -->
                            <div class="box product-comment">
                                <div class="fb-comments" data-href="http://developers.facebook.com/docs/plugins/comments/" data-width="100%" data-numposts="1" data-colorscheme="light"></div>
                            </div>
                            <!--E: Comment Item -->
                        </div>					
                    </div>				
                    <!--E:categories-->
                </section>
                <!--E:maincontent -->
                <!--S:sidebar -->
                <aside id="sidebar" class="w200" style="width: 30%">
                    <!--S:more info item -->
                    <div id="extraInfoItem" class="module extraInfo">
                        <!--S:Infomation-->
                        <div class="box itemPrice" style="margin-bottom: 20px">	
                            <form>
                                <div class="content">
                                    <div class="price">Thông tin thực đơn</div>
                                    <div class="box product-description">
                                        <p>
                                            Thực đơn dành cho các bác nông dân code nhiều quá sức cần năng lượng để code tiếp
                                        </p>
                                    </div>					
                                </div>							
                            </form>					
                        </div>
                        <!--E:Infomation-->
                        <!--S: neednow -->
                        <div class="box itemPrice">	
                            <form>
                                <div class="content">
                                    <div class="price">300K</div>
                                    <div class="form-group">
                                        <select class="form-control">
                                            <option>Lựa chọn thuộc tính</option>
                                            <option>Xanh</option>
                                            <option>Đỏ</option>
                                            <option>Tím</option>
                                            <option>Vàng</option>								  
                                        </select>
                                    </div>	
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-warning btnNeedNow">Cần ngay</button>
                                    </div>					
                                </div>							
                            </form>					
                        </div>
                        <!--E: neednow -->
                        <!--S: othertools -->
                        <div class="box itemTools">
                            <div class="content">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-default btnLove">Yêu luôn</button>
                                </div>	
                                <div class="form-group">
                                    <button type="submit" class="btn btn-default btnNeedLater">Cần sau</button>
                                </div>	
                                <div id="totalTools">
                                    <ul class="totaltools">
                                        <li>2000 <span class="desc">người yêu luôn</span></li>
                                        <li>30 <span class="desc">người cần sau</span></li>									
                                    </ul>
                                </div>							
                            </div>
                        </div>
                        <!--E: othertools -->
                    </div>
                    <!--E:more info item -->
                    <!--S: more from author-->
                    <div id="morefromauthor" class="box itemMore">
                        <h4>Sản phẩm khác từ cửa hàng</h4>
                        <div class="content">
                            <ul id="itemslist" class="col1">
                                <c:forEach begin="1" end="4">
                                    <!--S: item product -->
                                    <li class="itemproduct" data-id="1">
                                        <!--S: item tag -->
                                        <div class="tag-wrapper">
                                            <span class="new tag">Mới cóng</span>
                                        </div>
                                        <!--E: item tag -->
                                        <!--S: image link -->
                                        <div class="image-link" style="height: 180px">
                                            <a href="item.html" title="item.html">
                                                <img src="samples/products/thumb/1.jpg">
                                            </a>
                                        </div>
                                        <!--E: image link -->
                                        <!--S: title and info -->
                                        <div class="tile-bottom">
                                            <div class="product-info">
                                                <a class="product-link" href="item.html" title="item.html">Hàng hè 2015 Mới về</a>
                                            </div>
                                        </div>
                                        <!--E: title and info -->
                                    </li>
                                    <!--E: item product -->
                                </c:forEach>
                            </ul>		
                        </div>			
                    </div>
                    <!--E: more from author-->		
                </aside>
                <!--E:sidebar -->
            </div>
            <!--E: mainbody -->
            <!--S: mainbottom -->
            <div id="mainbottom" class="container">
                <!-- S:similar -->
                <div id="similarItem" class="module">
                    <h3 class="title">
                        <span>Sản phầm tương tự</span>
                    </h3>
                    <div class="module_content categories">
                        <ul id="itemslist" class="col4">
                            <c:forEach begin="1" end="8">
                                <!--S: item product -->
                                <li class="itemproduct" data-id="1">
                                    <!--S: item tag -->
                                    <div class="tag-wrapper">
                                        <span class="new tag">Mới cóng</span>
                                    </div>
                                    <!--E: item tag -->
                                    <!--S: image link -->
                                    <div class="image-link">
                                        <a href="item.html" title="item.html">
                                            <img src="samples/products/thumb/1.jpg">
                                        </a>
                                        <a class="small-need-button" data-view="1" data-action="neednow">Cần ngay</a>
                                        <a class="add-to-list-button" data-view="1" data-action="needlater">Cần sau</a>
                                    </div>
                                    <!--E: image link -->
                                    <!--S: title and info -->
                                    <div class="tile-bottom">
                                        <div class="product-info">
                                            <a class="product-link" href="item.html" title="item.html">Hàng hè 2015 Mới về</a>
                                            <div class="product-details">
                                                <a class="product-catname" href="category.html">Thời trang nữ</a>
                                                <span class="price">300K</span>
                                            </div>
                                        </div>
                                        <div class="extra-info">
                                            <ul class="product-tile-fans fan-3">
                                                <li class="fan-0">
                                                    <span class="name-fan">
                                                        <span>
                                                            <a href="member.html" title="Trinh">Trinh</a>															
                                                        </span>
                                                    </span>
                                                    <a class="small rounded avatar">
                                                        <img width="43" height="43" src="samples/members/thumb/1.jpg" alt="Trinh">
                                                    </a>
                                                </li>
                                                <li class="fan-1">
                                                    <span class="name-fan">
                                                        <span>
                                                            <a href="member.html" title="Ngọc Bưởi">Ngọc Bưởi</a>															
                                                        </span>
                                                    </span>
                                                    <a class="small rounded avatar">
                                                        <img width="43" height="43" src="samples/members/thumb/2.jpg" alt="Ngọc Bưởi">
                                                    </a>											
                                                </li>
                                                <li class="fan-2">
                                                    <span class="name-fan">
                                                        <span>
                                                            <a href="member.html" title="Phượng ớt">Phượng ớt</a>															
                                                        </span>
                                                    </span>
                                                    <a class="small rounded avatar">
                                                        <img width="43" height="43" src="samples/members/thumb/3.jpg" alt="Phượng ớt">
                                                    </a>
                                                </li>
                                            </ul>
                                            <span class="extra-description">
                                                <a href="member.html">Trinh</a> & 2000 người khác
                                            </span>
                                        </div>
                                    </div>
                                    <!--E: title and info -->
                                </li>
                                <!--E: item product -->
                            </c:forEach>
                        </ul>															
                    </div>
                </div>
                <!-- E:similar -->
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

        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&appId=214942748525859&version=v2.3";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>	

        <!--S:JS slide-->
        <!-- jQuery -->
        <!--        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>-->
        <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>

        <!--         FlexSlider 
                <script defer src="css/slide/jquery.flexslider.js"></script>-->

        <script type="text/javascript">
            $(function () {
                SyntaxHighlighter.all();
            });
            $(window).load(function () {
                $('#carousel').flexslider({
                    animation: "slide",
                    controlNav: false,
                    animationLoop: false,
                    slideshow: false,
                    itemWidth: 210,
                    itemMargin: 5,
                    asNavFor: '#slider'
                });

                $('#slider').flexslider({
                    animation: "slide",
                    controlNav: false,
                    animationLoop: false,
                    slideshow: false,
                    sync: "#carousel",
                    start: function (slider) {
                        $('body').removeClass('loading');
                    }
                });
            });
        </script>
        <!--E:JS slide-->


        <!--S:JS item preview-->
        <!-- Item preview js-->
        <script src="js/itempreview/jquery.imagelistexpander.js"></script> 
        <script>
            (function (global, $) {
                $('.gallery-items').imagelistexpander({
                    prefix: "gallery-"
                });
            })(this, jQuery)
        </script>
        <!--E:JS item preview-->


    </body>
</html>
