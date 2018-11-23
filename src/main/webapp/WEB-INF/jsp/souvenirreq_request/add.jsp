<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="panel-group">
<div class="panel panel-primary">
	<div class="panel-heading">Add Souvenir Request</div>
	<form method="get" id="form-souvenir-request-add" name="addRequest">
		<div class="panel-body">
		<div class="col-xs-7">
			<table class="table" style="border:none;">
				<tr>
					<td align="right">
						*Transaction Code	
					</td>
					<td>
						 <input type="text" id="code" name="code" class="form-control col-xs-2" value="${codeGen}" readonly />
					</td>
				</tr>
				<tr>
					<td align="right">
						*Event Code	
					</td>
					<td>	
					     <select class="form-control" id="eventName" name="eventName">
						     <option value="" selected>- Select Event Code -</option>
						    
						     <c:forEach items ="${eventModelList}" var="eventModel">
							    <option value="${eventModel.id}">${eventModel.code}
							    </option>
						     </c:forEach>
						     	
						  </select>				       
					</td>
				</tr>
				<tr>
					<td align="right">
						*Request By 	
					</td>
					<td>
						<input type="text" id="requestByUser" name="requestByUser" class="form-control" value="${requestByUser.employeeModel.first_name} ${requestByUser.employeeModel.last_name}" readonly />
						<input type="hidden" id="requestBy" name="requestBy" class="form-control" value="${requestBy}"  />
					</td>
				
				</tr>
				<tr>
					<td align="right">
						*Request Date	
					</td>
					<td>
						 <input type="text" id="requestDate" name="requestDate" class="form-control" value="${requestDate}" readonly />
					</td>
				</tr>
				
				<tr>
					<td align="right">
						*Due Date	
					</td>
					<td>
						<input type="text" name="dueDate" id="dueDate" class="form-control" placeholder="Select Date">
					</td>
				</tr>
				<tr>
					<td align="right">
						Note	
					</td>
					<td>
						 <textarea id="note" name="note" class="form-control" rows="5" cols="4"></textarea>
					</td>
				</tr>
			</table>
		</div>
		</div>
			
			
		<div class="panel-body">
			<input type="hidden" id="nomorBaris" name="nomorBaris"  value="0" />
			<div>
				<button type="button" class="btn btn-primary btn-md add-more" onclick="tambahItem();"><i class="glyphicon glyphicon-plus"></i>&nbsp; Add Item</button>
			</div>
			<div>
			<a style="display: none;" id="alertItem" name="alertItem">Add Item!</a>
			<table class="table" id="table-souvenir-item">
			<tr style="border-bottom-width: 1;">
				<th class="col-xs-4">Souvenir Name</th>
				<th class="col-xs-2">Qty</th>
				<th class="col-xs-4">Note</th>	
				<th></th>	
			</tr>
				<tbody id="list-data-item-souvenir-request">
					
				</tbody>
			</table>
			
		</div>
		</div>
			<div class="panel-footer" align="right"> 
	              <button type="submit" class="btn btn-primary">Save</button>
	              <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
    		 </div> 
			</form>		
</div>
</div>

<script type="text/javascript">

function tambahItem() {
	var table = document.getElementById("table-souvenir-item");
	var row = table.insertRow(1);
	var nomorBaris = document.getElementById("nomorBaris").value;
	var tableBaris = table.rows.length - 2;
	var nomor = 0;
	
	if (tableBaris == 0) {
		document.getElementById("nomorBaris").value = tableBaris;
		nomor = tableBaris;
	} else {
		document.getElementById("nomorBaris").value = parseInt(nomorBaris) + 1;
		nomor = parseInt(nomorBaris) + 1;
	}
	
	var souvenirName = row.insertCell(0);
	var qty = row.insertCell(1);
	var note = row.insertCell(2);
	var action2 = row.insertCell(3);
	
	souvenirName.innerHTML = 
				'<select class="form-control dynamic" id="idSouvenir_'+nomor+'" name="idSouvenir_'+nomor+'">'
					+'<option value="" selected>- Select Souvenir -</option>'
					+'<c:forEach var="souvenirModel" items="${souvenirModelList}">'							
						+'<option value="${souvenirModel.id}-${souvenirModel.name}">'
							+'${souvenirModel.name}'
						+'</option>'
					+'</c:forEach>'
				+'</select>';
	qty.innerHTML = '<input type="text" id="qty_'+nomor+'" name="qty_'+nomor+'" size="5" class="form-control dynamic" />';
	note.innerHTML = '<input type="text" id="note_'+nomor+'" name="note_'+nomor+'" size="20" class="form-control dynamic" />';
	action2.innerHTML = '<button type="button" style="border: none;padding: 0;background: none;" id="btn-delete" onclick="hapusItem(this)"><i class="fa fa-trash"></i></button>';
	
}

function hapusItem(baris) {
     var parentRowIndex = baris.parentNode.parentNode.rowIndex;
     document.getElementById("table-souvenir-item").deleteRow(parentRowIndex);
     
}


    $(document).ready(function() {
	
    	 $("form[name='addRequest']").validate({
    		    // Specify validation rules
    		    errorClass: "my-error-class",
    		    validClass: "my-valid-class",
    		    rules: {
    		      // The key name on the left side is the name attribute
    		      // of an input field. Validation rules are defined
    		      // on the right side
    		      code: "required",
    		      eventName: "required",
    		      dueDate: "required",
    		      nomorBaris: "required",
    		      note: {
    		        required: true,
    		        minlength: 5
    		      }
    		    },
    		    // Specify validation error messages
    		    messages: {
    		      code: "Please enter your code",
    		      eventName: "Please select Event Code",
    		      note: {
    		        required: "Please enter note",
    		        minlength: "Must be at least 5 characters long"
    		      },
    		      dueDate: "Please select due date"
    		    },
    		    // Make sure the form is submitted to the destination defined
    		    // in the "action" attribute of the form when valid
    		    /* submitHandler: function(form) {
    		      form.submit();
    		    } */
    		  });
	

	//DUEDATE
      $('#dueDate').datepicker({
		    autoclose: true,
		    format: 'dd-mm-yyyy'
		 });
	
    });

</script>