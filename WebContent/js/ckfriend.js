/**
 * @author student
 */
function ckfriend(){
    var fn = document.myform.fname;
    var age = document.myform.age;
    var tel = document.myform.tel;
    if (fn.value == "") {
        alert("带*号的必须填写");
        document.myform.fname.select();
        return false;
    }
    if (age.value == "") {
        alert("带*号的必须填写");
        document.myform.age.select();
        return false;
    }
    else 
        if (isNaN(age.value)) {
            alert("年龄只能为数字");
            document.myform.age.select();
            return false;
            
        }
        else 
            if ((age.value <= 0 || age.value > 150)) {
                alert("您输入的年龄不合法,年龄大于0小于150");
                document.myform.age.select();
                return false;
            }
    
    if (tel.value == "") {
        alert("带*号的必须填写");
        document.myform.tel.select();
        return false;
    }
    else 
        if (isNaN(tel.value)) {
            alert("电话号码只能为数字");
            document.myform.tel.select();
            return false;
        }
        else 
            if (tel.value.length < 6 || tel.value.length > 11) {
                alert("电话号码的长度大于6位小于11位");
                document.myform.tel.select();
                return false;
            }
}
