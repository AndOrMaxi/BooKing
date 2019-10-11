<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td style="padding-left:10px; padding-top:10px;" width="38%"><a href="index.jsp"><img src="images/BooKingFirst_03.gif" width="392" height="111" alt="logo"></a></td>
    <td style="padding-right:20px;padding-top:15px;" width="62%" align="right"><img src="images/BooKingFirst_06.gif" width="570" height="63" alt="lines"></td>
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>

       <%String nick = (String) session.getAttribute("NICKNAME");%>
    <td width="232" align="left" valign="top" style="font-size:12px;font-weight:bold;color:#666;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome, <%out.println(nick ); %> </td>
    <td style="background-image:url(images/BooKingFirst_12.gif);background-repeat:no-repeat; " width="793" height="22"><table class="purpleline" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr align="center">
		    <td width="20%"><a href="index.jsp">Home</a></td>
		    <td width="20%"><a href="aboutus.jsp">About us</a></td>
		    <td width="20%"></td>
		    <td width="20%"><a href="logout.jsp">Logout</a></td>
		    <td width="20%"><a href="cart.jsp">Cart&nbsp;&nbsp;<img style="vertical-align:middle"  src="images/cart2.gif"></a></td>
	      </tr>
  </table>
</td>
  </tr>
</table>
</td>
  </tr>
</table>