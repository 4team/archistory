
 
<div id="footer">
  <div class="container">
  </div>
</div>


	</body>
	
<!-- 클릭 메뉴들과 관련된 스크립트 -->
<script>
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

</script>

	
	
	 <!-- Core JavaScript Files -->
	<script src="/js/classie.js"></script>
	<script src="/js/gnmenu.js"></script>
	<script src="/js/jquery.scrollTo.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/js/custom.js"></script>
</html>