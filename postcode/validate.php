<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 12/08/2015
 * Time: 12:10
 */ ?>

<script>
    function checkPostCode (toCheck) {
        var alpha1 = "[abcdefghijklmnoprstuwyz]";
        var alpha2 = "[abcdefghklmnopqrstuvwxy]";
        var alpha3 = "[abcdefghjkpmnrstuvwxy]";
        var alpha4 = "[abehmnprvwxy]";
        var alpha5 = "[abdefghjlnpqrstuwxyz]";

        var pcexp = new Array ();
        pcexp.push (new RegExp ("^(" + alpha1 + "{1}" + alpha2 + "?[0-9]{1,2})(\\s*)([0-9]{1}" + alpha5 + "{2})$","i"));
        pcexp.push (new RegExp ("^(" + alpha1 + "{1}[0-9]{1}" + alpha3 + "{1})(\\s*)([0-9]{1}" + alpha5 + "{2})$","i"));
        pcexp.push (new RegExp ("^(" + alpha1 + "{1}" + alpha2 + "{1}" + "?[0-9]{1}" + alpha4 +"{1})(\\s*)([0-9]{1}" + alpha5 + "{2})$","i"));
        pcexp.push (/^(GIR)(\s*)(0AA)$/i);
        pcexp.push (/^(bfpo)(\s*)([0-9]{1,4})$/i);
        pcexp.push (/^(bfpo)(\s*)(c\/o\s*[0-9]{1,3})$/i);
        pcexp.push (/^([A-Z]{4})(\s*)(1ZZ)$/i);
        var postCode = toCheck;
        var valid = false;
        for ( var i=0; i<pcexp.length; i++) {
            if (pcexp[i].test(postCode)) {
                pcexp[i].exec(postCode);
                postCode = RegExp.$1.toUpperCase() + " " + RegExp.$3.toUpperCase();
                postCode = postCode.replace (/C\/O\s*/,"c/o ");
                valid = true;
                break;
            }
        }
        alert (valid);
        if (valid) {return postCode;} else return false;
    }

    function validateUKPhone(phoneNo){
        phoneNo = phoneNo.replace(/\s/g, "") ;
        phoneNo = phoneNo.replace(/-/g,'') ;
        phoneNo = phoneNo.replace(/\)/g,'') ;
        phoneNo = phoneNo.replace(/\(/g,'') ;
        var no = /^(\(?(?:0(?:0|11)\)?[\s-]?\(?|\+)(44)\)?[\s-]?)?\(?0?(?:\)[\s-]?)?([1-9]\d{1,4}\)?[\d\s-]+)((?:x|ext\.?|\#)\d{3,4})?$/.test(phoneNo);
        alert(no + '  '+ phoneNo);
        // http://stackoverflow.com/questions/5286046/javascript-phone-number-validation
    }
</script>
<input type="button" value="Check Postcode" onclick="checkPostCode ('gu215ed');">
<input type="button" value="Check Phone" onclick="validateUKPhone ('447900642131');">



