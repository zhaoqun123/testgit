<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ec.survey.dao.*" %>
<%@ page import="com.ec.survey.dto.*" %>
<%
ConfigDAO cdao=DAOFactory.getConfigDAO();
Config cfg=cdao.findConfig();

SurveyDAO sdao=DAOFactory.getSurveyDAO();
List<Survey> slist=sdao.listVisitableSurvey();
List<Survey> shlist=sdao.listVisitableSurvey(OrderConst.UsehitsDesc);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content=""/>
<meta http-equiv="description" content=""/>
<link rel="stylesheet" href="Css/Style.css" type="text/css" />
 <link rel="stylesheet" href="Css/Admin.css" type="text/css" />
<title><%=cfg.getCSiteName() %>---首页</title>
</head>
<body>
<script src="Js/AC_RunActiveContent.js" type="text/javascript"></script>
<div id="head">
<script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0','width','768','height','140','align','middle','src','Flash/move','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','wmode','Transparent','movie','Flash/move' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="768" height="140" align="middle">
  <param name="movie" value="Flash/move.swf" />
  <param name="quality" value="high" />
  <param name="Wmode" value="Transparent" />
  <embed src="Flash/move.swf" width="768" height="140" align="middle" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="Transparent"></embed>
</object></noscript>
</div>

<%@ include file="banner.jsp"%>

<div id="main" class="middle">
<div id="main_1">
<div class="title">最新问卷</div>
<div class="head_new_flash">
<script type='text/javascript'>
var imgUrl = new Array();
var imgtext = new Array();
var imgLink = new Array();
<%
int k=0;
for(Survey s:slist){
	if(s.getSImg()!=null && (!"".equals(s.getSImg()))&&s.getSImg().endsWith(".jpg")){
		out.println("imgUrl["+k+"]='UploadImg/"+s.getSImg()+"';");
		out.println("imgtext["+k+"]='"+s.getSName()+"';");
		out.println("imgLink["+k+"]='SurveyShow.jsp?sid="+s.getSId()+"';");
		k++;
		
	}
	
}


%>


var pics=imgUrl[0];
var links=imgLink[0];
var texts=imgtext[0];
for(var i=1;i<imgUrl.length;i++){
	pics+='|'+imgUrl[i];
	links+='|'+imgLink[i];
	texts+='|'+imgtext[i];
}
var focus_width=250;
var focus_height=188;
var text_height=22;
var swf_height = focus_height+text_height;

</script>

</div>
<div class="head_new_list">
<ul>
<% 
int i=0;
for(Survey s:slist){
	if(i>7)
		break;
	if(s.getSIsAudited()==false||s.getSIsOpen()==false)
		continue;
%>
<li class=li><a href="SurveyShow.jsp?sid=<%=s.getSId() %>" target="_blank"><%=s.getSName().length()>12?s.getSName().substring(0,11)+"...":s.getSName() %></a>&nbsp;&nbsp;&nbsp;&nbsp;<i><font color=grey><%=s.getSCreateDate() %></font></i></li>
 <%
i++;
}
 %>
</ul>
</div>
</div>
<div id="main_2">
<div class="title">热门排行榜</div>
<div class="paihang_content">

<ol class="list-item" >
<%
for(Survey s:shlist){
	if(i>10)
		break;
	if(s.getSIsAudited()==false||s.getSIsOpen()==false)
		continue;
%>
<li ><a href="SurveyShow.jsp?sid=<%=s.getSId() %>" target="_blank"><%=s.getSName().length()>12?s.getSName().substring(0,11)+"...":s.getSName()%></a></li>
<%
}
%>
</ol>
</div>
</div><!--main_2 end-->
</div><!--main end-->

<%
LinkDAO ldao=DAOFactory.getLinkDAO();
List<Link> llist=ldao.listAllLink();
%>
<div id="indexFriend" class="middle">
<div class="title">友情链接</div>
<div class="main" >
 <ul >
 
<%
int j=0;
for(Link link:llist){
	if(j>6)
		break;
	j++;
%>
<li class=friendBox><a href=<%=link.getLUrl() %>><%=link.getLName()%> </a></li>

<%} %>
</ul>
 
</div>
</div>


<div id="bottom">
<%=cfg.getCSiteName() %><br/>
<%=cfg.getCopyright() %> 
</div><!--bottom end-->
</body>
</html>