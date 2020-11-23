<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common.jsp"%>
<html>

<head>
<meta charset="utf-8">


</head>

<body>

	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">

				<jsp:include page="../header.jsp" flush="true"></jsp:include>

				<li class="active"><a href="javascript:void(0)"><i
						class="fa fa fa-volume-up"></i> <span class="nav-label">文章管理</span>
						<span class="fa arrow"></span> </a>
					<ul class="nav nav-second-level">
						<li class="active"><a href="/">文章列表</a>
						</li>
					</ul></li>
				<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
						<span class="nav-label">标签管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="admin/tag/list">标签列表</a></li>
					</ul></li>
					<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
						<span class="nav-label">链接管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="admin/friend/list">链接列表</a></li>
					</ul></li>
				<li><a href="javascript:void(0)"><i class="fa fa fa-qrcode"></i>
						<span class="nav-label">用户管理</span> <span class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="admin/list">用户列表</a></li>
					</ul></li>
			</ul>

		</div>
		</nav>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>文章列表</h2>
					<ol class="breadcrumb">
						<li><a href="admin/home">主页</a></li>
						<li><a>文章管理</a></li>
						<li><a href="/">文章列表</a></li>
						<li><strong>编辑文章</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-content">
								<form method="post" action="/blog/article/addOrArticle?type=2" class="form-horizontal">
									<input type="hidden" id="img" name="img" />
									<input type="hidden" name="aid" value="${article.aid}" />
									<input type="hidden" name="create_time" value="${article.create_time}" />
									<div class="form-group">
										<label class="col-sm-2 control-label">栏目:</label>
										<div class="col-sm-4">
											<select class="form-control m-b" name="tag_id">
												<c:forEach items="${tags}" var="tag">
													<option value="${tag.tid}"
															<c:if test="${article.tag_id == tag.tid}">
																selected
															</c:if>>
															${tag.tname}
													</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label">标题:</label>
										<div class="col-sm-10">
											<input type="text" name="title" class="form-control"
												placeholder="请输入标题" value="${article.title}">
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group">
										<label class="col-sm-2 control-label">内容:</label>
										<div class="col-sm-10">
											<textarea id="editor_id" name="content"
													  style="width:800px;height:400px;">
												${article.content}
											</textarea>
										</div>
									</div>
									<div class="hr-line-dashed"></div>

									<div class="form-group">
										<div class="col-sm-4 col-sm-offset-2">
											<input class="btn btn-primary" type="submit"
												value="保存内容" />
											<button class="btn btn-white" type="button"
												onclick="javascript:history.go(-1)">返回</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>

	</div>


	<!-- Mainly scripts -->
	<script src="/blog/js/bootstrap.min.js"></script>
	<script src="/blog/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="/blog/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/blog/js/hplus.js"></script>
	<script src="/blog/js/plugins/pace/pace.min.js"></script>
	<script src="/blog/js/validation.js"></script>
	<script src="/blog/js/article/article_edit.js"></script>
	<script type="text/javascript"
		src="/blog/js/flavr/flavr/js/flavr.min.js"></script>
	<script type="text/javascript" src="http://www.blog.comjs/flavr/base.js"></script>
	<script type="text/javascript"
		src="/blog/js/zTree_v3/js/jquery.ztree.all-3.5.js"></script>
	<script
		src="/blog/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<%--kingEditor--%>
	<script src="/blog/js/kindeditor-4.1.11-zh-CN/kindeditor-all.js"></script>
	<script src="/blog/js/kindeditor-4.1.11-zh-CN/lang/zh-CN.js"></script>
	<script>
        KindEditor.ready(function(K) {
            K.create('#editor_id', {
                uploadJson : '/blog/article/fileUpload',
                filePostName : 'img',
                afterUpload : function (data) {
                    $('#img').val(data);
                }
            });
        });

	</script>
</body>

</html>
