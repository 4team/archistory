
 
<div id="footer">
  <div class="container">
  </div>
</div>


	</body>
	
<!-- 클릭 메뉴들과 관련된 스크립트 -->
<script>

if(${memberno}){
	var memberno = ${memberno};
}else{
	var memberno = 0;
}

$("#mDrop").on("mouseover",function(){
    $(".dropdown-menu").show();
});

$("#main").on("mouseover",function(){
    $(".dropdown-menu").hide();
});


//admin myinfo page
$("#myInfo").on("click",function(){
	if(memberno !=0){
		$("#userInfo").toggle();
	}else{
		$("#loginModal").modal('show');
	}
});

//LI클릭해도 a클릭 먹히게...
$(".gn-menu").on("click","li",function(event){
	$(this)[0].lastChild.click();
});


	
	$("#joinBtn").on("click",function(){
		$("#joinModal").modal('show');
	});

    // 15일 5:29분부터 추가..
    $("#user").on("click",function(){
        $("#adminJoinDiv").hide();
        $("#userJoinDiv").show();
    });
    $("#admin").on("click",function(){
        $("#adminJoinDiv").show();
        $("#userJoinDiv").hide();
    });
    $("#showInfo").on("click",function(){
		if(memberno != 0){
			$.getJSON("http://14.32.66.127:4000/member/view?memberno="+memberno,function(data){
				var memberVO = $(data)[0];
				
				$("#proEmail").val(memberVO.email);
				$("#proName").val(memberVO.userName);
				
				var dbimg = memberVO.img;
				
				 if(dbimg==null){  
					   var imgTag=" <img class='img-circle' id='poto' src ='/img/profile.png'>";
						$("#imgDiv").html(imgTag); 
				   }else{
				   
					   var imgAddr="http://14.32.66.127:4000/displayFile?fileName=/member/"+dbimg;
					   var imgTag1="<img class='img-circle' id='poto' src ='"+imgAddr+"'>";
						$("#imgDiv").html(imgTag1); 
				   }
				   
				
			})
   			$("#myProfileModal").modal('show');
		}
	});

	
	$("#myPage").on("click",function(){
		$("#finishedDiv").html("");
		
		$.getJSON("http://14.32.66.127:4000/participate/finishList?memberno="+memberno,function(data){

			var list = $(data);
			
			list.each(function(){
				
				var str ="<center><pre onclick='viewFinishRoute("+this.routeno+",0)'>"+this.routename+"</pre></center>";
				$("#finishedDiv").append(str);
				
			});
			
		})

			$("#myPageModal").modal('show');
	});

</script>

	
	
	 <!-- Core JavaScript Files -->
	<script src="/js/classie.js"></script>
	<script src="/js/gnmenu.js"></script>
	<script src="/js/jquery.scrollTo.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/js/custom.js"></script>
</html>