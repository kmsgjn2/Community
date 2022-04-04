function checks() {
	
	let name = $('#name').val();
	let id = $('#id').val();
	let pw = $('#pw').val();
	let idCheckStatus = $('#idCheckStatus').val();
	
	$('#name_check').text('');
	$('#id_check').text('');
	$('#pw_check').text('');
	
	if (name == "") {
		$('#name').focus();
		$('#name_check').text('이름을 입력해주세요!');
		$('#name_check').css('color', 'red');
		return false;
	}
	
	if (id == "") {
		$('#id').focus();
		$('#id_check').text('아이디를 입력해주세요!');
		$('#id_check').css('color', 'red');
		return false;
	}
	
	if (pw == "") {
		$('#pw').focus();
		$('#pw_check').text('비밀번호를 입력해주세요!');
		$('#pw_check').css('color', 'red');
		return false;
	}
	
	if (idCheckStatus == "false") {
		$('#id').focus();
		$('#id_check').text('아이디를 중복확인해주세요!');
		$('#id_check').css('color', 'red');
		return false;
	}
	
	return true;
}

function idCheck() {
	
	let id = $('#id').val();
	
	if (id.length == 0) {
		$('#id').focus();
		$('#id_check').text('아이디를 입력해주세요!');
		$('#id_check').css('color', 'red');
	} else {
		$.ajax({
			url : '/Community/member/idCheck?member_id=' + id,
			type : 'post',
			success : function(result) {
				if (result == true) {
					$('#id_check').text('사용할 수 있는 아이디입니다!');
					$('#id_check').css('color', 'green');
					$('#idCheckStatus').val('true');
				} else {
					$('#id_check').text('사용할 수 없는 아이디입니다!');
					$('#id_check').css('color', 'red');
				}
			}, error : function() {
				console.log('Ajax 에러!');
			}
		});		
	}
}

function idCheckReset() {
	$('#idCheckStatus').val('false');
}