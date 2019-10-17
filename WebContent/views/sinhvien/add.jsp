<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>

<script type="text/javascript">
function add() {
	var hoten = $('#hoten').val();
	var quequan = $('#quequan').val();
	var ngaysinh = $('#ngaysinh').val();
	var cmnd = $('#cmnd').val();
	var khoa = $('#khoa').val();
	$.ajax({
		url : "${pageContext.request.contextPath }/api/sinhvien",
		type : 'POST',
		contentType: 'application/json',
		data : JSON.stringify({
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
				<h2>Thêm sinh viên</h2>
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
								<form onsubmit="add()">
									<div class="form-group">
										<label for="hoten">Họ tên</label> <input type="text"
											id="hoten" name="hoten" class="form-control"
											required="required" required="required"/>
									</div>

									<div class="form-group">
										<label for="cmnd">Số CMND</label> <input type="text" id="cmnd"
											name="cmnd" class="form-control" required="required"/>
									</div>

									<div class="form-group">
										<label for="quequan">Quê quán</label> <input type="text"
											id="quequan" name="quequan" class="form-control" required="required"/>
									</div>


									<div class="form-group">
										<label for="khoa">Khoa</label> <input type="text" id="khoa"
											name="khoa" class="form-control" required="required"/>
									</div>

									<div class="form-group">
										<label for="ngaysinh">Ngày sinh</label> <input type="date"
											id="ngaysinh" name="ngaysinh" class="form-control" required="required"/>
									</div>

									<button type="submit" class="btn btn-success btn-md">Thêm</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/templates/admin/inc/footer.jsp"%>