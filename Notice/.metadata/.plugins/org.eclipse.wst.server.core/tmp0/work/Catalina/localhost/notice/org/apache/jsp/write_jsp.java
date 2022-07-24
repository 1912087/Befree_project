/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.72
 * Generated at: 2021-11-10 15:17:19 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class write_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("    	<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/css/write_design.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("        <title>BE FREE</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
 // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
		
      out.write("\r\n");
      out.write("        <div class=\"all\">\r\n");
      out.write("            <div class=\"main\">\r\n");
      out.write("                <header>\r\n");
      out.write("                    <div class=\"name\">\r\n");
      out.write("                    </div>\r\n");
      out.write("    \r\n");
      out.write("					");

						// 로그인 하지 않았을 때 보여지는 화면
						if(userID == null){
					
      out.write("\r\n");
      out.write("                            <ul class=\"login\">\r\n");
      out.write("                                <li><a href=\"login.jsp\">로그인</a></li> &nbsp;\r\n");
      out.write("                                <li><a href=\"clause.jsp\">회원가입</a></li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                    ");

						// 로그인이 되어 있는 상태에서 보여주는 화면
						}else{
					
      out.write("    \r\n");
      out.write("                            <ul class=\"login\">\r\n");
      out.write("                                <li><a href=\"logoutAction.jsp\">로그아웃</a></li> &nbsp;\r\n");
      out.write("                                <li><a href=\"main.jsp\">회원관리</a></li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                    ");

						}
					
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                    <nav>\r\n");
      out.write("                        <div class=\"title_menu\">\r\n");
      out.write("                            <a href=\"main.jsp\"><img class=\"logo\" src=\"images/BE_FREE.png\"></a>\r\n");
      out.write("                            <ul id=\"main-menu\">\r\n");
      out.write("                                <li><a href=\"회사소개.html\">BE FREE란</a></li>\r\n");
      out.write("                                <li><a href=\"#\">관광지</a></li>\r\n");
      out.write("                                <li><a href=\"#\">추천여행지</a>\r\n");
      out.write("                                    <ul id=\"sub-menu\">\r\n");
      out.write("                                        <li><a href=\"문의하기.html\">추천여행지</a></li>\r\n");
      out.write("                                        <li><a href=\"공지사항.html\">추천여행일정</a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li><a href=\"#\">일정만들기</a></li>\r\n");
      out.write("                                <li><a href=\"#\">게시판</a>\r\n");
      out.write("                                    <ul id=\"sub-menu\">\r\n");
      out.write("                                        <li><a href=\"공지사항.html\">공지사항</a></li>\r\n");
      out.write("                                        <li><a href=\"Q&A.jsp\">Q&A</a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li><a href=\"#\">나의 저장소</a>\r\n");
      out.write("                                    <ul id=\"sub-menu\">\r\n");
      out.write("                                        <li><a href=\"나의찜목록.html\">나의 찜 목록</a></li>\r\n");
      out.write("                                        <li><a href=\"나의여행일정.html\">나의 여행 일정</a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </nav>\r\n");
      out.write("                    <div class=\"hd\">\r\n");
      out.write("                        <div class=\"ment\">\r\n");
      out.write("                          Q&A\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </header>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"se\">\r\n");
      out.write("                <section>\r\n");
      out.write("                    <div class=\"item_list\">\r\n");
      out.write("                        <p class=\"write\">글쓰기</p>\r\n");
      out.write("                        <form method=\"post\" action=\"writeAction.jsp\">\r\n");
      out.write("	                        <table>\r\n");
      out.write("	                            <tr><th>제목</th><td><input type=\"text\" name=\"QTITLE\" size=\"50\"></td></tr>\r\n");
      out.write("	                            <tr><th>내용</th><td><textarea cols=\"90\" rows=\"20\" name=\"QCONTENT\" placeholder=\"내용을 적으시오.\"></textarea></td></tr>\r\n");
      out.write("	                        </table>\r\n");
      out.write("	                        <div class=\"notice_check\">\r\n");
      out.write("	                        <button class=\"custom-btn btn-5\"><span><a id=\"btn\">확인</a></span></button>\r\n");
      out.write("	                        <button type=\"reset\" class=\"custom-btn btn-5\" onclick=\"location.href='notice.jsp'\"><span><a id=\"btn\">취소</a></span></button>\r\n");
      out.write("	                        </div>\r\n");
      out.write("                        </form>\r\n");
      out.write("                        \r\n");
      out.write("                    </div>\r\n");
      out.write("                </section>\r\n");
      out.write("            \r\n");
      out.write("	            <footer>\r\n");
      out.write("	                <p style=\"padding: 25px 0px 0px 0px;\">전화 : 031-720-2114</p>\r\n");
      out.write("	                <p>주소 : 경기도 성남시 수정구 복정로 76</p>\r\n");
      out.write("	            </footer>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}