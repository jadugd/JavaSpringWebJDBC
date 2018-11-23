<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="panel-group">
<div class="panel panel-primary">
	<div class="panel-heading">Detail Souvenir Request - ${souvenirRequestModel.code} </div>
	<form method="get" id="form-souvenir-request-detail">
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
						<input type="text" id="requestByUser" name="requestByUser" class="form-control" value="${souvenirRequestModel.requestByUser.employeeModel.first_name}" readonly />
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
					<td id="statusValue">
						 <c:choose>
							<c:when test="${souvenirRequestModel.status == 1}">
								Submitted
							</c:when>
							<c:when test="${souvenirRequestModel.status == 2}">
								In Progress
							</c:when>
							<c:when test="${souvenirRequestModel.status == 3}">
								Received By Requester
							</c:when>
							<c:when test="${souvenirRequestModel.status == 4}">
								Settlement
							</c:when>
							<c:when test="${souvenirRequestModel.status == 5}">
								Approved Settlement
							</c:when>
							<c:when test="${souvenirRequestModel.status == 6}">
								Close Request
							</c:when>
							<c:when test="${souvenirRequestModel.status == 0}">
								Rejected
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
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
							<input type="text" class="form-control" value="${souvenirRequestDetailModel.souvenirModel.name}" disabled="disabled">
						</td>
						<td>
							<input type="text" class="form-control" value="${souvenirRequestDetailModel.qty}" size="5" disabled="disabled">
						</td>
						<td>
							<input type="text" class="form-control" value="${souvenirRequestDetailModel.note}" disabled="disabled">
						</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
		</div>
			<div class="panel-footer" align="right">
	              <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
    		 </div> 
			</form>		
</div>
</div>

<script>
	    
</script>