
<%@page import="in.co.rays.proj4.model.RoleModel"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.controller.RoleListCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Role</title>

 <script src="<%=ORSView.APP_CONTEXT %>/js/jquery.min.js"></script>
<script src="<%=ORSView.APP_CONTEXT %>/js/Checkbox11.js"></script>

</head>
<body>
<jsp:useBean id="bean" class="in.co.rays.proj4.bean.RoleBean" scope="request" ></jsp:useBean>
    <%@include file="Header.jsp"%>
    <center>

    <form action="<%=ORSView.ROLE_LIST_CTL%>" method="post">
    
	<div align="center">
    			<h1>Role List</h1>
                <h3><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></h3>
                <h3><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></h3>
                    
	</div>
	
	 <% 
	             List rlist=(List)request.getAttribute("RoleList");
	 
          	 int next=DataUtility.getInt(request.getAttribute("nextlist").toString());

	              
	    		%>
	    

	    <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<RoleBean> it = list.iterator();
                    
                    if(list.size() !=0){
                    	
        %>

            <table width="100%" align="center">
                <tr>
                    <td align="center"><label>Role :</label> 
                    <%-- <input type="text" name="name" placeholder="Enter Role " value="<%=ServletUtility.getParameter("name", request)%>"> --%>
                       <%=HTMLUtility.getList("roleid", String.valueOf(bean.getId()), rlist) %>
                   
                    &nbsp; 
                    <input type="submit" name="operation" value="<%=RoleListCtl.OP_SEARCH %>">
                    &nbsp; 
                    <input type="submit" name="operation" value="<%=RoleListCtl.OP_RESET %>">
         	
                    </td>
                </tr>
            </table>
            <br>

            <table border="1" width="100%" align="center" cellpadding=6px
				cellspacing="2">

				<tr style="background: #E5E4E2">

					<th width="8%"><input type="checkbox" id="select_all" name="Select">Select
						All.</th>
                    
                    <th>S.No.</th>
                    <th>Role</th>
                    <th>Description</th>
                    <th>Edit</th>
                </tr>
				
				<%
					while (it.hasNext())
					{
						RoleBean bean2 = it.next();

				%>


                <tr align="center">
                    <td><input type="checkbox" class="checkbox" name="ids" value="<%=bean2.getId()%>"
                    <%if(userBean.getId() == bean2.getId() || bean2.getId() == RoleBean.ADMIN) {                    
                    %>
                    <%="disabled" %><% } %>

                    ></td>
                    <td><%=index++%></td>
                    <td><%=bean2.getName()%></td>
                    <td><%=bean2.getDescription()%></td>
                    <td><a href="RoleCtl?id=<%=bean2.getId()%>"
                    
                    <%if(userBean.getId() == bean2.getId() || bean2.getId() == RoleBean.ADMIN) {%>
 						onclick = "return false;"                   
                    <% } %>
                    
                    >Edit</a></td>
                </tr>
                <%
                    }
                %>
            </table>
				
            <table width="100%">
                <tr>
					<%if(pageNo == 1){ %> 
                   <td ><input type="submit" name="operation" disabled="disabled" value="<%=RoleListCtl.OP_PREVIOUS%>"></td>
                    <%}else{ %>
                    <td ><input type="submit" name="operation"  value="<%=RoleListCtl.OP_PREVIOUS%>"></td>
                    <%} %>
                     
                     <td ><input type="submit" name="operation" value="<%=RoleListCtl.OP_DELETE%>"></td>
                     <td ><input type="submit" name="operation" value="<%=RoleListCtl.OP_NEW%>"></td>
                     
                     <%	
                     	RoleModel model = new RoleModel();
                     	RoleBean bean2 = new RoleBean();
                     %>
                     
                     
                     <% if(list.size() < pageSize || model.nextPK()-1 == bean.getId()) {%>
                     		<td align="right"><input type="submit" name="operation" disabled="disabled" value="<%=RoleListCtl.OP_NEXT%>"></td>
                     <% }else{%>
                     		<td align="right"><input type="submit" name="operation" value="<%=RoleListCtl.OP_NEXT%>"></td>
                     <%} %>
      
       <td align="right"><input type="submit"  name="operation" value="<%=RoleListCtl.OP_NEXT%>" <%=(list.size()<pageSize||next==0)?"disabled":"" %>> </td>
			       
      
                </tr>          
            </table>
            		<%}if(list.size() == 0){ %>
            		<td align="center"><input type="submit" name="operation" value="<%=RoleListCtl.OP_BACK%>"></td>	
            		<% } %>
            		
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> 
            <input type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    
    <%@include file="Footer.jsp"%>
</body>
</html>
