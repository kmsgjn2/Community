function check() {
	
	let writer_idx = document.getElementById("writer_idx").value;
	
	if (writer_idx != null) {
		return true;
	}
	
	alert('로그인 후 작성 가능합니다');
	
	return false;
}