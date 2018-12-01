<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Materialize - Material Design Admin Template
	Version: 1.0
	Author: GeeksLabs
	Author URL: http://www.themeforest.net/user/geekslabs
================================================================================ -->

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="msapplication-tap-highlight" content="no">
  <meta name="description" content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google. ">
  <meta name="keywords" content="materialize, admin template, dashboard template, flat admin template, responsive admin template,">
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
  <!-- For Windows Phone -->


  <!-- CORE CSS-->
  
  <link href="../materialize-admin7/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="../materialize-admin7/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="../materialize-admin7/css/page-center.css" type="text/css" rel="stylesheet" media="screen,projection">

  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="../materialize-admin7/css/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="../materialize-admin7/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
  
</head>

<body class="cyan">
  <!-- Start Page Loading -->
  <div id="loader-wrapper">
      <div id="loader"></div>        
      <div class="loader-section section-left"></div>
      <div class="loader-section section-right"></div>
  </div>
  <!-- End Page Loading -->

  <div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">

      <form class="login-form" action="<%=request.getContextPath()%>/login/controleLogin.jsp" method="post">
	      <div class="row">
		      <div class="center-align" style="padding-top: 1em"> 
		    	<img src="<%=request.getContextPath() %>/images/logolocasystem.png" alt="LocaSystem" >
		      </div>
	      	
	      </div>
	       <div class="row">
	         <div class="input-field col s12 center">
	           <img src="images/login-logo.png" alt="" class="circle responsive-img valign profile-image-login">
	           <p class="center login-form-text">Entre com seu login e senha</p>
	         </div>
	       </div>
	       <div class="row margin">
	         <div class="input-field col s12">
	           <i class="mdi-social-person-outline prefix"></i>
	           <input id="login" name="userLogin" type="email">
	           <label for="login" class="active">Login</label>
	         </div>
	       </div>
	       <div class="row margin">
	         <div class="input-field col s12">
	           <i class="mdi-action-lock-outline prefix"></i>
	           <input id="senha" name="userSenha" type="password">
	           <label for="senha" class="active">Senha</label>
	         </div>
	       </div>
	       <div class="row">          
	         <div class="input-field col s12 m12 l12  login-text">
	             <input type="checkbox" id="remember-me" />
	             <label for="remember-me">Lembrar-me</label>
	         </div>
	       </div>
	       <div class="row">
	         <div class="input-field col s12">
	           <button  class="btn waves-effect waves-light col s12">Entrar</button>
	         </div>
	       </div>  
	       <div class="row center-align" >
		       <%   HttpSession sessao = request.getSession();
					Boolean erroLogin = (Boolean)sessao.getAttribute("erroLogin");
					if (erroLogin != null && erroLogin ){ %>
				<div style="padding:1em" class="msg msg-alert z-depth-4 col s12">Credenciais inválidas, tente novamente!</div>
				<% sessao.removeAttribute("erroLogin");
					}
				%>
	       </div>      
	     </form>
    </div>
  </div>



  <!-- ================================================
    Scripts
    ================================================ -->

  <!-- jQuery Library -->
  <script type="text/javascript" src="../materialize-admin7/js/jquery-1.11.2.min.js"></script>
  <!--materialize js-->
  <script type="text/javascript" src="../materialize-admin7/js/materialize.js"></script>
  <!--prism-->
  <script type="text/javascript" src="../materialize-admin7/js/prism.js"></script>
  <!--scrollbar-->
  <script type="text/javascript" src="../materialize-admin7/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>

  <!--plugins.js - Some Specific JS codes for Plugin Settings-->
  <script type="text/javascript" src="../materialize-admin7/js/plugins.js"></script>

</body>

</html>



 