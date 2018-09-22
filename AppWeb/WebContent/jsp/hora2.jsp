<%!
  private String ahora() 
  { 
    return ""+new java.util.Date(); 
  } 
%>
 
<%= ahora() %> 
<p>Esto está dentro de forward</p>
