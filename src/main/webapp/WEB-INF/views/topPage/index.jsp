<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>

<c:set var="actTop" value="${ForwardConst.ACT_TOP.getValue()}" />
<c:set var="actEmp" value="${ForwardConst.ACT_EMP.getValue()}" />
<c:set var="actRep" value="${ForwardConst.ACT_REP.getValue()}" />

<c:set var="commShow" value="${ForwardConst.CMD_SHOW.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commNew" value="${ForwardConst.CMD_NEW.getValue()}" />

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>日報管理システムへようこそ</h2>
        <h3 class = time>【タイムカード】</h3>
        <h2 id="RealtimeClockArea2"></h2>
        <script>
        function set2fig(num) {
               // 桁数が1桁だったら先頭に0を加えて2桁に調整する
               var ret;
               if( num < 10 ) { ret = "0" + num; }
               else { ret = num; }
               return ret;
            }
            function showClock2() {
               var nowTime = new Date();
               var nowHour = set2fig( nowTime.getHours() );
               var nowMin  = set2fig( nowTime.getMinutes() );
               var nowSec  = set2fig( nowTime.getSeconds() );
               var msg = nowHour + ":" + nowMin + ":" + nowSec ;
               document.getElementById("RealtimeClockArea2").innerHTML = msg;
            }
            setInterval('showClock2()',1000);

             function btn1Click(){
                 var nowTime = new Date();
                 var nowyear = nowTime.getFullYear();
                var nowmonth = nowTime.getMonth()+1;
                 var nowdate = nowTime.getDate();
                 var nowHour = set2fig( nowTime.getHours() );
                 var nowMin  = set2fig( nowTime.getMinutes() );
                 var nowSec  = set2fig( nowTime.getSeconds() );
                 var msg = nowyear + "/" + nowmonth + "/" + nowdate + " " + nowHour + ":" + nowMin + ":" + nowSec ;
                 document.getElementById("konnitiwa").innerHTML = msg;
             }

             function btn2Click(){
                 var nowTime = new Date();
                 var nowyear = nowTime.getFullYear();
                 var nowmonth = nowTime.getMonth()+1;
                 var nowdate = nowTime.getDate();
                 var nowHour = set2fig( nowTime.getHours() );
                 var nowMin  = set2fig( nowTime.getMinutes() );
                 var nowSec  = set2fig( nowTime.getSeconds() );
                 var msg = nowyear + "/" + nowmonth + "/" + nowdate + " " + nowHour + ":" + nowMin + ":" + nowSec ;
                 document.getElementById("konnitiwa2").innerHTML = msg;
             }
        </script>
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

        </style>

<script>
const weeks = ['日', '月', '火', '水', '木', '金', '土']
const date = new Date()
const year = date.getFullYear()
const month = date.getMonth() + 1
const startDate = new Date(year, month - 1, 1) // 月の最初の日を取得
const endDate = new Date(year, month,  0) // 月の最後の日を取得
const endDayCount = endDate.getDate() // 月の末日
const startDay = startDate.getDay() // 月の最初の日の曜日を取得
let dayCount = 1 // 日にちのカウント
let calendarHtml = '' // HTMLを組み立てる変数

calendarHtml += '<h1 class = "care">' + year  + '/' + month + '</h1>'
calendarHtml += '<table class = "care2">'

// 曜日の行を作成
for (let i = 0; i < weeks.length; i++) {
    calendarHtml += '<td class = "care3">' + weeks[i] + '</td>'
}

for (let w = 0; w < 6; w++) {
    calendarHtml += '<tr class = "care4">'

    for (let d = 0; d < 7; d++) {
        if (w == 0 && d < startDay) {
            // 1行目で1日の曜日の前
            calendarHtml += '<td class = "care3"></td>'
        } else if (dayCount > endDayCount) {
            // 末尾の日数を超えた
            calendarHtml += '<td class = "care3"></td>'
        } else {
            calendarHtml += '<td class = "care3">' + dayCount + '</td>'
            dayCount++
        }
    }
    calendarHtml += '</tr class = "care4">'
}
calendarHtml += '</table>'

document.querySelector('#calendar').innerHTML = calendarHtml
</script>
<style>
.care {
    font-size: 18px;
}

.care2 {
    border-spacing: 0;
    border-collapse: collapse;
}

.care3 {
    border: 1px solid #ddd;
    padding: 5px;
    text-align: center;
}

.care3:first-child {
    color: red;
}

.care3:last-child {
    color: royalblue;
}
</style>

<!-- <label for="title">名前</label><br /> -->
<%-- <input type="text" name="title" value="${message.title}" /> --%>
<!-- <br /><br /> -->

<!-- <label for="content">出勤 or 退勤</label><br /> -->
<%-- <label for="content"><input type="radio" name="content" value="${message.content}" />出勤</label> --%>
<%-- <label for="content"><input type="radio" name="content" value="${message.content}" />退勤</label> --%>
<!-- <br /><br /> -->

<%-- <input type="hidden" name="_token" value="${_token}" /> --%>
<!-- <button type="submit" class = "botan">送信</button> -->

