<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
//scriptlet 스크립틀릿 영역 : java se의 코드를 포함한 jsp문법을
//작성할 수 있다.
	out.print("나 불렀어?"); //html문서에 문자열 출력
	
	//클라이언트가 전송한 파라미터값들을 넘겨받아, mysql에 넣어보기
	//jsp에 내장된 객체(Built-in Object)
	//request 내장객체는 서버가 메모리에 생성하므로 개발자는 이미 존재하는
	//내장객체를 사용하기만 하면 됨
	//request 내장객체는 단어 뜻 그대로 클라이언트의 요청정보를 담고 있는
	//객체(전송한 파라미터, ip)
	//전송된 파라미터에 한글, 영문자 이외의 데이터가 전송되면
	//문자에 대한 인코딩 처리가 필요하다
	
	request.setCharacterEncoding("utf-8");
	
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");

	out.print("넘겨받은 id는 "+id+"<br>");
	out.print("넘겨받은 pass는 "+pass+"<br>");
	out.print("넘겨받은 name는 "+name+"<br>");

	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/javaee?characterEncoding=utf-8";
	String user="root";
	String password="1234";

	Connection con=null;
	PreparedStatement pstmt=null;

	con=DriverManager.getConnection(url,user,password);
	
	if(con==null){
		out.print("접속실패<br>");
	}else{
		out.print("접속성공<br>");
		
		
		String sql="insert into member(id,pass,name) values(?,?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pass);
		pstmt.setString(3,name);

		int result=pstmt.executeUpdate();//DML
		if(result>0){
			out.print("<script>");
			out.print("alert('등록성공');");
			out.print("</script>");
		}else{
			out.print("등록실패");
		}

	}
	pstmt.close();
	con.close();
%>