<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<br/><br/><br/>
<div class="box box-primary box-solid">
	<div class="box-header with-border">
		<h3 class="box-title">List Employee</h3>
	</div>
	<!-- box header -->
	<div class="panel panel-default" style="border-color: white; margin-bottom: 0px;">
		<div class="panel-body" style="padding: 10px;">
			<ol class="breadcrumb" style="background-color: #f5f5f5;">
		        <li><a href="/marcom174/"> Home</a></li>
		        <li><a href="#">Master</a></li>
		        <li class="active">List Employee</li>
      		</ol>
		</div>
	</div>
	<!-- panel -->	
		<table class="table" id="table-search">
			<thead>
				<tr>
					<th colspan="5"></th>
					<th>
						<button type="button" class="btn btn-primary btn-block" id="button-add">Add</button>
					</th>
				</tr>
			</thead>
			<tr>
				<th colspan="1">
					<input type="text" id="data1" name="data1" class="form-control" placeholder="Employee ID Number" />					 
				</th>
				<th>
					<input type="text" id="data2" name="data2" class="form-control" placeholder="Employee Name" />
				</th>
				<th>
					<select class="form-control" id="data3" name="data3">
						<option value="">- Select Company Name -</option>
              					<c:forEach items="${companyModelList}" var="companyModel">
              						<option value="${companyModel.name}">
              							${companyModel.name}
              						</option>
              					</c:forEach>
					</select>
				</th>
				<th>
					<div class="form-group has-feedback">
						<input type="text" name="data4" id="data4" class="form-control"
							placeholder="Created"> <span style="color: gray;"
							class="glyphicon glyphicon-calendar form-control-feedback"></span>
					</div>
				</th>
				<th>
					<input type="text" class="form-control" id="data5" name="data5" placeholder="Created By" />
				</th>
				<th>
					<button type="button" id="button-search" class="btn btn-warning btn-block">Search</button>
				</th>
				</tr>
		</table>
		
		<table id="table-employee" class="table table-hover">
			<thead>				
				<tr>
					<th>No</th>
					<th>Employee ID Number</th>
					<th>Employee Name</th>
					<th>Company Name</th>
					<th>Created Date</th>
					<th>Create By</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody id="list-data-employee">
				<tr></tr>
			</tbody>
		</table>
		<!-- table -->
		 <div id="myEdit" class="alert alert-warning collapse">
		        <a href="#" class="close" data-dismiss="alert">&times;</a>
		        <strong>Data Updated !</strong> New Product has been Updated
    	</div>
	</div>
	<!-- box body -->

<!-- box -->

<!-- Popup -->
<div id="modal-input" class="modal fade">

	<div class="modal-dialog">
	
		
		
	</div>

</div>
<!-- Popup -->

<script>

listDataEmployee();


function listDataEmployee() {
	$.ajax({
		url:"employee/list.html",
		type:"get",
		dataType:"html",
		success: function(result){
			$("#list-data-employee").html(result);
		}
	});
}

	$(document).ready(function () {
		
		//DataTable function
		var table = $('#table-employee').DataTable({
			'sDom':'tip',
	    	ordering: false
	    });
		
		//Date picker
	    $('#data4').datepicker({
	      autoclose: true,
	      format: 'dd/mm/yyyy',
	      clearBtn: true
	    });
		
		//Select2
		$('#data3').select2();
		
		$("#table-search").on("click", "#button-search", function() {
			for (var i = 1; i <= 5; i++) {
	    		table.column(i).search($("#data"+ i).val()).draw();
			}
	    });
		
		//modal Add
		$("#button-add").on("click", function(){
			$.ajax({
				url:"employee/add.html",
				type:"get",
				dataType:"html",
				success: function(result){
					$("#modal-input").find(".modal-dialog").html(result);
					$("#modal-input").modal("show");
				}
			});
			
		});
		
	    $("#modal-input").on("submit","#form-add-employee", function(){
	    	var codeEmployee = document.getElementById("code"); 
	    	var alertCode = document.getElementById("alertCode");
	    	var alert = document.getElementById("alert");
	    	
	    	if (!$("#form-add-employee").valid()) return false;
	    		
			$.ajax({
				url:"employee/add/save.json",
				type:"get",
				dataType:"json",
				data:$(this).serialize(),
				success: function(result){
					alertCode.style.display="none";
					codeEmployee.style.borderColor="gray";
					$("#modal-input").modal("hide");
					swal({
						  title: 'Data Saved!',
						  text: 'New Employee has been add with employee ID Number '+result.employeeModel.employee_number,
						  type: 'success',
						  confirmButtonText: 'OK'
						})
						listDataEmployee();
				},
				error: function(jqXHR, textStatus, errorThrown){
					codeEmployee.style.borderColor="red";
					alertCode.style.display="block"; 
				}
			});
			return false;
		});
	    
	    $("#list-data-employee").on("click", "#button-detail", function(){
			var idDetail = $(this).val();
			$.ajax({
				url:"employee/detail.html",
				type:"get",
				dataType:"html",
				data: {id:idDetail},
				success: function(result){
					$("#modal-input").find(".modal-dialog").html(result);
					$("#modal-input").modal("show");
				}
			});
			
		});
	    
	    $("#list-data-employee").on("click", "#button-edit", function(){
			var idEdit = $(this).val();
			$.ajax({
				url:"employee/edit.html",
				type:"get",
				dataType:"html",
				data: {id:idEdit},
				success: function(result){
					$("#modal-input").find(".modal-dialog").html(result);
					$("#modal-input").modal("show");
				}
			});
			
		});
		
		$("#modal-input").on("submit","#form-edit-employee", function(){
			var codeEmployee = document.getElementById("code"); 
	    	var alertCode = document.getElementById("alertCode");
	    	if (!$("#form-edit-employee").valid()) return false;
			
			$.ajax({
				url:"employee/edit/save.json",
				type:"get",
				dataType:"json",
				data:$(this).serialize(),
				success: function(result){
					$("#modal-input").modal("hide");
					alertCode.style.display="none";
					codeEmployee.style.borderColor="gray";
					swal({
						  title:'Data Updated !',
						  text: 'Data employee has been updated',
						  type: 'info',
						  confirmButtonText: 'OK'
						})
					listDataEmployee();
				}
			});
			return false;
		});
		
		$("#list-data-employee").on("click", "#button-delete", function(){
			var idDelete = $(this).val();
			$.ajax({
				url:"employee/delete.html",
				type:"get",
				dataType:"html",
				data: {id:idDelete},
				success: function(result){
					$("#modal-input").find(".modal-dialog").html(result);
					$("#modal-input").modal("show");
				}
			});
			
		});
		
		$("#modal-input").on("submit","#form-delete-employee", function(){
			$.ajax({
				url:"employee/delete/save.json",
				type:"get",
				dataType:"json",
				data:$(this).serialize(),
				success: function(result){
					$("#modal-input").modal("hide");
					swal({
						  title:'Data Deleted !',
						  text: 'Data employee with Employee ID Number '+result.employeeModel.employee_number,
						  type: 'error',
						  confirmButtonText: 'OK'
						})
						listDataEmployee();
				}
			});
			return false;
		});
		
	});
</script>