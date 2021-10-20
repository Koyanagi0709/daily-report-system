<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="constants.ForwardConst" %>
<%@ page import="constants.AttributeConst" %>

<c:set var="actTop" value="${ForwardConst.ACT_TOP.getValue()}" />
<c:set var="actEmp" value="${ForwardConst.ACT_EMP.getValue()}" />
<c:set var="actRep" value="${ForwardConst.ACT_REP.getValue()}" />
<c:set var="actAuth" value="${ForwardConst.ACT_AUTH.getValue()}" />

<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commOut" value="${ForwardConst.CMD_LOGOUT.getValue()}" />
<!DOCTYPE html>
<html lang = "ja">
<head>
<link rel="stylesheet" href="<c:url value='/css/reset.css' />">
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<meta charset="UTF-8">
<title>タイムカード</title>
</head>
<body>
    <style>
        .time{
        margin-top : 30px ;
        }
        #RealtimeClockArea2{
        width : 35%;
        border-style : outset ;
        font-size : 70px ;
        text-align : center;
        height:200px;
        line-height:200px;
        background-color : #000;
        color : #FFF;
        }
        .botan{
        width : 100px ;
        height : 50px ;
        position: relative;
        left : 20px;
        background-color : #005 ;
        color : #FFF;
        margin-bottom : 30px;
        float : left ;
        }
        .botan2{
        width : 100px ;
        height : 50px ;
        background-color : #005 ;
        color : #FFF;
        margin-bottom : 30px;
        clear : both ;
        margin-left : 100px ;
        }
        .kintai{
        font-size : 50px;
        position: relative;
        left : 20px;
        color : #FFF;
        }
        #kintai2{
        border-style : outset;
        border-color : #AAAAAA;
        height : 300px ;
        width : 35% ;
        color : #FFF;
        background-color : #000000;
        margin-bottom : 30px;
        }
        .kintai3{
        position: relative;
        left : 20px;
        top : 5px;
        color : #FFF;
        }
        .kintai4{
        position: relative;
        left : 20px;
        top : 5px;

        }
        .kintai5{
        position: relative;
        left : 20px;
        top : 5px;
        color : #000000;
        }
        .th{
        background-color : #CCFFFF;
        font-weight : bold ;
        }
        .td{
        height : 25px ;
        }
        .table{
        margin-bottom : 40px ;
        }
        #calendar{
        width : 35% ;
        }
        .h12 {
        background-color : #000000;
        }
        </style>
 <div class = "h12">
<h1><a href="<c:url value='/?action=${actTop}&command=${commIdx}' />">日報管理システムへ戻る</a></h1>&nbsp;&nbsp;&nbsp;
</div>
<h2>勤怠管理画面</h2>
<h3 class = time>【タイムカード】</h3>
<c:choose>
            <c:when test="${errors != null}">
                <h1>入力内容にエラーがあります</h1>
                <ul>
                    <c:forEach var="error" items="${errors}">
                        <li><c:out value="${error}" /></li>
                    </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <table border="1" class = "table">
                    <tbody>
                        <tr>
                            <th class = "th">氏名</th>
                            <th class = "th">出退勤</th>
                            <th class = "th">時刻</th>
                        </tr>
                        <tr>
                            <td class = "td"><c:out value="${title}" /></td>
                            <td class = "td"><c:out value="${content}" /></td>
                            <td class = "td"><c:out value="${timeStr}" /></td>
                        </tr>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
        <h2>出勤者一覧</h2>
        <ul>
            <c:forEach var="message" items="${messages}">
                <li>
                    <c:out value="${message.id}" />&nbsp;&nbsp;&nbsp;
                    <c:out value="${message.title}" />&nbsp;&nbsp;&nbsp;
                   <c:out value="${message.content}" />&nbsp;&nbsp;&nbsp;
                   <c:out value="${message.created_at}" />
                </li>
            </c:forEach>
        </ul>
        <div id="pagination">
            （全 ${messages_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((messages_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>

                </c:choose>
            </c:forEach>
        </div>
</body>
</html>