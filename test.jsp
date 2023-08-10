<!-- 
	[1]jsp의 코드 작성 영역
		jsp파일안에 jsp에서 코드를 작성할 수 있는 영역
		1)지시영역 [%@ %]
			현재 페이지에 대한 정보를 작성하는 곳
		2)선언부 [%! %]
			멤버영역(멤버변수 및 멤버메서드)
		3)스크립틀릿 [% %]
			현재 이 jsp페이지의 메서드 영역
-->
<%@ page contentType="text/html;charset=utf-8"%>
<%!
	//선언부
	private String name ="tiger";
	
	public String getName(){
		return name;
	}
%>
<%
	String result=getName();//멤버메서드 호출
	out.print(result);
%>