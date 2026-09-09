<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.ServletRegistration" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myapp - 빌드된 서블릿 & JSP 목록</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, 'Malgun Gothic', sans-serif;
        }
        body {
            background-color: #f0f2f5;
            color: #1c1e21;
            padding: 40px 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
            padding: 30px;
        }
        h1 {
            font-size: 22px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .desc {
            color: #64748b;
            font-size: 14px;
            margin-bottom: 24px;
        }
        .section-header {
            font-size: 15px;
            font-weight: 700;
            color: #334155;
            margin: 24px 0 12px 0;
            padding-bottom: 8px;
            border-bottom: 2px solid #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .badge {
            font-size: 12px;
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 9999px;
        }
        .badge-servlet {
            background-color: #ffedd5;
            color: #c2410c;
        }
        .badge-jsp {
            background-color: #dcfce7;
            color: #15803d;
        }
        .list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .item {
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 14px 18px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #fafafa;
            transition: all 0.2s;
        }
        .item:hover {
            border-color: #3b82f6;
            background: #f0f7ff;
            transform: translateY(-1px);
        }
        .item-info {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }
        .item-title {
            font-size: 15px;
            font-weight: 600;
            color: #1e293b;
        }
        .item-path {
            font-size: 13px;
            color: #64748b;
            font-family: 'Consolas', monospace;
        }
        .btn-run {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            background-color: #2563eb;
            color: #ffffff;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            padding: 8px 16px;
            border-radius: 6px;
            transition: background 0.2s;
        }
        .btn-run:hover {
            background-color: #1d4ed8;
        }
        .empty-msg {
            padding: 16px;
            text-align: center;
            color: #94a3b8;
            font-size: 14px;
            background: #f8fafc;
            border-radius: 8px;
        }
        .footer {
            margin-top: 30px;
            padding-top: 16px;
            border-top: 1px solid #f1f5f9;
            text-align: center;
            font-size: 12px;
            color: #94a3b8;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>myapp 빌드 목록 (서블릿 & JSP)</h1>
    <p class="desc">프로젝트에 빌드/등록된 서블릿 및 JSP 파일 목록입니다. [실행] 버튼을 누르면 해당 페이지로 바로 이동합니다.</p>

    <!-- 1. 등록된 서블릿 목록 -->
    <div class="section-header">
        <span>등록된 서블릿 (Servlets)</span>
        <span class="badge badge-servlet">Servlet</span>
    </div>
    <ul class="list">
        <%
            Map<String, ? extends ServletRegistration> servletMap = application.getServletRegistrations();
            int servletCount = 0;
            if (servletMap != null) {
                for (Map.Entry<String, ? extends ServletRegistration> entry : servletMap.entrySet()) {
                    String name = entry.getKey();
                    ServletRegistration reg = entry.getValue();
                    String className = reg.getClassName();
                    
                    // 톰캣 기본 내장 서블릿(default, jsp) 제외
                    if ("default".equals(name) || "jsp".equals(name) || (className != null && className.startsWith("org.apache.catalina"))) {
                        continue;
                    }
                    
                    Collection<String> mappings = reg.getMappings();
                    if (mappings != null && !mappings.isEmpty()) {
                        for (String mapping : mappings) {
                            servletCount++;
                            String url = request.getContextPath() + (mapping.startsWith("/") ? mapping : "/" + mapping);
        %>
            <li class="item">
                <div class="item-info">
                    <span class="item-title"><%= (className != null && !className.isEmpty()) ? className : name %></span>
                    <span class="item-path">URL: <%= mapping %></span>
                </div>
                <a href="<%= url %>" class="btn-run" target="_blank">실행 ▶</a>
            </li>
        <%
                        }
                    }
                }
            }
            if (servletCount == 0) {
        %>
            <li class="empty-msg">등록된 사용자 서블릿이 없습니다.</li>
        <%
            }
        %>
    </ul>

    <!-- 2. JSP 및 HTML 목록 -->
    <div class="section-header">
        <span>JSP 및 웹 페이지 (JSP / HTML)</span>
        <span class="badge badge-jsp">JSP</span>
    </div>
    <ul class="list">
        <%
            int jspCount = 0;
            
            // 재귀적으로 JSP 파일 탐색 람다/헬퍼
            class ResourceHelper {
                void scan(ServletContext ctx, String path, List<String> resultList) {
                    Set<String> paths = ctx.getResourcePaths(path);
                    if (paths == null) return;
                    for (String p : paths) {
                        if (p.startsWith("/WEB-INF") || p.startsWith("/META-INF") || p.equals("/index.jsp")) {
                            continue;
                        }
                        if (p.endsWith("/")) {
                            scan(ctx, p, resultList);
                        } else if (p.endsWith(".jsp") || p.endsWith(".html") || p.endsWith(".htm")) {
                            resultList.add(p);
                        }
                    }
                }
            }
            
            List<String> jspList = new ArrayList<>();
            new ResourceHelper().scan(application, "/", jspList);
            Collections.sort(jspList);
            
            for (String jspPath : jspList) {
                jspCount++;
                String url = request.getContextPath() + (jspPath.startsWith("/") ? jspPath : "/" + jspPath);
        %>
            <li class="item">
                <div class="item-info">
                    <span class="item-title"><%= jspPath.substring(jspPath.lastIndexOf('/') + 1) %></span>
                    <span class="item-path"><%= jspPath %></span>
                </div>
                <a href="<%= url %>" class="btn-run" target="_blank">실행 ▶</a>
            </li>
        <%
            }
            if (jspCount == 0) {
        %>
            <li class="empty-msg">배포된 JSP 파일이 없습니다.</li>
        <%
            }
        %>
    </ul>

    <div class="footer">
        Tomcat Context: <strong><%= request.getContextPath() %></strong> | 총 서블릿 <%= servletCount %>개, JSP <%= jspCount %>개 감지됨
    </div>
</div>

</body>
</html>
