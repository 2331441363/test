/**
 * @author student
 */


function checknull(){
    var bn = document.myform.bookname;
    var au = document.myform.author;
    var pr = document.myform.press;
    var bc = document.myform.barcode;
    var lm = document.myform.learnumber;
    var fm = document.myform.fixedmoney;
    
    if (bn.value == "") {
        alert("��*�ŵı�����д");
		document.myform.bookname.select();
        return false;
    }
    
    if (au.value == "") {
        alert("��*�ŵı�����д");
		document.myform.author.select();
        return false;
    }
   
    if (pr.value == "") {
        alert("��*�ŵı�����д");
		document.myform.press.select();
        return false;
    }
	
	 if (bc.value == "") {
        alert("��*�ŵı�����д");
		document.myform.barcode.select();
        return false;
    }else if (isNaN(bc.value)) {
        alert("JSBN��ű���������");
		document.myform.barcode.select();
        return false;
    }
   
    if (lm.value == "") {
        alert("��*�ŵı�����д");
		document.myform.learnumber.select();
        return false;
    }else if (isNaN(lm.value)) {
		alert("ҳ������������");
		document.myform.learnumber.select();
		return false;
	}
    if (fm.value == "") {
        alert("��*�ŵı�����д");
		document.myform.fixedmoney.select();
        return false;
    }else if (isNaN(fm.value)) {
            alert("�۸����������");
			document.myform.fixedmoney.select();
            return false;
    }  
}

