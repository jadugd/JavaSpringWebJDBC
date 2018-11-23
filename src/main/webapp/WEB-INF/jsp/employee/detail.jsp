<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-primary">
<div class="panel-heading">View Employee - ${employeeModel.first_name} ${employeeModel.last_name} (${employeeModel.employee_number})</div>
  <div class="panel-body">
  	<div class="panel panel-default">
	  <div class="panel-body">
	    <form method="get" id="form-add-employee">
              	<table class="table">
              		<tr>
              			<th>*Emp ID Number</th>
              			<th>
              				<input type="text" class="form-control" id="code" name="code" value="${employeeModel.employee_number}" disabled="disabled" />
              			</th>
              			<th>*Company Name</th>
              			<th>
              				<select class="form-control" disabled id="mCompanyId" name="mCompanyId">
              					<option disabled selected>- Select Company Name -</option>
              					<c:forEach items="${companyModelList}" var="companyModel">
              						<option value="${companyModel.id}" ${companyModel.id == employeeModel.m_company_id ? 'selected="true"':''}>
              							${companyModel.name}
              						</option>
              					</c:forEach>
              				</select>
              			</th>
              		</tr>
              		<tr>
              			<th>*First Name</th>
              			<th>
              				<input type="text" class="form-control" id="firstName" name="firstName" value="${employeeModel.first_name}" disabled="disabled" />
              			</th>
              			<th>Email</th>
              			<th>
              				<input type="email" class="form-control" id="email" name="email" value="${employeeModel.email}" disabled="disabled">
              			</th>
              		</tr>
              		<tr>
              			<th>Last Name</th>
              			<th>
              				<input type="text" class="form-control" id="lastName" name="lastName" value="${employeeModel.last_name}" disabled="disabled" />
              			</th>
              		</tr>
              	</table>
              	<!-- table -->
              </form>
	  </div>
	  <div class="panel-footer" style="overflow: auto;">
	  	<button data-dismiss="modal" style="float: right;" class="btn btn-warning">Cancel</button>
	  </div>
	</div>
    
  </div>

</div>