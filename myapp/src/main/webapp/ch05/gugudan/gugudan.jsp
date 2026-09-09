<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구구단</title>
    <link rel="stylesheet" type="text/css" href="gugudan.css">
    <style>
        tbody tr:hover td {
            background: pink;
        }
    </style>
</head>
<body>

<table>
    <caption>구구단</caption>
    <thead>
        <tr>
            <% for (int dan = 2; dan <= 9; dan++) { %>
                <th><%= dan %>단</th>
            <% } %>
        </tr>
    </thead>
    <tbody>
        <% for (int i = 1; i <= 9; i++) { %>
            <tr>
                <% for (int dan = 2; dan <= 9; dan++) { %>
                    <td><%= dan %> * <%= i %> = <%= dan * i %></td>
                <% } %>
            </tr>
        <% } %>
    </tbody>
</table>

</body>
</html>
