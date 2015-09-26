<%-- 
    Document   : header
    Created on : Sep 25, 2015, 2:49:25 AM
    Author     : Windows 10
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--S:top-->
<div id="hfTop">
    <div class="container">
        <!--S:logo-->
        <logo class="hfLogo">
            <a id="hfLogo" href="Home.jsp" alt="BANCANGI.COM">
                Bạn cần gì?
            </a>
        </logo>	
        <!--E:logo-->
        <!--S:MobileMeu button-->
        <div id="hfMobileMenu">
            <i class="fa fa-bars"></i>
        </div>
        <!--E:MobileMenu button-->	
        <!--S:MobileMenu Write Item-->	
        <div id="hfMobileCreate">
            <i class="fa fa-pencil"></i>
        </div>	
        <!--E:MobileMenu Write Item-->		
        <!--S:Mobilelocation -->
        <div class="hflocation mobile">
            <ul>
                <li>
                    <a class="current">Hà Nội</a>				
                </li>
            </ul>
        </div>
        <!--E:Mobilelocation -->			
        <!--S:menu-->	
        <div id="hfMainMenu" style="width: 52%">
            <nav id="hfExtraMenu" class="hfMenu">
                <ul class="hfmenu">

                    <!-- S:location -->
                    <div class="hflocation" style="float: left;margin: 4px 0 0 0px; height: 40px">
                        <ul>
                            <li>
                                <a class="current">Hà Nội</a>
                                <!-- S:location child-->
                                <div class="subcategories">
                                    <div class="dropdown-caret">
                                        <span class="caret-outer"></span>
                                        <span class="caret-inner"></span>
                                    </div>
                                    <ul>
                                        <li class="">
                                            <a>TP.HCM</a>
                                        </li>
                                        <li class="">
                                            <a>Đà Nẵng</a>
                                        </li>
                                        <li class="">
                                            <a>Hải Phòng</a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- E:location child-->					
                            </li>
                        </ul>
                    </div>
                    <!-- E:location -->

                    <!-- S:search -->
                    <div class="hfsearch" style="width: 64%; margin: 0 0 0 0">
                        <form>
                            <div class="form-group">
                                <input style="border-radius: 20px; height: 40px; line-height: normal; margin: 4px 0 0 0" type="text" placeholder="Bạn cần gì hôm nay?" class="form-control hfSearch keyword">
                            </div>
                        </form>
                    </div>
                    <!-- E:search -->	
                </ul>
            </nav>
        </div>	
        <!--E:menu-->
        <!--S:membertools-->	
        <div id="hfMemberTools">
            <ul class="hfmenu">
                <li>
                    <a href="about.html" title="about us" class="hfcollapse">Giới thiệu</a>
                    <!--S:subcategories-->
                    <div class="subcategories">
                        <ul>
                            <li class="">
                                <a href="about.html" title="about.html">Về chúng tôi</a>
                            </li>	
                            <li class="">
                                <a href="about-common.html" title="about-common.html">Quy định</a>
                            </li>	
                            <li class="">
                                <a href="about-common.html" title="about-common.html">Quy chế</a>
                            </li>	
                            <li class="">
                                <a href="about-common.html" title="about-common.html">Tuyển dụng</a>
                            </li>	
                            <li class="">
                                <a href="help.html" title="help.html">Hướng dẫn sử dụng</a>
                            </li>	
                            <li class="">
                                <a href="about-common.html" title="about-common.html">Liên hệ quảng cáo</a>
                            </li>	
                            <c:if test="${not empty sessionScope.login}">
                                <li class="">
                                    <a href="UserServlet?ac=logout" title="logout">Đăng xuất</a>
                                </li>
                            </c:if>                          
                        </ul>
                    </div>
                    <!--E:subcategories-->		 			
                </li>


                <c:choose>
                    <c:when test="${not empty sessionScope.login}">
                        <!-- Thong tin member -->
                        <span style="color: #fff;line-height: 50px">Xin chào ${sessionScope.login}</span>
                        <li>
                            <a class="member" href="" title="" id="dropdownMenuMember" aria-expanded="false" data-toggle="dropdown">
                                <span class="tiny rounded avatar">
                                    <img width="40" height="40" alt="" src="images/avatar/default/avatarDefault.jpg">
                                </span>
                            </a>                                                         
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a title="login" data-toggle="modal" data-target="#LogModal">Đăng nhập</a>
                        </li>			 					 	
                        <li>
                            <a title="sign up" data-toggle="modal" data-target="#RegModal">Đăng ký</a>
                        </li> 
                    </c:otherwise>
                </c:choose>  
            </ul>				
        </div>	
        <!--E:membertools-->					
    </div>
</div>
<!--E:top-->
<!--S: mobile menu -->
<div id="globalMenuMobile">
    <!--S: mobilesearch-->
    <div class="mobilesearch">
        <form>
            <div class="form-group">
                <input type="text" placeholder="Bạn cần gì hôm nay?" class="form-control hfSearch keyword">
            </div>
        </form>
    </div>
    <!--E: mobilesearch-->
    <!--S: mobilemenu-->
    <div class="mobilemenu">
        <ul>
            <li class=""><a class="home" href="Home.jsp"><i class="fa fa-home"></i> Trang chủ</a></li>
            <li class=""><a class="trending" href="trending.html"><i class="fa fa-comment"></i> Bạn cần gì?</a></li>
            <li class=""><a class="news" href="news.html"><i class="fa fa-newspaper-o"></i> Tin tức thị trường</a></li>
            <li class=""><a class="forum" href="forum.html"><i class="fa fa-forumbee"></i> Thảo luận</a></li>
        </ul>
    </div>
    <!--E: mobilemenu-->	
    <!--S: mobileUserTools-->
    <div class="mobileUserTools">
        <a class="btn btnReg" title="login" data-toggle="modal" data-target="#LogModal">Đăng ký</a>
        <a class="btn btnLog" title="sign up" data-toggle="modal" data-target="#RegModal">Đăng nhập</a>
    </div>
    <!--E: mobileUserTools-->
    <!--S: mobilemenuUser-->
    <div class="mobilemenu usermenu">
        <ul>
            <li class=""><a class="neednow" href="member-purchases.html"><i class="fa fa-rocket"></i> Cần ngay</a></li>
            <li class=""><a class="needlater" href="member-collections.html"><i class="fa fa-list"></i> Cần sau</a></li>
            <li class=""><a class="manager-item" href="member-items.html"><i class="fa fa-cubes"></i> Sản phẩm đã đăng</a></li>
            <li class=""><a class="following" href="member-following.html"><i class="fa fa-hand-o-right"></i> Đang theo dõi</a></li>
            <li class=""><a class="follower" href="member-followers.html"><i class="fa fa-hand-o-left"></i> Được theo dõi</a></li>
        </ul>
    </div>
    <!--E: mobilemenuUser-->		
    <!--S: mobilecopyright-->
    <div class="mobilecopyright">

    </div>
    <!--E: mobilecopyright-->

</div>
<!--E: mobile menu -->	