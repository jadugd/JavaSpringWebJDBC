<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-primary">
<div class="panel-heading">Edit Employee - ${employeeModel.first_name} ${employeeModel.last_name} (${employeeModel.employee_number})</div>
  <div class="panel-body">
  	<div class="panel panel-default">
  	<form method="get" id="form-edit-employee" name="editEmployee">
	  <div class="panel-body">
              	<table class="table">
              		<tr>
              			<th>*Emp ID Number</th>
              			<th>
              				<input type="hidden" id="id" name="id" value="${employeeModel.id}" />
              				<input type="text" class="form-control" id="code" name="code" value="${employeeModel.employee_number}" data-inputmask='"mask": "99.99.99.99"' data-mask /><br/>
              				<a style="font-size: small;color: red;display: none;" id="alertCode">Value already exist!</a>
              			</th>
              			<th>*Company Name</th>
              			<th>
              				<select class="form-control" id="mCompanyId" name="mCompanyId">
              					<option selected value="">- Select Company Name -</option>
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
              				<input type="text" class="form-control" id="firstName" name="firstName" value="${employeeModel.first_name}" />
              			</th>
              			<th>Email</th>
              			<th>
              				<input type="email" class="form-control" id="email" name="email" value="${employeeModel.email}" />
              			</th>
              		</tr>
              		<tr>
              			<th>Last Name</th>
              			<th>
              				<input type="text" class="form-control" id="lastName" name="lastName" value="${employeeModel.last_name}" />
              			</th>
              		</tr>
              	</table>
              	<!-- table -->
              
	  </div>
	  <div class="panel-footer" style="overflow: auto;">
	  	<button type="submit" style="float: right;" class="btn btn-primary">Update</button>
	  	<button data-dismiss="modal" style="float: right;" class="btn btn-warning">Cancel</button>
	  </div>
	  </form>
	</div>
    
  </div>

</div>

<script>
//Wait for the DOM to be ready
$(function() {
	//input masking
   $('[data-mask]').inputmask();
  // Initialize form validation on the registration form.
  // It has the name attribute "registration"
  $("form[name='editEmployee']").validate({
    // Specify validation rules
    rules: {
      // The key name on the left side is the name attribute
      // of an input field. Validation rules are defined
      // on the right side
      firstName: "required",
      mCompanyId: "required",
      email: {
        required: true,
        // Specify that email should be validated
        // by the built-in "email" rule
        email: true
      },
      code: {
        required: true,
        minlength: 5
      }
    },
    // Specify validation error messages
    messages: {
      firstname: "Please enter your firstname",
      mCompanyId: "Please select Company Name",
      code: {
        required: "Please enter Employee ID Number",
        minlength: "Must be at least 5 characters long"
      },
      email: "Your email address must be in the format of name@domain.com"
    },
    // Make sure the form is submitted to the destination defined
    // in the "action" attribute of the form when valid
    /* submitHandler: function(form) {
      form.submit();
    } */
  });
});
</script>