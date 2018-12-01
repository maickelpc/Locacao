<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Locacao"%>
<%@page import="controller.LocacaoController"%>
<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>



<%@ page import="java.util.List"%>
<%@ page import="model.UserModel"%>

<%
	LocacaoController controller = new LocacaoController();
	//List<Locacao> locacoesAtivas = new ArrayList<Locacao>();
	List<Locacao> locacoesAtivas = controller.listar(1, 10, "ATIVO"); 

	Date d = new Date();
	Calendar hoje = new GregorianCalendar();
	hoje.setTime(d);
	
	final DateFormat df = new SimpleDateFormat("dd / MM / yyyy");
	
%>

<div class="container">
	<div class="row">

	<!--chart dashboard start-->
	    <div id="chart-dashboard">
	        
	    <!--card stats start-->
	    <div id="card-stats">
	        <div class="row">
	            <div class="col s12 m6 l3">
	                <div class="card">
	                    <div class="card-content  green white-text">
	                        <p class="card-stats-title"><i class="mdi-social-group-add"></i> Novos Clientes</p>
	                        <h4 class="card-stats-number">566</h4>
	                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> 15% <span class="green-text text-lighten-5">último mês</span>
	                        </p>
	                    </div>
	                    <div class="card-action  green darken-2">
	                        <div id="clients-bar"></div>
	                    </div>
	                </div>
	            </div>
	            <div class="col s12 m6 l3">
	                <div class="card">
	                    <div class="card-content purple white-text">
	                        <p class="card-stats-title"><i class="mdi-editor-attach-money"></i>Locações mensais</p>
	                        <h4 class="card-stats-number">R$ 990.63</h4>
	                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> +30% <span class="purple-text text-lighten-5">último mês</span>
	                        </p>
	                    </div>
	                    <div class="card-action purple darken-2">
	                        <div id="sales-compositebar"></div>
	
	                    </div>
	                </div>
	            </div>                            
	            <div class="col s12 m6 l3">
	                <div class="card">
	                    <div class="card-content blue-grey white-text">
	                        <p class="card-stats-title"><i class="mdi-action-trending-up"></i> Locações no mês</p>
	                        <h4 class="card-stats-number">18</h4>
	                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> 20% <span class="blue-grey-text text-lighten-5">+ / mês anterior</span>
	                        </p>
	                    </div>
	                    <div class="card-action blue-grey darken-2">
	                        <div id="profit-tristate"></div>
	                    </div>
	                </div>
	            </div>
	            <div class="col s12 m6 l3">
	                <div class="card">
	                    <div class="card-content deep-purple white-text">
	                        <p class="card-stats-title"><i class="mdi-editor-insert-drive-file"></i> Locações pendentes</p>
	                        <h4 class="card-stats-number">18</h4>
	                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-down"></i> 3 <span class="deep-purple-text text-lighten-5">atrasadas</span>
	                        </p>
	                    </div>
	                    <div class="card-action  deep-purple darken-2">
	                        <div id="invoice-line"></div>
	                    </div>
	                </div>
	            </div>                            
	        </div>
	    </div>
	    <!--card stats end-->
	
	    <!-- //////////////////////////////////////////////////////////////////////////// -->
	
	    <!--card widgets start-->
	    <div id="card-widgets">
	        <div class="row">
	
	            <div class="col s12 m12 l6">
	                <ul id="task-card" class="collection with-header">
	                    <li class="collection-header cyan">
	                        <h4 class="task-card-title">Locações Ativas</h4>
	                        <p class="task-card-date"><%= df.format(d) %></p>
	                    </li>
	                    <% if (locacoesAtivas.size() == 0){ %>
						<li class="collection-item dismissable">
	                       
	                        <label for="task1">Nenhuma Reserva Ativa <a href="#" class="secondary-content"><span class="ultra-small"></span></a>
	                        </label>
	                        
	                    </li>
	                    	
	                    <% }else{
	                    	for (int i = 0; i < locacoesAtivas.size(); i++){%>
	                    <li class="collection-item dismissable">
	                        <input type="checkbox" id="task1"  readonly="readonly"/>
	                        <label for="task1"><span class="task-cat pink" style="margin: 2px">Equip: <%= locacoesAtivas.get(i).getEquipamento().getCodigo() %></span> <%= locacoesAtivas.get(i).getEquipamento().getDescricao() %> <a href="#" class="secondary-content">
	                        <span class="ultra-small"><%= locacoesAtivas.get(i).getDataDevolucao() %></span></a>
	                        </label>Cliente: <%= locacoesAtivas.get(i).getCliente().getNome() + " " + locacoesAtivas.get(i).getCliente().getSobrenome() %>
	                        <span class="task-cat teal" style="margin: 2px"><%=locacoesAtivas.get(i).getCliente().getCelular() %></span>
	                    </li>
	                    <%}
	                    };%>
	                    
	                </ul>
	            </div>
	            <div class="col s12 m12 l6">
	                <ul id="task-card" class="collection with-header">
	                    <li class="collection-header amber">
	                        <h4 class="task-card-title">Atrasadas</h4>
	                        <p class="task-card-date">March 26, 2015</p>
	                    </li>
	                    <li class="collection-item dismissable">
	                        <input type="checkbox" id="task1" />
	                        <label for="task1">Create Mobile App UI. <a href="#" class="secondary-content"><span class="ultra-small">1 dia</span></a>
	                        </label>
	                        <span class="task-cat teal">Mobile App</span>
	                    </li>
	                    <li class="collection-item dismissable">
	                        <input type="checkbox" id="task2" />
	                        <label for="task2">Betoneira 05. <a href="#" class="secondary-content"><span class="ultra-small">3 dias</span></a>
	                        </label>
	                        <span class="task-cat purple">Leonardo - (45)99999-5555</span>
	                    </li>
	                    <li class="collection-item dismissable">
	                        <input type="checkbox" id="task3" checked="checked" />
	                        <label for="task3">Check the new Mockup of ABC. <a href="#" class="secondary-content"><span class="ultra-small">10 dias</span></a>
	                        </label>
	                        <span class="task-cat pink">Mockup</span>
	                    </li>
	                    <li class="collection-item dismissable">
	                        <input type="checkbox" id="task4" checked="checked" disabled="disabled" />
	                        <label for="task4">I did it !</label>
	                        <span class="task-cat cyan">Mobile App</span>
	                    </li>
	                </ul>
	            </div>
	
	        </div>
	    </div>
	    <!--card widgets end-->
	
	
	        </div>
	    </div>
	    <!--card widgets end-->
	
	
	</div>
</div>


<%@ include file="/estrutura/footer.jsp"%>