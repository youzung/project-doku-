<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
   
	<link rel="stylesheet" href="resources/css/calendar.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/fullcalendar.min.css" />  
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/fullcalendar.print.css" media="print" /> 

	<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/moment.min.js"></script>
	<script type="text/javascript" src="resources/js/fullcalendar.js"></script>
	<script type="text/javascript" src="resources/js/bpopup.min.js"></script> 
	<script type="text/javascript" src="resources/js/bootstrap-datetimepicker.min.js"></script> 
	<script src='resources/js/ko.js'></script>
  
	<title>일정 관리</title>
	
	
	<c:if test="${sessionScope.nickname!=null}">
		<script>
		 
	    $(document).ready(function ()  
	    		{  
	    		    $('#calendar').fullCalendar({  
	    		        header:  
	    		        {  
	    		            left: 'prev,next today',  
	    		            center: 'title',  
	    		            right: 'month,agendaWeek,agendaDay'  
	    		        },  
	    		        buttonText: {  
	    		            today: 'today',  
	    		            month: 'month',  
	    		            week: 'week',  
	    		            day: 'day'  
	    		        },  
	    		  		
	    		        events: function (start, end, timezone, callback)  
	    		        {  
	    		            $.ajax({  
	    		                url: 'http://localhost:8000/doku/listAll.html',  
	    		                type: "GET",  
	    		                dataType: "JSON",  
	    		  
	    		                success: function (result)  
	    		                {  
	    		                    var events = [];  
	    		  
	    		                    $.each(result, function (i, data)  
	    		                    {  
	    		                        events.push(  
	    		                       { 
	    		                    	   	classNames : data.nickname,
	    		                    	    id:data.id,
	    		                    	   	title: data.title,  
	    		                            start: moment(data.startDate).format('YYYY-MM-DD'),  
	    		                            end: moment(data.endDate).format('YYYY-MM-DD'),  
	    		                            backgroundColor: "#d1c3db",  
	    		                            borderColor: "#f0cccc"   
	    		                       });  
	    		                    });  
	    		  
	    		                    callback(events);  
	    		                }  
	    		            });  
	    		        },  
	    		        
	    		        editable: true,
	    		        selectable:true,
	    		        eventClick:function(info){
	  							
	    		        	  var result = confirm(info.id + info.title+'를 삭제하시겠습니까?');
	    		        	    if(result){
	    		        	    	location.href="/doku/calendar?action=delete&id="+info.id;
	    		        	    	$('#calendar').fullCalendar('removeEvents',info.id);
	    		        			
	    		        			alert("삭제되었습니다.");
	    		        	    }
	    		        }
	    		    });  
	    		});  

      function addSchedule() {
  		var ctn = "";
  		ctn += "<form method='post' action ='calendar?action=insert'>";
  		ctn += "<input id= 'nickname' type='hidden' value= '${sessionScope.nickname}'>";
  		ctn += "<div style= 'width:100%; height:30px'><div style='width:30%;float:left;padding-left:30px'>일정</div><div style='width:60%;float:right'><input type='text' name='title' placeholder='일정 제목'></div></div>";
  		ctn += "<div style= 'width:100%; height:30px'><div style='width:30%;float:left;padding-left:30px'>시작</div><div style='width:60%;float:right'><input type='text' name='startDate' placeholder='년/월/일'></div></div>";
  		ctn += "<div style= 'width:100%; height:30px'><div style='width:30%;float:left;padding-left:30px'>끝</div><div style='width:60%;float:right'><input type='text' name='endDate' placeholder='년/월/일'></div></div>";
  		ctn += "<div style= 'width:100%; text-align:center; height:30px; margin-bottom:15px;margin-top:10px'><input type='submit' value='저장'></div>";
  		ctn += "</form>";
  		openPopup("일정 추가", ctn, 500);
  	}

  	function openPopup(subject, contents, widths) {
  		$('#alert_subject').html(subject);
  		$('#alert_contents').html(contents);
  		openMessage('winAlert', widths)
  	}

  	function openMessage(ids, widths) {
  		$('#' + ids).css("width", widths + "px");
  		$('#' + ids).bPopup();
  	}

  	function closeMessage(ids, widths) {
  		$('#' + ids).bPopup().close();
  	}
  	
  	
    </script>
    </c:if>
    
    
 <c:if test="${!empty msg }">
	<script>
		alert('${msg}');
	</script>
</c:if>

  </head>
  <body>
	
	<div>
		<button onclick="javascript:addSchedule()">일정 추가(나중에 아이콘 변경!)</button>
	</div>	
    <div id='calendar'style="width:500px; height:700px"></div>

	<div class="box box-success" style="width:500px; display:none; backgroud-color:white" id="winAlert">
		<div class="box-header with-border" style="backgroud-color:white; padding-left:15px">
			<h3 class="box-title" id="alert_subject" style="backgroud-color:white"></h3>
		</div>
		<div class="box-body" id="alert_contents" style="font-size:15px; background-color:white">
		</div>
	</div>

  </body>
</html>