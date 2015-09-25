<%-- 
    Document   : Active
    Created on : Sep 25, 2015, 6:02:16 PM
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
      
        <!--E:header-->
        <!--S:mainbody-->
        <div id="mainwrapper">
            <!--S: maintop -->
            <div id="maintop" class="container">

            </div>
        </div>
        <!--E:mainbody-->

        <!--S:footer-->
        <jsp:include page="includes/footer.jsp" flush="true" />
        <!--E:footer-->



    </body>
</html>
