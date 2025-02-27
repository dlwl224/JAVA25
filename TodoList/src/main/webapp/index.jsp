<%@page import="list.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//세션에서 사용자 정보 가져오기
	UserDTO user=(UserDTO) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales/ko.min.js"></script>
<script>
		let eventId=null;
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            
            if (calendarEl) {
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    locale: 'ko',
                    initialView: 'dayGridMonth',
                    events: './getEvents.jsp', // 서버에서 일정 데이터를 받아오는 URL
                    eventClassNames: function(info){
                    	 console.log("✅ 일정 클래스 확인: ", info.event.classNames);  
                         return info.event.classNames;
                    },
                    eventClick: function (info) {
						eventId= info.event.id;
                        document.getElementById("modal-title").innerText = info.event.title;
                        document.getElementById("modal-desc").innerText = info.event.extendedProps.description;
                        var statusCheck = document.getElementById("modal-status");

                        if (info.event.extendedProps.status) {
                            statusCheck.innerHTML = "✔ 완료됨";  // 체크 표시
                            statusCheck.style.color = "green";  // 완료된 항목은 초록색으로 표시
                        } else {
                            statusCheck.innerHTML = "❌ 미완료";  // 체크 없음
                            statusCheck.style.color = "red";    // 미완료 항목은 빨간색으로 표시
                        }
                        document.getElementById("edit-btn").href = "./todo/edit?todoNo=" + info.event.id;
                        document.getElementById("delete-btn").onclick = function() {
                            if(confirm("정말 삭제하시겠습니까?")) {
                                fetch("<%= request.getContextPath() %>/todo/delete", {  // ✅ DELETE 요청
                                    method: "POST",
                                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                                    body: "todoNo=" + eventId  // todoNo 값을 전달
                                })
                                .then(response => {
                                    if (response.ok) {
                                        alert("삭제되었습니다.");  
                                        closeModal();
                                        window.location.href = "<%= request.getContextPath() %>/index.jsp";  // ✅ 메인 페이지로 이동
                                    } else {
                                        alert("삭제 실패! 다시 시도해주세요.");
                                    }
                                })
                                .catch(error => console.error("❌ 삭제 요청 중 오류 발생:", error));
                            }
                        };

                        document.getElementById("event-modal").style.display = "block";
                    }
                });
                calendar.render(); // 달력 렌더링
            } else {
                console.error('달력 요소를 찾을 수 없습니다.');
            }
        });

        function closeModal() {
            document.getElementById("event-modal").style.display = "none";
        }
    </script>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .container { display: flex; justify-content: flex-end; padding: 20px; }
    	.button {padding: 12px 24px; margin: 5px; border: none; border-radius: 50px; text-decoration: none; 
        			display: inline-block; font-size: 16px; font-weight: bold; cursor: pointer; 
       				transition: 0.3s ease-in-out; box-shadow: 2px 4px 6px rgba(0, 0, 0, 0.2);}
        .button:hover{transform:scale(1.1);}
        .login-btn { background-color: #007BFF; color: white; margin-bottom: 15px; /* 로그인 버튼과 아래 버튼 간격 */}
    	.write-btn {background-color: #4CAF50; color: white; }
    	.list-btn { background-color: #FF9800; color: white;}
    	.btn-group{display: flex; gap: 15px; margin-top: 10px;}
        #calendar { width: 80%; height:600px; margin: 20px auto; }
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .modal-content {
            background-color: white;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            text-align: left;
        }
        .close {
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .completed {background-color: red; color: white;}
        .todo {background-color: lightgray;}
    </style>
</head>
<body>
	<h1>TODO LIST</h1>
    <p>할 일을 효율적으로 관리하세요!</p>
    <div class="container">
        <% if (session.getAttribute("user") == null) { %>
            <a href="./login.jsp" class="button">로그인</a>
        <% } else { %>
            <a href="./logout" class="button">로그아웃</a>
        <% } %>
        <a href="./write.jsp" class="button">TODO 작성하기</a>
        <a href="./todomain.jsp" class="button">목록 보기</a>
    </div>
    
    <div id="calendar"></div>
        
    <!-- 일정 상세 보기 모달 -->
    <div id="event-modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modal-title"></h2>
            <p id="modal-desc"></p>
            <p id="modal-status" style="font-weight: bold;"></p>
            <a id="edit-btn" class="button">수정하기</a>
            <button id="delete-btn" class="button">삭제하기</button>
        </div>
    </div>
</body>
</html>
