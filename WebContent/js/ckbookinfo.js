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
        alert("带*号的必须填写");
		document.myform.bookname.select();
        return false;
    }
    
    if (au.value == "") {
        alert("带*号的必须填写");
		document.myform.author.select();
        return false;
    }
   
    if (pr.value == "") {
        alert("带*号的必须填写");
		document.myform.press.select();
        return false;
    }
	
	 if (bc.value == "") {
        alert("带*号的必须填写");
		document.myform.barcode.select();
        return false;
    }else if (isNaN(bc.value)) {
        alert("JSBN编号必须是数字");
		document.myform.barcode.select();
        return false;
    }
   
    if (lm.value == "") {
        alert("带*号的必须填写");
		document.myform.learnumber.select();
        return false;
    }else if (isNaN(lm.value)) {
		alert("页数必须是数字");
		document.myform.learnumber.select();
		return false;
	}
    if (fm.value == "") {
        alert("带*号的必须填写");
		document.myform.fixedmoney.select();
        return false;
    }else if (isNaN(fm.value)) {
            alert("价格必须是数字");
			document.myform.fixedmoney.select();
            return false;
    }  
}

