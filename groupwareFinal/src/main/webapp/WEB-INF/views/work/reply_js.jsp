<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="ansList" >
	<div class="user-block">
		<img src="<%=request.getContextPath() %>/organogram/getPicture.do?picture=${loginUser.face_photo }" class="img-circle" alt="User Image" style="width : 30px; height : 28px; ">
    </div>
	
 	<div class="timeline-item" >
  		<span class="time" style="font-size: 16px;font-weight:bold;">
    		<i class="fa fa-clock"></i>{{prettifyDate regist_de}}
	 		<a class="btn btn-regist2 {{answer_no}}-a" id="modifyReplyBtn" data-answer_no={{answer_no}}
				onclick="replyModifyModal_go('{{answer_no}}');"				
				style="display:{{VisibleByLoginCheck empno}};"
	    		data-empno={{empno}} data-toggle="modal" data-target="#modifyModal">Modify</a>
  		</span>
	
  		<h3 class="timeline-header"><strong style="display:none;">{{answer_no}}</strong>{{empnm}}</h3>

  		<div class="timeline-body" id="{{answer_no}}-acn">{{acn}} </div>
	</div>
</div>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="reply-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}} ">
	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var replyPage=1; //전역변수(항상기억해야하는 번호가 있어야한다.)

function printData(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$('.ansList').remove();
	target.after(html);
}

function getPage(pageInfo){
	$.getJSON(pageInfo,function(data){
		printData(data.ansList,$('#repliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}

Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlebars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"VisibleByLoginCheck":function(empno){
		var result="none";
		if(empno == "${loginUser.empno}") result="visible";
		return result;
	},
	"signActive":function(pageNum){
		if(pageNum == replyPage) return 'active';
	}
	
});

function printPagination(pageMaker,target,templateObject){
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0; i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}
	pageMaker.pageNum=pageNum;
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template = Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html);
}

function replyRegist_go(){
// 	alert('click add btn');
	
	var empno=$('#newEmpno').val();
	var empnm=$('#newEmpnm').val();
	var acn=$('#newCn').val();
	var job_no=$('input[name="job_no"]').val();
	
	if(!acn){
		alert("내용은 필수입니다.");
		return;
	}
// 	alert(empno+":"+acn+":"+job_no);
	
	var data={
			"job_no":""+job_no+"",
			"empno":empno,
			"empnm":empnm,
			"acn":acn
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/replies",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(page){
			swal('댓글이 등록되었습니다.');
			
			getPage("<%=request.getContextPath()%>/replies/"+job_no+"/"+page);	//리스트 출력
			replyPage=page;
			$('#newCn').val("");
		},
		error:function(){
			swal('댓글 등록을 실패했습니다.');
		}
	});
	
}

// 댓글수정
function replyModifyModal_go(answer_no){
// 	alert(answer_no);
// 	var acn = $('div#'+answer_no+'-acn').text()
// 	var empno = $('a.'+answer_no+'-a').attr('data-empno');
// 	alert("answer_no:"+answer_no+"\nempno:"+empno+"\nacn:"+acn);
	$('div#modifyModal div.modal-body #acn').val($('div#'+answer_no+'-acn').text())
	$('div#modifyModal div.modal-header h4.modal-title').text(answer_no);
}
function replyModify_go(){
// 	alert('reply modify modal btn');
	
	var answer_no=$('.modal-title').text();
	var acn=$('#acn').val();
	
	var sendData={
			answer_no:answer_no,
			acn:acn 
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/replies/"+answer_no,
		type:"put",
		headers:{
			"X-HTTP-Method-Override":"PUT"
		},
		data:JSON.stringify(sendData),
		contentType:"application/json",
		success:function(result){
			swal("수정되었습니다.")
			.then((a) => {
				getPage("<%=request.getContextPath()%>/${job.job_no}/"+replyPage);
				location.reload();
			});
		},
		error:function(error){
			swal('수정 실패했습니다.');
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});

}
function replyRemove_go(){
//  alert("click remove btn");
 
 var answer_no = $('.modal-title').text();
  //	alert(answer_no);
//현재페이지번호와 answer_no를 파라미터로 붙여서 보냄
 $.ajax({
    url         : "<%=request.getContextPath()%>/replies/${job.job_no}/"+answer_no+"/"+replyPage,
    type      : "delete",
    headers:{
		"X-HTTP-Method-Override":"DELETE"
	},
    success      : function(page){
    	swal('삭제되었습니다.')
    	.then((a) => {
	       getPage("<%=request.getContextPath()%>/replies/${job.job_no}/"+page);
	       replyPage = page;
    	});
    },
    error      : function(error){
    	swal('삭제 실패했습니다.');
    },
    complete   : function(){
       $('#modifyModal').modal('hide');
    }
 });
}


/* page_upload  */
window.onload=function(){
	getPage("<%=request.getContextPath()%>/replies/${job.job_no}/"+replyPage);
	
	$('ul.pagination').on('click','li a',function(event){
// 		alert("click page number");
//		$(this) : event.currenttarget
		if($(this).attr("href")){     //이벤트는 해당이벤트만 가져오는게 아니라 해당이벤트가 발생된 Object까지가져옴
			replyPage=$(this).attr("href"); //여기서 this는 a태그
			getPage("<%=request.getContextPath()%>/replies/${job.job_no}/"+replyPage);
		}
		return false;
	})
}



</script>