<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>** PUBLISHER VIEW **</title>
</head>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	Connection dbconn = DriverManager.getConnection(url, "madang", "madang");
	Statement stmt = dbconn.createStatement();
	String bookid = request.getParameter("bookid");
	if (bookid == null)
		bookid = "0";
	//ResultSet myResultSet = stmt.executeQuery("SELECT * FROM Book WHERE bookid='"+bookid+"'");
	ResultSet myResultSet = stmt.executeQuery(
			"select c.name CN, b.bookname BN from customer c, book b, orders o where c.custid = o.custid and b.bookid = o.bookid and b.publisher = (select publisher from book where bookid ='"
					+ bookid + "')");
	;
	//("select c.name, b.bookname from customer c, book b, orders o where c.custid = o.custid and b.bookid = o.bookid and b.publisher = '"+publisher+"'");
	if (bookid.equals("0")) {
%>


<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red">
	<table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7"
		bordercolordark="white" bordercolorlight="#B9E0FA">
		<tr>
			<td width="150" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>산 사람</b></span>
				</p>
			</td>
			<td width="150" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>책 이름</b></span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="150" height="20">
				<p>
					<span style="font-size: 9pt;"> <font face="돋움체"
						color="black">없음</font></span>
				</p>
			</td>
			<td width="150" height="20">
				<p align="center">
					<span style="font-size: 9pt;"> <font face="돋움체"
						color="block">없음</font></span>
				</p>
			</td>
		</tr>
	</table>
	<%
		} else {
	%>

<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red">
	<table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7"
		bordercolordark="white" bordercolorlight="#B9E0FA">
		<tr>
			<td width="150" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>산 사람</b></span>
				</p>
			</td>
			<td width="150" height="20" bgcolor="#D2E9F9">
				<p align="center">
					<span style="font-size: 8pt;"><b>책 이름</b></span>
				</p>
			</td>
		</tr>
		<%
			if (myResultSet != null) {
					while (myResultSet.next()) {
						String W_CNAME = myResultSet.getString("CN");
						String W_BOOKNAME = myResultSet.getString("BN");
		%>
		<tr>
			<td width="150" height="20">
				<p>
					<span style="font-size: 9pt;"> <font face="돋움체"
						color="black"> <%=W_CNAME%></font></span>
				</p>
			</td>
			<td width="150" height="20">
				<p align="center">
					<span style="font-size: 9pt;"> <font face="돋움체"
						color="block"><%=W_BOOKNAME%></font></span>
				</p>
			</td>
		</tr>
		<%
			}
				}
		%>
	</table>
	<%
		}
		stmt.close();
		dbconn.close();
	%>
	<table cellpadding="0" cellspacing="0" width="400" height="23">
		<tr>
			<td width="150">
				<p align="right">
					<span style="font-size: 9pt;"> <a href="booklist.jsp?">
							<font color="black">목록</font>
					</a></span>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>