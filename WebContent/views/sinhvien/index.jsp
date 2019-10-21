<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>
<%@ include file="/views/sinhvien/taglib.jsp"%>
<script type="text/javascript">
function del(id) {
	var check = confirm('bạn có muốn thực hiện không');
	if(check){
		$.ajax({
			url : "${api}",
			type : 'DELETE',
			contentType : 'application/json',
			data : JSON.stringify({
				id : id
				}),
			success: function(data){
				window.location.href = "${index}?msg=delsuccess";
	      		},
	      	error : function(error) {
				window.location.href = "${del}?msg=delfail";
				}
			});
		}
	}
</script>
<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>Danh Sách Sinh Viên</h2>
			</div>
		</div>
		<!-- /. ROW  -->
		<hr>
		<c:if test="${not empty param.msg }">
			<c:if test="${param.msg eq 'addsuccess'}">
				<h3 style="color: blue;">Thêm thành công</h3>
			</c:if>
			<c:if test="${param.msg eq 'delsuccess'}">
				<h3 style="color: blue;">Xóa thành công</h3>
			</c:if>
			<c:if test="${param.msg eq 'editsuccess'}">
				<h3 style="color: blue;">Sửa thành công</h3>
			</c:if>
			<c:if test="${param.msg eq 'delfail'}">
				<h3 style="color: blue;">Xóa thất bại</h3>
			</c:if>
		</c:if>

		<div class="row">
			<div class="col-md-12">
				<!-- Advanced Tables -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-responsive">
							<div class="row" style="margin-bottom: 30px;">
								<div class="col-sm-8">
									<a href="${add}" class="btn btn-success btn-md" id=""> <i
										class="fa fa-plus"></i>&nbsp;Thêm
									</a>
								</div>
								<div class="col-md-4">
									<form action="${index}" method="get">
										<div class="input-group form">
											<c:if test="${not empty str }">
												<c:set var="name" value="${str }" />
											</c:if>
											<c:if test="${empty str }">
												<c:set var="name" value="" />
											</c:if>
											<input type="text" class="form-control"
												placeholder="Nhập tên sinh viên..." name="str"
												value="${name }" /> <span class="input-group-btn"> <input
												class="btn btn-primary" type="submit" value="Tìm kiếm">
											</span>
										</div>
									</form>
								</div>
							</div>
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr align="center">
										<th>ID</th>
										<th>Họ tên</th>
										<th>Quê Quán</th>
										<th>Khoa</th>
										<th>Ngày Sinh</th>
										<th>CMND</th>
										<th width="20%">Chức năng</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty listSinhVien }">
											<c:forEach items="${listSinhVien }" var="sinhVien">
												<tr class="gradeX">
													<td>${sinhVien.id }</td>
													<td>${sinhVien.hoten }</td>
													<td>${sinhVien.quequan }</td>
													<td>${sinhVien.khoa }</td>
													<td>${sinhVien.ngaysinh }</td>
													<td>${sinhVien.cmnd }</td>
													<td class="center" align="center"><a
														href="${edit}?id=${sinhVien.id}" title=""
														class="btn btn-primary"><i class="fa fa-edit "></i>Sửa</a>
														<a href="javascript:void(0)" title=""
														class="btn btn-danger"
														onclick="return del(${sinhVien.id })"><i
															class="fa fa-trash-o"> </i> Xóa</a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<h3 style="color: blue;">Không có sinh viên</h3>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="dataTables_info" id="dataTables-example_info"
							style="margin-top: 27px"></div>
					</div>
					<div class="col-sm-6" style="text-align: right;">
						<div class="dataTables_paginate paging_simple_numbers"
							id="dataTables-example_paginate">
							<ul class="pagination">
								<c:if test="${numberOfPage > 1 }">
									<c:if test="${currentPage > 1 }">
										<li class="paginate_button previous"
											aria-controls="dataTables-example" tabindex="0"
											id="dataTables-example_previous"><a
											href="${index }?pageid=${currentPage-1}&str=${name}">Trang
												trước</a></li>
									</c:if>
									<c:if test="${currentPage <= 1 }">
										<li class="paginate_button previous"
											aria-controls="dataTables-example" tabindex="0"
											id="dataTables-example_previous"><a href="#">Trang
												trước</a></li>
									</c:if>
									<c:forEach begin="1" end="${numberOfPage }" var="i">
										<c:if test="${currentPage == i }">
											<c:set var="active" value="active" />
										</c:if>
										<c:if test="${currentPage != i }">
											<c:set var="active" value="" />
										</c:if>
										<li class="paginate_button ${active }"
											aria-controls="dataTables-example" tabindex="0"><a
											href="${index }?pageid=${i}&str=${name}">${i }</a></li>
									</c:forEach>
									<c:if test="${currentPage < numberOfPage }">
										<li class="paginate_button next"
											aria-controls="dataTables-example" tabindex="0"
											id="dataTables-example_next"><a
											href="${index }?pageid=${currentPage + 1}&str=${name}">Trang
												tiếp</a></li>
									</c:if>
									<c:if test="${currentPage >= numberOfPage }">
										<li class="paginate_button next"
											aria-controls="dataTables-example" tabindex="0"
											id="dataTables-example_next"><a href="#">Trang tiếp</a></li>
									</c:if>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>