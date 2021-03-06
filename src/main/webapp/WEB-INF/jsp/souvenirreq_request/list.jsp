<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${souvenirRequestModelList}" var="souvenirRequestModel" varStatus="number">
	<tr>
		<td>${number.count}</td>
		<td>${souvenirRequestModel.code}</td>
		<td>${souvenirRequestModel.requestByUser.employeeModel.first_name} ${souvenirRequestModel.requestByUser.employeeModel.last_name}</td>
		<td>
			<fmt:formatDate value="${souvenirRequestModel.request_date}" pattern="dd/MM/yyyy"/>
		</td>
		<td>
			<fmt:formatDate value="${souvenirRequestModel.dueDate}" pattern="dd/MM/yyyy"/>
		</td>
		<td>
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
		<td>
			<fmt:formatDate value="${souvenirRequestModel.createdDate}" pattern="dd/MM/yyyy"/>
		</td>
		<td>${souvenirRequestModel.createdByUser.roleModel.nama}</td>
		<td>
			<button style="border: none;padding: 0;background: none;" type="button" id="button-detail" value="${souvenirRequestModel.id}">
				<i class="fa fa-search"></i>
			</button>
			<%-- <button style="border: none;padding: 0;background: none;" type="button" id="button-edit" value="${souvenirRequestModel.id}">
				<i class="fa fa-pencil"></i>
			</button> --%>
			<%-- <button style="border: none;padding: 0;background: none;" type="button" id="button-delete" value="${souvenirRequestModel.id}">
				<i class="fa fa-trash"></i>
			</button> --%>
		</td>
	</tr>
</c:forEach>