 
 <%@ page import="model.UserModel"%>
 <!-- START MAIN -->
<%

	UserModel user = (UserModel)request.getSession().getAttribute("usuario");

%>
    <div id="main">
        <!-- START WRAPPER -->
        <div class="wrapper">

            <!-- START LEFT SIDEBAR NAV-->
		
			<aside id="left-sidebar-nav" >
			    <ul id="slide-out" class="side-nav fixed leftside-navigation">
			        <li class="user-details cyan darken-2">
			            <div class="row">
			                <div class="col col s4 m4 l4">
						<!--<img src="images/avatar.jpg" alt="" class="circle responsive-img valign profile-image"> -->
			                </div>
			                <div class="col col s8 m8 l8">
			                    <ul id="profile-dropdown" class="dropdown-content">
			                        <li><a href="#"><i class="mdi-action-face-unlock"></i> Perfil</a>
			                        </li>
			                        <li><a href="#resetar-senha" class="modal-trigger" onclick="alterarSenhaPreencheModal('IDDOUSUARIO')"><i class="mdi-action-lock-outline"></i> Senha</a>
			                        </li>
			
			
			                        <li><a href="<%=request.getContextPath()%>/login/deslogar.jsp">
			                                <i class="mdi-hardware-keyboard-tab"></i> Sair</a>
			                            <form id="logout-form" action="#" method="POST" style="display: none;">
			                            </form>
			                        </li>
			                    </ul>
			                    <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" href="#" data-activates="profile-dropdown">
			                    <%= (user != null) ? user.getName() : ""  %><i class="mdi-navigation-arrow-drop-down right"></i>
			                    </a>
<!-- 			                    <p class="user-roal">Administrator</p> -->
			                </div>
			            </div>
			        </li>
			        <li class="bold"><a href="<%=request.getContextPath() %>/index.jsp" class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i> Dashboard</a>
			        </li>
			        <li class="bold"><a href="<%=request.getContextPath() %>/locacao/consultaLocacao.jsp" class="waves-effect waves-cyan"><i class="mdi-action-list"></i> Consulta Locação </a>
			        </li>
			        <li class="bold"><a href="<%=request.getContextPath() %>/locacao/efetuaLocacao.jsp" class="waves-effect waves-cyan"><i class="mdi-av-my-library-add"></i> Locação </a>
			        </li>
			        <li class="bold"><a href="<%=request.getContextPath() %>/locacao/efetuaDevolucao.jsp" class="waves-effect waves-cyan"><i class="mdi-notification-play-download"></i> Devolução </a>
			        </li>
			        <li class="no-padding">
			            <ul class="collapsible collapsible-accordion">
			                <li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="mdi-action-invert-colors"></i> Equipamentos</a>
			                    <div class="collapsible-body">
			                        <ul>
			                            <li><a href="<%=request.getContextPath() %>/equipamento/consultaEquipamento.jsp" ><i class="mdi-maps-beenhere"></i> Cadastro</a></li>
			                            <li><a disabled href="#">Manutenção</a></li>
			                            <li><a disabled href="#">Vendidos</a></li>
			                        </ul>
			                    </div>
			                </li>
			                <li class="bold"><a class="collapsible-header  waves-effect waves-cyan"><i class="mdi-image-palette"></i> Cadastros</a>
			                    <div class="collapsible-body">
			                        <ul>
			                        	<li><a href="<%=request.getContextPath() %>/empresa/consultaEmpresa.jsp"><i class="mdi-social-domain"></i> Empresa</a>
			                            <li><a href="<%=request.getContextPath() %>/cliente/consultaCliente.jsp"><i class="mdi-social-person-outline"></i>Clientes</a></li>
			                            <li><a href="<%=request.getContextPath() %>/funcionario/consultaFuncionario.jsp"><i class="mdi-image-portrait"></i> Colaboradores</a></li>
			                            <li><a href="<%=request.getContextPath() %>/user/consultaUsuario.jsp"><i class="mdi-action-account-circle"></i> Usuários</a>
			                            </li>
			                        </ul>
			                    </div>
			                </li>
			            </ul>
			        </li>
			
			        <li class="li-hover"><div class="divider"></div></li>
			
			        <li><a href="<%=request.getContextPath() %>/login/deslogar.jsp"">
			                <i class="mdi-hardware-keyboard-tab"></i> Sair</a>
			            <form action="#" method="POST" style="display: none;">
			                
			            </form>
			        </li>
			    </ul>
			</aside>
			<!-- END LEFT SIDEBAR NAV-->


              <!-- START CONTENT -->
            <section id="content">

                <!--start container-->
                <div class="container">
                
                