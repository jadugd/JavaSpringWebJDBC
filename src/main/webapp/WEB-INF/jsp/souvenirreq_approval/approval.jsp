<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="panel-group">
<div class="panel panel-primary">
	<div class="panel-heading">Approve Souvenir Request - ${souvenirRequestModel.code} </div>
	<form method="get" id="form-souvenir-request-approve">
		<div class="panel-body">
		<div class="col-xs-7">
			<table class="table" style="border:none;">
				<tr>
					<td align="right">
						*Transaction Code	
					</td>
					<td>
						 <input type="hidden" name="id" id="id" value="${souvenirRequestModel.id}">
						 <input type="text" id="code" name="code" class="form-control col-xs-2" value="${souvenirRequestModel.code}" readonly />
					</td>
				</tr>
				<tr>
					<td align="right">
						*Event Code	
					</td>
					<td>	
					     <select class="form-control" id="eventName" name="eventName" disabled="disabled">
						     <option value="" selected>- Select Event Code -</option>
						    
						     <c:forEach items ="${eventModelList}" var="eventModel">
							    <option value="${eventModel.id}" ${eventModel.id == souvenirRequestModel.tEventId ? 'selected="true"':''}>
							    	${eventModel.code}
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
						<input type="text" id="requestByUser" name="requestByUser" class="form-control" value="${requestByUser.username}" readonly />
						<input type="hidden" id="requestBy" name="requestBy" class="form-control" value="${requestBy}"  />
					</td>
				
				</tr>
				<tr>
					<td align="right">
						*Request Date	
					</td>
					<td>
						 <input type="text" id="requestDate" name="requestDate" class="form-control" value="<fmt:formatDate value="${souvenirRequestModel.request_date}" pattern="dd/MM/yyyy"/>" readonly />
					</td>
				</tr>
				
				<tr>
					<td align="right">
						*Due Date	
					</td>
					<td>
						 <div class="form-group has-feedback">
							<input type="text" name="dueDate" id="dueDate" class="form-control" value="<fmt:formatDate value="${souvenirRequestModel.dueDate}" pattern="dd/MM/yyyy"/>" disabled
								placeholder="Select Date"> <span style="color: gray;"
								class="glyphicon glyphicon-calendar form-control-feedback"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">
						Note	
					</td>
					<td>
						 <textarea id="note" name="note" class="form-control" disabled rows="5" cols="4">${souvenirRequestModel.note}</textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						Status	
					</td>
					<td>
						 <input type="text" id="status" name="status" class="form-control" value="${souvenirRequestModel.status}" readonly>
					</td>
				</tr>
			</table>
		</div>
		</div>
			
			
		<div class="panel-body">
			<input type="hidden" id="nomorBaris" name="nomorBaris"  value="0" />
			<div>
				
			</div>
			<div>
			<table class="table" id="table-souvenir-item">
			<tr style="border-bottom-width: 1;">
				<th class="col-xs-4">Souvenir Name</th>
				<th class="col-xs-2">Qty</th>
				<th class="col-xs-4">Note</th>	
				<th></th>	
			</tr>
				<c:forEach items="${souvenirRequestModel.souvenirRequestDetailModelList}" var="souvenirRequestDetailModel">
					<tr>
						<td>
							<input type="text" value="${souvenirRequestDetailModel.souvenirModel.name}" disabled="disabled">
						</td>
						<td>
							<input type="text" value="${souvenirRequestDetailModel.qty}" size="5" disabled="disabled">
						</td>
						<td>
							<input type="text" value="${souvenirRequestDetailModel.note}" disabled="disabled">
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="form-group">
			<label class="control-label col-md-4">Pilih :</label>
			<div class="col-md-6">
					<input type="radio" id="approve" name="pilih" value="approve" onclick="pilihApprove();" checked="checked"/> Approve
					<input type="radio" id="reject" name="pilih" value="reject" onclick="pilihReject();"/> Reject
			</div>
		</div>
		
		<div class="form-group" id="rejectForm"  style="display: none;">
			<label class="control-label col-md-4">Reject Reason :</label>
			<div class="col-md-6">
					<textarea id="rejectReason" name="rejectReason" rows="3" 
						cols="10" class="form-input">
				</textarea>
			</div>
		</div>
		
		</div>
			<div class="modal-footer">
			<button type="submit" class="btn btn-primary pull-middle" style="display: none;" id="btn-approve">Approve</button>
			<button type="submit" class="btn btn-danger pull-middle" style="display: none;" id="btn-reject">Reject</button>
		</div>
			</form>		
</div>
</div>

<script type="text/javascript">

function pilihReject() {
	document.getElementById("rejectForm").style.display ="block";
	document.getElementById("btn-reject").style.display ="block";
	
	document.getElementById("btn-approve").style.display ="none";
}

function pilihApprove() {
	document.getElementById("rejectForm").style.display ="none";
	document.getElementById("btn-reject").style.display ="none";
	
	document.getElementById("btn-approve").style.display ="block";
}

    $(document).ready(function() {

	

	//DUEDATE
      $('#dueDate').datepicker({
		    autoclose: true,
		    format: 'dd-mm-yyyy'
		 });
	
    });

</script>