package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form name=\"form_pay\" action=\"payInfo\" method=\"POST\">\n");
      out.write("            thanh toan: <input type=\"text\" name=\"pay\" value=\"\" size=\"20\" />\n");
      out.write("            pay : <input type=\"submit\" value=\"pay\" name=\"btpay\" />\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");
      controller.Controller payInfo = null;
      synchronized (_jspx_page_context) {
        payInfo = (controller.Controller) _jspx_page_context.getAttribute("payInfo", PageContext.PAGE_SCOPE);
        if (payInfo == null){
          payInfo = new controller.Controller();
          _jspx_page_context.setAttribute("payInfo", payInfo, PageContext.PAGE_SCOPE);
        }
      }
      out.write(" \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("payInfo"), request);
      out.write("\n");
      out.write("        ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((controller.Controller)_jspx_page_context.findAttribute("payInfo")).getPay())));
      out.write("\n");
      out.write("        \n");
      out.write("        ");
 Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/project_milkteamanagement?useUnicode=true&characterEncoding=UTF-8", "root", "");

        String strProcedure="{call calculate_pay(7)}"; //your procedure name
        CallableStatement cs =con.prepareCall(strProcedure);
        cs.setInt(1, 1); 
//        cs.registerOutParameter(1,java.sql.Types.INTEGER);
        cs.execute();
//        String strName=cs.getString(1);
//        System.out.println( strName);

        
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
