<nav class = "navbar-fixed-top">
<header class="main-header">
    <!-- Logo -->
    <a href="/marcom174/index.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>MARCOMM</b>174</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <div class="pull-right">
                	<form method="post" action="<c:url value="/j_spring_security_logout" />">
                		<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
                		<button type="submit" class="btn btn-danger btn-flat">Sign Out</button>
                	</form>
                </div>
      </div>
    </nav>
  </header>
  </nav>