<!-- <input type = "button" class = "botan" value = "出勤" onclick = "btn1Click();"/> -->
<!-- <input type = "button" class = "botan2" value = "退勤" onclick = "btn2Click();"/> -->

<!--        <table id="report_list"> -->
<!--        <tbody> -->
<!--              <tr> -->
<!--                      <th class="">出勤時刻</th> -->
<!--                      <th class="">退勤時刻</th> -->
<!--              </tr> -->
<!--           <tr> -->
<!--           <td id ="konnitiwa"> -->
<!--           <td id ="konnitiwa2"> -->
<!--          </tr> -->
<!--        </tbody> -->
<!--        </table> -->
        <div id = kintai2>
        <h1 class = "kintai">勤怠管理</h1>
        <form method="POST" action="/daily_report_system/InquiryServlet">
            <label for="username" class = "kintai3">氏名</label><br />
            <input type="text" name="title" class = "kintai5"/>
            <br /><br />

            <label for="content" class = "kintai4">出勤 or 退勤</label><br />
        <label for="content" class = "kintai4"><input type="radio" name="content" value = "出勤" />出勤</label>
        <label for="content" class = "kintai4"><input type="radio" name="content" value = "退勤"  />退勤</label>
            <br /><br />

<!--             <label for="content">お問い合わせ内容</label><br /> -->
<!--             <textarea rows="5" cols="25" name="content"></textarea> -->
<!--             <br /><br /> -->

            <button type="submit" class = "botan">送信</button>
        </form>
        </div>

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
<!-- <table> -->
<!--                     <tbody> -->
<!--                         <tr> -->
<!--                             <th>タイトル</th> -->
<%--                             <td><c:out value="${message.title}" /></td> --%>
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <th>メッセージ</th> -->
<%--                             <td><c:out value="${message.content}" /></td> --%>
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <th>作成日時</th> -->
<%--                             <td><fmt:formatDate value="${message.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <th>更新日時</th> -->
<%--                             <td><fmt:formatDate value="${message.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
<!--                         </tr> -->
<!--                     </tbody> -->
<!--                 </table> -->



         <h3>【自分の日報　一覧】</h3>
         <table id="report_list">
             <tbody>
                 <tr>
                     <th class="report_name">氏名</th>
                     <th class="report_date">日付</th>
                     <th class="report_title">タイトル</th>
                 </tr>
                 <c:forEach var="report" items="${reports}" varStatus="status">
                     <fmt:parseDate value="${report.reportDate}" pattern="yyyy-MM-dd" var="reportDay" type="date" />
                     <tr class="row${status.count % 2}">
                         <td class="report_name"><c:out value="${report.employee.name}" /></td>
                         <td class="report_date"><fmt:formatDate value='${reportDay}' pattern='yyyy-MM-dd' /></td>
                         <td class="report_title">${report.title}</td>
<%--                         <td class="report_action"><a href="<c:url value='?action=${actRep}&command=${commShow}&id=${report.id}' />">詳細を見る</a></td> --%>
                     </tr>
                 </c:forEach>
             </tbody>
         </table>

<!--          <div id="pagination"> -->
<%--              （全 ${reports_count} 件）<br /> --%>
<%--              <c:forEach var="i" begin="1" end="${((reports_count - 1) / maxRow) + 1}" step="1"> --%>
<%--                  <c:choose> --%>
<%--                      <c:when test="${i == page}"> --%>
<%--                          <c:out value="${i}" />&nbsp; --%>
<%--                      </c:when> --%>
<%--                     <c:otherwise> --%>
<%--                         <a href="<c:url value='?action=${actTop}&command=${commIdx}&page=${i}' />"><c:out value="${i}" /></a>&nbsp; --%>
<%--                     </c:otherwise> --%>
<%--                  </c:choose> --%>
<%--              </c:forEach> --%>
<!--          </div> -->

<!--          <h2>メッセージ一覧</h2> -->
<!--         <ul> -->
<%--             <c:forEach var="message" items="${messages}"> --%>
<!--                 <li> -->
<%--                         <c:out value="${message.id}" /> --%>
<%--                     ：<c:out value="${message.title}"></c:out> &gt; <c:out value="${message.content}" /> --%>
<!--                 </li> -->
<%--             </c:forEach> --%>
<!--         </ul> -->
<!--         <div id="pagination"> -->
<%--             （全 ${messages_count} 件）<br /> --%>
<%--             <c:forEach var="i" begin="1" end="${((messages_count - 1) / 15) + 1}" step="1"> --%>
<%--                 <c:choose> --%>
<%--                     <c:when test="${i == page}"> --%>
<%--                         <c:out value="${i}" />&nbsp; --%>
<%--                     </c:when> --%>
<%--                     <c:otherwise> --%>
<%-- -                         <a href="<c:url value='?action=${actTop}&command=${commIdx}&page=${i}' />"><c:out value="${i}" /></a>&nbsp; --%>
<%-- -                     </c:otherwise> --%>
<%--                 </c:choose> --%>
<%--             </c:forEach> --%>
<!--         </div> -->
<%--         <p><a href="<c:url value='?action=${actRep}&command=${commNew}' />">新規日報の登録</a></p> --%>
    </c:param>
</c:import>