<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		작업순서
		1. 파라미터 추출(제목, 작성자, 내용)
		2. t_board 테이블에 새로운 게시글 삽입
		3. 클라이언트에게 결과 전송
	*/
	
	request.setCharacterEncoding("utf-8");

	String saveFolder = "D:/Lecture/web-workspace/Mission-Web/src/main/webapp/upload";

	MultipartRequest multi = new MultipartRequest(
								request,
								saveFolder,
								1024*1024*3,
								"utf-8",
								new KopoFileNamePolicy()
							);
	
	
	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");
	
	// 1. 게시판 저장
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	
	// 등록할 글번호 조회
	int boardNo = dao.selectBoardNo(); 
	board.setNo(boardNo);
	
	dao.insertBoard(board);
	
	// 2. 첨부파일 저장
	Enumeration<String> files =  multi.getFileNames();
	while(files.hasMoreElements()) {
		String fileName = files.nextElement();
	//	System.out.println(fileName);
		File f = multi.getFile(fileName);
		if(f != null) {
			String fileOriName = multi.getOriginalFileName(fileName);
			String fileSaveName = multi.getFilesystemName(fileName);
			int fileSize = (int)f.length();
			
			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			fileVO.setBoardNo(boardNo);
			
//			System.out.println(fileVO);
			dao.insertBoardFile(fileVO);
		}
	}
	
	/*
	File f = multi.getFile("attachfile1");
	if(f != null) {
		String ori = multi.getOriginalFileName("attachfile1");	
		String save = multi.getFilesystemName("attachfile1");
	}
	*/
	
	
	
	

/*
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	System.out.println(board);
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(board);
*/
%>    

<script>
	alert('새글등록을 완료하였습니다')
	location.href = "list.jsp"
</script>

















