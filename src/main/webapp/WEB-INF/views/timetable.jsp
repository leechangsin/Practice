<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href='./stylesheets/style.css' rel='stylesheet'>
<script type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript" src="/resources/js/subject-control.js"></script>
</head>
<body>
<div id="content">
        <section id="left_section">
            <article class="creditArea">
                <select class="ordinalTable">
                    <option value="fitst">1</option>
                    <option value="second">2</option>
                    <option value="third">3</option>
                </select> 번째 시간표
                <button type="button" class="reset_bt" id="btnReset" name="reset"></button>
                <button type="button" class="saveexel_bt" name="SaveExcel"></button>
                <br> 총 0학점 전공 0학점 교양 0학점 기타 0학점
            </article>
            <article class="timeTableArea">
                <div class="LeftTableFrame">
                    <table class="timeBoardTable">
                        <tr>
                            <th>&nbsp;</th>
                        </tr>
                        <tr>
                            <td>0교시 8:30
                                <div class="daytimeMark">주</div>
                            </td>
                        </tr>
                        <tr>
                            <td>1교시9:30</td>
                        </tr>
                        <tr>
                            <td>2교시 10:30</td>
                        </tr>
                        <tr>
                            <td>3교시 11:30</td>
                        </tr>
                        <tr>
                            <td>4교시 12:30</td>
                        </tr>
                        <tr>
                            <td>5교시 1:30</td>
                        </tr>
                        <tr>
                            <td>6교시 2:30</td>
                        </tr>
                        <tr>
                            <td>7교시 3:30</td>
                        </tr>
                        <tr>
                            <td>8교시 4:30</td>
                        </tr>
                        <tr>
                            <td>9교시 5:30</td>
                        </tr>
                        <tr>
                            <td>1교시 6:00
                                <div class="daytimeMark">야</div>
                            </td>

                        </tr>
                        <tr>
                            <td>2교시 6:55</td>
                        </tr>
                        <tr>
                            <td>3교시 7:50</td>
                        </tr>
                        <tr>
                            <td>4교시 8:45</td>
                        </tr>
                        <tr>
                            <td>5교시 9:40</td>
                        </tr>
                        <tr>
                            <td>6교시 10:35</td>
                        </tr>

                    </table>
                </div>
                <div class="RightTableFrame">
                    <table class="myTable">
                        <tr>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                        </tr>
                        <tr>
                            <td id="cell0_0">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td id="cell1_0">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </article>
        </section>
    </div>
</body>
</html>