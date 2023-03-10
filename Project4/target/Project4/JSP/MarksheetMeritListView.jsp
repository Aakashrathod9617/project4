<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.controller.MarksheetMeritListCtl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Marksheet Merit List</title>
</head>
<body>
<jsp:useBean id="bean" class="in.co.rays.proj4.bean.MarksheetBean" scope="request" ></jsp:useBean>
        <form action="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>" method="POST">
    <%@include file="Header.jsp"%>
    
    <center>
    
        <h1>Marksheet Merit List</h1>

            <br>
           <table border="1" width="100%" align="center" cellpadding=6px
				cellspacing="2">

				<tr style="background: #E5E4E2">

					

                    <th>S.No.</th>
                    <th>Roll No</th>
                    <th>Name</th>
                    <th>Physics</th>
                    <th>Chemistry</th>
                    <th>Maths</th>
					<th>Total</th>
					<th>Percentage</th>
                </tr>
                <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<MarksheetBean> it = list.iterator();

                    while (it.hasNext()) {

                        bean = it.next();
                
                        int phy = bean.getPhysics(); 
                		int chem = bean.getChemistry(); 
                		int maths =bean.getMaths();
                		int total = (phy+chem+maths);
                		float perc = total/3;
                		
                %>
                <tr align="center">

                    <td><%=index++%></td>
                    <td><%=bean.getRollNo()%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=phy%></td>
                    <td><%=chem%></td>
                    <td><%=maths%></td>
					<td><%=total %></td>
					<td><%=((perc) +"%") %></td>
                </tr>

                <%
                    }
                %>
            </table><br>
            <table>
                <tr>
                    <td align="right"><input type="submit" name="operation"
                        value="<%=MarksheetMeritListCtl.OP_BACK%>"></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> 
            <input type="hidden" name="pageSize" value="<%=pageSize%>">
            
        </form>
    </center>
    </br>
    </br>
    

    <%@include file="Footer.jsp"%>
</body>
</html>