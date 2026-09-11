<!-- viewPage.jsp -->
<%@page import="ch13.MUtil"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
      	//업로드 파일 저장 위치
      	final String SAVEFOLDER = "C:/Jsp/myapp/src/main/webapp/ch13/storage/";
      	//업로드 파일명 인코딩
      	final String ENCODINMG = "UTF-8";
      	//업로드 파일 크기 제한
      	final int MAXSIZE = 1024*1024*50;//50MB
      	try{
      		//request는 매개변수로 넘기는 순간 null됨.
      		//DefaultFileRenamePolicy: 중복파일이 생기면 자동으로 파일명 뒤에 index번호값 생김.
      		//MultipartRequest 객체가 성공적으로 생성되는 순간 서버에 파일이 업로드.
      		MultipartRequest multi 
      			= new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCODINMG, 
      					new DefaultFileRenamePolicy());
      		String user = multi.getParameter("user");
      		String title = multi.getParameter("title");
      		
      		//파일정보
      		String fileName = multi.getFilesystemName("myfile");
      		String fileType = multi.getContentType("myfile");
      		File f = multi.getFile("myfile");
      		long len = 0;
      		if(f!=null)
      			len = f.length();
%>
user: <%=user %><br>
title: <%=title %><br>
fileName: <%=fileName %><br>
fileType: <%=fileType %><br>
len: <%=MUtil.intFormat((int)len) %>byte<br>
<%      		
      	}catch(Exception e){
      		e.printStackTrace();
      	}
%>














