<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>
<script type="text/javascript">
	function edit() {
		var id = $('#id').val();
		var hoten = $('#hoten').val();
		var quequan = $('#quequan').val();
		var ngaysinh = $('#ngaysinh').val();
		var cmnd = $('#cmnd').val();
		var khoa = $('#khoa').val();
		$.ajax({
			url : "${pageContext.request.contextPath }/api/sinhvien",
			type : 'PUT',
			contentType : 'application/json',
			data : JSON.stringify({
				id : id,
				hoten : hoten,
				quequan : quequan,
				ngaysinh : ngaysinh,
				cmnd : cmnd,
				khoa : khoa
				}),
				success: function(data){
					window.location="${pageContext.request.contextPath }/admin/sinhvien/index";
				},
		});
	}
</script>
<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>Cập nhật sinh viên</h2>
			</div>
		</div>
		<!-- /. ROW  -->
		<hr />
		<div class="row">
			<div class="col-md-12">
				<!-- Form Elements -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<form onsubmit="edit()">
									<div class="form-group">
										<label for="id">ID</label> <input type="text" id="id"
											name="id" value="${sinhVien.id }" class="form-control"
											readonly="readonly" />
									</div>
									<div class="form-group">
										<label for="hoten">Tên sinh viên</label> <input type="text"
											id="hoten" name="hoten" value="${sinhVien.hoten }"
											class="form-control" required="required" />
									</div>
									<div class="form-group">
										<label for="quequan">Quê quán</label> <input type="text"
											id="quequan" name="quequan" value="${sinhVien.quequan }"
											class="form-control" required="required"/>
									</div>
									<div class="form-group">
										<label for="khoa">Khoa</label> <input type="text" id="khoa"
											name="khoa" value="${sinhVien.khoa }" class="form-control" required="required"/>
									</div>

									<div class="form-group">
										<label for="ngaysinh">Ngày sinh</label> <input type="date"
											id="ngaysinh" name="ngaysinh" value="${sinhVien.ngaysinh }" required="required"/>
									</div>
									<div class="form-group">
										<label for="cmnd">Số chứng minh nhân dân</label> <input
											type="text" id="cmnd" name="cmnd" value="${sinhVien.cmnd }"
											class="form-control" required="required"/>
									</div>

									<button type="submit" class="btn btn-success btn-md">Sửa</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>