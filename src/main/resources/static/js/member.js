
var formSubmitListener = function(e) { e.preventDefault(); };

// 중복확인 버튼 클릭 시 아이디 유효성 검사 및 AJAX 요청 수행
document.getElementById("btn_id").addEventListener("click", function() {
    var customerId = document.getElementById("customerId").value;
    var customerIdInput = document.getElementById("customerIdInput");
    var customerverificationId = document.getElementById("customerverificationId");
   
   // 아이디 길이가 5 이상 20 이하여야 함
	 if (customerId.length < 5 || customerId.length > 20) {
        customerIdInput.innerHTML = "아이디는 5글자 이상 20글자 이하여야 합니다.";
        customerIdInput.style.color = "red";
    } else {
		customerIdInput.innerHTML = "";
	}
	
	
    // 아이디에 한글이나 특수문자가 포함되지 않도록 정규식 검사
    var idPattern = /^[a-zA-Z0-9]+$/;
    if (!idPattern.test(customerId)) {
        customerIdInput.innerHTML = "아이디에는 영문 대소문자와 숫자만 사용 가능합니다.";
        customerIdInput.style.color = "red";
    }

   
    // AJAX 요청 수행
    $.ajax({
        url: "/member/verificationid", // 실제 사용하는 URL로 변경 필요
        type: "post",
        async: true,
        data: { customerId: customerId },
        dataType: "text",
        success: function(data, textStatus) {
            if (data === "true") {
                customerverificationId.innerHTML = "이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.";
                customerverificationId.style.color = "red";
                // 이미 사용 중인 아이디일 경우 폼 제출 막기
                formSubmitListener(e);
            } else {
                customerverificationId.innerHTML = "사용 가능한 아이디입니다.";
                customerverificationId.style.color = "blue";
            }
        }
    });
});


// 비밀번호 입력란에서 입력 감지하여 유효성 검사 수행
document.getElementById("password").addEventListener("input", function() {
    var password = document.getElementById("password").value;
    var passwordInput = document.getElementById("passwordInput");
console.log(password)
    // 비밀번호 유효성 검사 수행
    var containsNumber = /\d/.test(password);
    var containsLetter = /[a-zA-Z]/.test(password);
    var containsSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);

    if (password.length < 6 || !containsNumber || !containsLetter || !containsSpecial) {
        passwordInput.innerHTML = "비밀번호는 최소 8자 이상이어야 하며, 숫자, 문자, 특수문자를 모두 포함해야 합니다.";
        passwordInput.style.color = "red";
        formSubmitListener(e);
    } else {
        passwordInput.innerHTML = "";

    }
});

// 비밀번호 확인란에서 포커스 아웃 될 때 유효성 검사 수행
document.getElementById("confirmPassword").addEventListener("blur", function() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var confirm_passwordInput = document.getElementById("confirmPasswordInput");

    if (password !== confirmPassword) {
        confirm_passwordInput.innerHTML = "비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
        confirm_passwordInput.style.color = "red";
        formSubmitListener(e);
    } else {
        confirm_passwordInput.innerHTML = "";
    }
});

// 이름 입력란에서 포커스 아웃 될 때 유효성 검사 수행
document.getElementById("name").addEventListener("blur", function() {
    var name = document.getElementById("name").value;
    var nameInput = document.getElementById("nameInput");

    if (name.length < 2 || name.length > 8) {
        nameInput.innerHTML = "이름은 2글자 이상 8글자 이하여야 합니다.";
        nameInput.style.color = "red";
        formSubmitListener(e);
    } else {
        nameInput.innerHTML = "";
    }
});

// 이메일 입력란에서 포커스 아웃 될 때 유효성 검사 수행
document.getElementById("email").addEventListener("blur", function() {
    var email = document.getElementById("email").value;
    var emailInput = document.getElementById("emailInput");
    var emailCheckInput = document.getElementById("emailCheckInput");
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!emailPattern.test(email)) {
        emailInput.innerHTML = "올바른 이메일 형식이 아닙니다.";
        emailInput.style.color = "red";
        formSubmitListener(e);
    } else {
        emailInput.innerHTML = "";
    }
    
    // AJAX 요청 수행
    $.ajax({
        url: "/member/verificationemail", // 실제 사용하는 URL로 변경 필요
        type: "post",
        async: true,
        data: { email: email },
        dataType: "text",
        success: function(data, textStatus) {
            if (data === "true") {
                emailCheckInput.innerHTML = "이미 사용 중인 이메일입니다.";
                emailCheckInput.style.color = "red";
            } else {
                emailCheckInput.innerHTML = "사용 가능한 이메일입니다.";
                emailCheckInput.style.color = "blue";
            }
        }
    });
    
    
    
    
});

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
	
	
	var customerId = document.getElementById("customerId").value;
	console.log(customerId)
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var phoneNumber = document.getElementById("phoneNumber").value;
    var agreementCheckbox = document.getElementById("agreement");
	
//    var customerIdInput = document.getElementById("customerIdInput");
    var customerverificationId = document.getElementById("customerverificationId");
//    var passwordInput = document.getElementById("passwordInput");
//    var confirm_passwordInput = document.getElementById("confirm_passwordInput");
//    var nameInput = document.getElementById("nameInput");
//    var emailInput = document.getElementById("emailInput");
     var emailCheckInput = document.getElementById("emailCheckInput");
    var phoneNumberCheckInput = document.getElementById("phoneNumberCheckInput");
   
   // 비밀번호 유효성 검사 수행
    var containsNumber = /\d/.test(password);
    var containsLetter = /[a-zA-Z]/.test(password);
    var containsSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
   //이메일 유효성 검사 수행
   var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
   //휴대폰 유효성 검사 수행
    var phonePattern = /^010\d{8}$/;
   // 아이디 길이가 5 이상 20 이하여야 함
	 if (customerId.length < 5 || customerId.length > 20) {return false;  } 
	
	
    // 아이디에 한글이나 특수문자가 포함되지 않도록 정규식 검사
    var idPattern = /^[a-zA-Z0-9]+$/;
    if (!idPattern.test(customerId)) {return false;  }
	
//	
//	//비밀번호
    if (password.length < 6 || !containsNumber || !containsLetter || !containsSpecial) {return false; } 
//	
//	//비밀번호 확인
    if (password !== confirmPassword) {return false; } 
//	
//	//이름 확인
    if (name.length < 2 || name.length > 8) {return false; }
//    
//     //이메일 확인
    if (!emailPattern.test(email)) {return false; }
//
//	//휴대폰 확인   
    if (!phonePattern.test(phoneNumber)) {return false;}
//	 
//	 //체크박스 확인
    if (!agreementCheckbox.checked) {return false; }
//    
    //아이디 중복시 확인
    if(customerverificationId.innerHTML === "이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요."){return false;}
    //이메일 중복시 확인
    if(emailCheckInput.innerHTML === "이미 사용 중인 이메일입니다."){return false;}
//    
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
