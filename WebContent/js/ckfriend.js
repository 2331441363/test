/**
 * @author student
 */
function ckfriend(){
    var fn = document.myform.fname;
    var age = document.myform.age;
    var tel = document.myform.tel;
    if (fn.value == "") {
        alert("��*�ŵı�����д");
        document.myform.fname.select();
        return false;
    }
    if (age.value == "") {
        alert("��*�ŵı�����д");
        document.myform.age.select();
        return false;
    }
    else 
        if (isNaN(age.value)) {
            alert("����ֻ��Ϊ����");
            document.myform.age.select();
            return false;
            
        }
        else 
            if ((age.value <= 0 || age.value > 150)) {
                alert("����������䲻�Ϸ�,�������0С��150");
                document.myform.age.select();
                return false;
            }
    
    if (tel.value == "") {
        alert("��*�ŵı�����д");
        document.myform.tel.select();
        return false;
    }
    else 
        if (isNaN(tel.value)) {
            alert("�绰����ֻ��Ϊ����");
            document.myform.tel.select();
            return false;
        }
        else 
            if (tel.value.length < 6 || tel.value.length > 11) {
                alert("�绰����ĳ��ȴ���6λС��11λ");
                document.myform.tel.select();
                return false;
            }
}
