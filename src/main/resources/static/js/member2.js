
var formSubmitListener = function(e) { e.preventDefault(); };



// 휴대폰 번호 입력란에서 포커스 아웃 될 때 유효성 검사 수행
document.getElementById("phoneNumber").addEventListener("blur", function() {
    var phoneNumber = document.getElementById("phoneNumber").value;
    var phoneNumberInput = document.getElementById("phoneNumberInput");
    var phoneNumberCheckInput = document.getElementById("phoneNumberCheckInput");

    var phonePattern = /^010\d{8}$/;
    if (!phonePattern.test(phoneNumber)) {
        phoneNumberInput.innerHTML = "휴대폰 번호는 (-)을 빼고 010으로 시작하며, 총 숫자 11자리여야 합니다.";
        phoneNumberInput.style.color = "red";
    } else {
        phoneNumberInput.innerHTML = "";
    }
  
    // AJAX 요청 수행
    $.ajax({
        url: "/member/verificationphonenumber", // 실제 사용하는 URL로 변경 필요
        type: "post",
        async: true,
        data: { phoneNumber: phoneNumber },
        dataType: "text",
        success: function(data, textStatus) {
            if (data === "true") {
                phoneNumberCheckInput.innerHTML = "이미 사용 중인 번호입니다.";
                phoneNumberCheckInput.style.color = "red";
            } else {
                phoneNumberCheckInput.innerHTML = "사용 가능한 번호입니다.";
                phoneNumberCheckInput.style.color = "blue";
            }
        }
    });
   
});

function check() {
    var agreementCheckbox = document.getElementById("agreement");
    if (!agreementCheckbox.checked) {
        alert("회원가입 약관 및 개인정보 수집 및 이용에 동의해야 합니다.");
    }
}




function reconfirmation(){
	
	
    var phoneNumber = document.getElementById("phoneNumber").value;
	
    var phoneNumberCheckInput = document.getElementById("phoneNumberCheckInput");
   
   //휴대폰 유효성 검사 수행
    var phonePattern = /^010\d{8}$/;
//	//휴대폰 확인   
    if (!phonePattern.test(phoneNumber)) {return false;}
    
//    //번호 중복시 확인
    if(phoneNumberCheckInput.innerHTML === "이미 사용 중인 번호입니다."){return false;}
//    
    return true;
    
	
	
}



// 회원가입 버튼 클릭 시 전체 유효성 검사 수행
//document.querySelector('form').addEventListener('submit', function(e) {
//    if (!validateMemberForm() || !check()) {
//       formSubmitListener(e);
//    }
//});
