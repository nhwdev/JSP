function input_check(f) {
    // f: <form ...>
    // f.id : form 객체의 하위 태그중 name="id"인 태그
    // f.id.value : id 태그의 입력된 값. String 객체
    if (f.id.value.trim() == "") {
        alert("아이디를 입력하세요.");
        f.id.focus();
        return false;
    }

    if (f.pass.value.trim() == "") {
        alert("비밀번호를 입력하세요.");
        f.pass.focus();
        return false;
    }

    if (f.name.value.trim() == "") {
        alert("이름을 입력하세요.");
        f.name.focus();
        return false;
    }

    if (!isValidTel(f.tel.value)) {
        alert("전화번호 형식이 아닙니다.");
        f.tel.focus();
        return false;
    }

    if (!isValidEmail(f.email.value)) {
        alert("이메일 형식이 아닙니다.");
        f.email.focus();
        return false;
    }
    return true;
}
function isValidEmail(email) {
    const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return regex.test(email);
}
function isValidTel(tel) {
    const regex = /^(02|01[016789])-?\d{3,4}-?\d{4}$/;
    return regex.test(tel);
}
function win_upload() {
    let op = "width=500, height=500, left=50, top=150";
    open("pictureForm.jsp", "", op);
}