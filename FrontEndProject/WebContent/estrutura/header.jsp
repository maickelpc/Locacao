<%@page language="java" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="pt-br">

<!--================================================================================
	Item Name: Materialize - Material Design Admin Template
	Version: 1.0
	Author: GeeksLabs
	Author URL: http://www.themeforest.net/user/geekslabs
================================================================================ -->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description" content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google. ">
    <meta name="keywords" content="materialize, admin template, dashboard template, flat admin template, responsive admin template,">
	<meta charset="utf-8">
    <title>LocaSystem - Gestão de locação de equipamentos</title>

	<link rel="apple-touch-icon" sizes="57x57" href="<%=request.getContextPath() %>/images/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="<%=request.getContextPath() %>/images/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="<%=request.getContextPath() %>/images/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="<%=request.getContextPath() %>/images/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="<%=request.getContextPath() %>/images/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="<%=request.getContextPath() %>/images/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="<%=request.getContextPath() %>/images/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="<%=request.getContextPath() %>/images/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="<%=request.getContextPath() %>/images/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="<%=request.getContextPath() %>/images/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath() %>/images/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="<%=request.getContextPath() %>/images/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath() %>/images/favicon/favicon-16x16.png">
	<link rel="manifest" href="/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">


<!--     Favicons -->
<%--     <link rel="icon" href="<%=request.getContextPath() %>//materialize-admin7/images/favicon/favicon-32x32.png" sizes="32x32"> --%>
<!--     Favicons -->
<%--     <link rel="<%=request.getContextPath() %>//materialize-admin7/apple-touch-icon-precomposed" href="images/favicon/apple-touch-icon-152x152.png"> --%>
<!--     For iPhone -->
<!--     <meta name="msapplication-TileColor" content="#00bcd4"> -->
<%--     <meta name="msapplication-TileImage" content="<%=request.getContextPath() %>//materialize-admin7/images/favicon/mstile-144x144.png"> --%>
<!--     For Windows Phone -->


    <!-- CORE CSS-->    
    <link href="<%=request.getContextPath() %>//materialize-admin7/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="<%=request.getContextPath() %>//materialize-admin7/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">


    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->    
    <link href="<%=request.getContextPath() %>//materialize-admin7/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="<%=request.getContextPath() %>//materialize-admin7/js/plugins/jvectormap/jquery-jvectormap.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="<%=request.getContextPath() %>//materialize-admin7/js/plugins/chartist-js/chartist.min.css" type="text/css" rel="stylesheet" media="screen,projection">
 
 
 	<!-- ================================================
    Scripts
    ================================================ -->
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/jquery-1.11.2.min.js"></script>    
    <!--materialize js-->
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/materialize.min.js"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
       

    <!-- chartist -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins/chartist-js/chartist.min.js"></script>   

    <!-- chartjs -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins/chartjs/chart.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins/chartjs/chart-script.js"></script>

    <!-- sparkline -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins/sparkline/sparkline-script.js"></script>
    
    <!--jvectormap-->
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins/jvectormap/vectormap-script.js"></script>
    
    
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="<%=request.getContextPath() %>/materialize-admin7/js/plugins.js"></script>
    <!JS uteis>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/scripts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/moment.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.mask.min.js"></script>
    

</head>

<body>

    <!-- Start Page Loading -->
    <div id="loader-wrapper">
        <div id="loader"></div>        
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>
    <!-- End Page Loading -->
    
       <!-- START HEADER -->
    <header id="header" class="page-topbar">
        <!-- start header nav-->
        <div class="navbar-fixed">
            <nav class="cyan">
                <div class="nav-wrapper">
                    <h1 class="logo-wrapper"><a href="<%=request.getContextPath() %>/index.jsp" class="brand-logo darken-1">
                    <img src="<%=request.getContextPath() %>/images/logolocasystem.png" alt="LocaSystem"></a> <span class="logo-text">LocaSystem</span></h1>
                    <ul class="right hide-on-med-and-down">
                        <li class="search-out">
                            <input type="text" class="search-out-text">
                        </li>
                        <li>    
                            <a href="javascript:void(0);" class="waves-effect waves-block waves-light show-search"><i class="mdi-action-search"></i></a>                              
                        </li>
                        <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light toggle-fullscreen"><i class="mdi-action-settings-overscan"></i></a>
                        </li>
                        <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light"><i class="mdi-social-notifications"></i></a>
                        </li>
                        <!-- Dropdown Trigger -->                        
                        <li><a href="#" data-activates="chat-out" class="waves-effect waves-block waves-light chat-collapse"><i class="mdi-communication-chat"></i></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- end header nav-->
    </header>
    <!-- END HEADER -->