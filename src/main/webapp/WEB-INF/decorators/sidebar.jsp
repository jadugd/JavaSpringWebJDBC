<nav class="navbar" style="height: 100%; position: fixed;"
	role="navigation">
	<aside class="main-sidebar">

		<section class="sidebar">
			<ul class="sidebar-menu">
				<li class="header">Smart POS</li>
				
				<li>
					<a href="#"><i class="fa fa-th-list"></i><span>Menu</span><span class="pull-right-container"> </span></a>
						<ul class="treeview-menu">	
						
							<li>
								<c:forEach items="${menuModelList}" var="menuModel">
									<a href="${contextName}/${menuModel.controller}.html">
										<i class="fa fa-bookmark"></i>
										${menuModel.nama}
									</a>
									<br/>
								</c:forEach>
							</li>
						
						</ul>
				</li>
				
			</ul>
		</section>
		<!-- /.sidebar -->
	</aside>
</nav>