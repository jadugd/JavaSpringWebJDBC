<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${employeeModelList}" var="employeeModel" varStatus="number">
	<tr>
		<td>${number.count}</td>
		<td>${employeeModel.employee_number}</td>
		<td>${employeeModel.first_name} ${employeeModel.last_name}</td>
		<td>${employeeModel.companyModel.name}</td>
		<td>
			<fmt:formatDate value="${employeeModel.created_date}" pattern="dd/MM/yyyy"/>		
		</td>
		<td>${employeeModel.createdByUser.roleModel.nama}</td>
		<td>
			<button style="border: none;padding: 0;background: none;" type="button" id="button-detail" value="${employeeModel.id}">
				<i class="fa fa-search"></i>
			</button>
			<button style="border: none;padding: 0;background: none;" type="button" id="button-edit" value="${employeeModel.id}">
				<i class="fa fa-pencil"></i>
			</button>
			<button style="border: none;padding: 0;background: none;" type="button" id="button-delete" value="${employeeModel.id}">
				<i class="fa fa-trash"></i>
			</button>
		</td>
	</tr>
</c:forEach>