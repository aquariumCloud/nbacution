<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/pages/useeasy/frame/base/taglib.jsp"%>
 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title> </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="useeasy/auction/css/main/structure.css"	rel="stylesheet" type="text/css" />
<script type="text/javascript">
   function ondelete(id){
   $.post("pmtingAction_delete?id="+id,null,function(date){
     
   if(date == "yes"){
	   alert("删除成功！");
	   window.location.href="pmtingAction_getList";
	  }    
   });
     
   }

  function onupdate(id){
    window.location.href="pmtingAction_updateUI?id="+id;
 }


</script>


  </head>
  
  <body>
    
    <center>
    <!--container-->
	<div class="container">
		<!--topnav-->
		<jsp:include page="../../main/topLogin.jsp" flush="true"/>	
		<!--end topnav-->
		
		<div class="header">
			<!--mainnav-->
			<div class="mainnav">
			<jsp:include page="../../main/menu.jsp" flush="true"/>	
			</div>
			<!--end mainnav-->
		
			<div class="msg">
        	<%-- 滚动栏 --%>
				<MARQUEE onmouseover=this.stop() onmouseout=this.start() scrollAmount=4  >
				<s:iterator value="auctionTopInfo_list" var="aucTopInfo_list">
					<img src="useeasy/auction/images/main/icon06.gif" width="11" height="11" />
					<a target="_blank" href="###" onclick="alert(<s:property value="#aucTopInfo_list.id"/>)"><s:property value="#aucTopInfo_list.auctionName"/></a>
				</s:iterator>
				</MARQUEE>
			</div>
		</div>
		<!--end header-->	
		
		<!--main-->
		<div class="main">
			<!--left-->
			<div class="left">
		            <%@include file="/WEB-INF/pages/useeasy/auction/main/left.jsp" %>
			</div>
			<!--end left-->
			
			<!--right-->
			<div class="right"> 
	  			<div class="tit">
  				<div class="l">拍卖厅列表</div> 
	  			<div class="r">
	  			 <a style="color:blue; font-weight:bold;"  href="pmtingAction_addUI" align="center">【增加拍卖厅】</a> 
	  			</div>
	  			</div> 
	  		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#eed09c" id="table1">
            <tr align="center">
            
            <td bgcolor="#FFFFFF" align="center">序号</td>
            <td bgcolor="#FFFFFF" align="center">拍卖厅名称</td>
            <td bgcolor="#FFFFFF" align="center">拍卖时间安排</td>
            <td bgcolor="#FFFFFF" align="center">备注</td>
            <td bgcolor="#FFFFFF" align="center">操作</td>
           </tr>
            
             <s:iterator value="#request.list" var="list" status="flag">
         <tr>
            <td bgcolor="#FFFFFF" align="center"><s:property value="#flag.index+1"/>   </td>
            <td bgcolor="#FFFFFF" align="center"><s:property value="#list.pmtName"/> </td>
            <td bgcolor="#FFFFFF" align="center">
                 <s:iterator value="#list.ut" var="ut" status="uflag">
                   <s:property value="#ut.useTime"/>,
                  
                  </s:iterator>
            
            </td>
            <td bgcolor="#FFFFFF" align="center"><s:property value="#list.notice"/> </td>
            <td bgcolor="#FFFFFF" align="center"><input type="button" value="删除" onclick="ondelete(<s:property value="#list.id"/>)"/>  
            <input type="button" value="修改" onclick="onupdate(<s:property value="#list.id"/>)"/> </td>
           
         </tr>
       
       </s:iterator>
	      
          </table>
          
          <!-- 分页 -->
          
	   	 	</div>
			<!--end right-->
		</div>
		<!--end main-->
	
	 	<!--footer-->
		<jsp:include page="../../main/footer.jsp" flush="true"/>
	</div>
 </center>
</body>
 
    
  
</html>
