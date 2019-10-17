<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>
<script type="text/javascript">
function del(id) {
	alert('bạn có muốn thực hiện');
	$.ajax({
			url : "${pageContext.request.contextPath }/v1/api/sinhvien",
			type : 'DELETE',
			contentType : 'application/json',
			data : JSON.stringify({
				id : id
				}),
			success: function(data){
				window.location="${pageContext.request.contextPath }/v1/admin/sinhvien/index";
	      		},
		});
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
		<div class="row">
			<div class="col-md-12">
				<!-- Advanced Tables -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-responsive">
							<div class="row" style="margin-bottom: 30px;">
								<div class="col-sm-8">
									<a href="${pageContext.request.contextPath}/v1/admin/sinhvien/add"
										class="btn btn-success btn-md" id=""> <i
										class="fa fa-plus"></i>&nbsp;Thêm
									</a>
								</div>
								<div class="col-md-4">
									<form action="${pageContext.request.contextPath }/v1/admin/sinhvien/index"
										method="get">
										<div class="input-group form">
											<input type="text" class="form-control"
												placeholder="Nhập tên sinh viên..." name="str"> <span
												class="input-group-btn"> <input
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

									<c:forEach items="${listSinhVien }" var="sinhVien">
										<tr class="gradeX">
											<td>${sinhVien.id }</td>
											<td>${sinhVien.hoten }</td>
											<td>${sinhVien.quequan }</td>
											<td>${sinhVien.khoa }</td>
											<td>${sinhVien.ngaysinh }</td>
											<td>${sinhVien.cmnd }</td>
											<td class="center" align="center"><a
												href="${pageContext.request.contextPath }/v1/admin/sinhvien/edit?id=${sinhVien.id}"
												title="" class="btn btn-primary"><i class="fa fa-edit "></i>Sửa</a>
												<a href="javascript:void(0)" title="" class="btn btn-danger"
												onclick="return del(${sinhVien.id })"><i
													class="fa fa-trash-o"> </i> Xóa</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--End Advanced Tables -->
			</div>
		</div>
	</div>
</div>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>