<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/table.css">
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#listBtn').click(function() {
			location.href = "list.jsp"
		})
	})
	
	function checkForm() {
	
		let f = document.writeForm
		
		if(f.title.value == '') {
			alert('제목을 입력하세요')
			f.title.focus()
			return false	
		}
		/*
		if(f.writer.value == '') {
			alert('작성자를 입력하세요')
			f.writer.focus()
			return false
		}
		*/
		if(f.content.value == '') {
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}
		
		// 첨부파일 확장자 체크 
		if(checkExt(f.attachfile1))
			return false
			
		if(checkExt(f.attachfile2))
			return false
		
		return true
	}
	
	function checkExt(obj) {
		let forbidName = ['exe', 'java', 'class', 'js', 'jsp']
		let fileName = obj.value
		let ext = fileName.substring(fileName.lastIndexOf('.') + 1)
		
		for(let i = 0; i < forbidName.length; i++) {
			if(forbidName[i] == ext) {
				alert('[' + ext + '] 확장자는 파일 업로드 정책에 위배됩니다')
				return true
			}
		}
		
		return false
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<hr>
		<h2>새글 등록폼</h2>
		<hr>
		<br>
		<form action="write.jsp" method="post" 
			  name="writeForm" onsubmit="return checkForm()"
			  enctype="multipart/form-data">
			<input type="hidden" name="writer" value="${ userVO.id }">
			<table border="1" style="width:80%">
				<tr>
					<th width="25%">제목</th>
					<td><input type="text" name="title" size="80"></td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<%-- <td><input type="text" name="writer" value="${ userVO.id }" readonly></td> --%>
					<td>${ userVO.id }</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="5" cols="80" name="content" ></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="attachfile1"><br>
						<input type="file" name="attachfile2">
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등   록">&nbsp;&nbsp;
			<button type="button" id="listBtn">목   록</button>
		</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>



















