
var action = '';
var url = '';
var type = '';
var bno = 0;
 
$(document).ready(function(){
 
	//n자 남음 구현
	$(function() {
		$('.mml-title').keyup(function(e) {
			var content = $(this).val();
			$(this).height(
				((content.split('\n').length + 1) * 1.5) + 'em');
				$('#counter').html(content.length);
		});
		$('.mml-title').keyup();
	});
	
	

    // 새 글 쓰기 버튼 클릭
    /*$("#createBtn").click(function(){
    	alert('btn');
        action='create';
        type = 'POST'
        $("#modal-title").text("새 글 작성");
        $("#myModal").modal();
    });
    
    // Modal의 Submit 버튼 클릭
    $("#modalSubmit").click(function(){
        
        if(action == 'create'){
            bno = 0;
            url = '/board';
        }else if(action == 'modify'){
            url = '/board';
        }
 
        var data = {
            "bno" : bno,
            "userName" : $("#userName").val(),
            "contents" : $("#contents").val()
        };
        
        $.ajax({
            url : url,
            type : type,
            data : data,
            success: function(data){ $("#myModal").modal('toggle'); },
            complete: function(data){
            	$("#myModal").modal('toggle');
            	location.reload(); }
        })
    });
    */
 
});