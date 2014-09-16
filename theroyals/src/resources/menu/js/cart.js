/*
 * cart JavaScript Library v1.3.2
 * http://conosurtek.co.uk/
 *
 * Copyright (c) 2009 Amzad Mojumder
 * Dual licensed under the MIT and GPL licenses.
 * http://docs.jquery.com/License
 *
 * Date: 2014-02-19 17:34:21 -0500
 * Revision: 6246
 */

/////////////////////   Config ...... /////////////////////////////
/* Order Details Page */
//setValue("/takeaway/collection_delivery_js", "#collectionDelivery" );
//setValue("/takeaway/day_js", "#day" );
setValue("/takeaway/time_js", "#time" );
setValue("/takeaway/discount_js", "#discount" );
setValue("/takeaway/payment_js", "#payMethod" );
setValue("/takeaway/order_note_js", "#orderNote" );
/* User Details Page */
setValue("/takeaway/email_js", "#email" );
setValue("/takeaway/fname_js", "#fname" );
setValue("/takeaway/lname_js", "#lname" );
setValue("/takeaway/phone_js", "#phone" );
/* Delivery Address Details Page */
setValue("/takeaway/house_no_js", "#houseNo" );
setValue("/takeaway/postcode_js", "#postcode" );
setValue("/takeaway/address1_js", "#address1" );
setValue("/takeaway/address2_js", "#address2" );
setValue("/takeaway/town_js", "#town" );
setValue("/takeaway/city_js", "#city" );
setValue("/takeaway/county_js", "#county" );
setValue("/takeaway/house_no_js", "#houseNo" );
setValue("/takeaway/address_instruction_js", "#addressInstruction" );

/////////////////////Collection / Delivery Selected/////////////////////////////
function setValue(urlUpdate, id ){
    $(id).change(function(){
        var form_data = {
            value: $(id).attr("value"),
            ajax: '1'
        };

        $.ajax({
            url: urlUpdate,
            type: 'GET',
            data: form_data,
            success: function(msg) {
                alertify.success(msg);
            }
        });
        return false;
    });
}

$("#collectionDelivery").change(function(){
    var form_data = {
        value: $("#collectionDelivery").attr("value"),
        ajax: '1'
    };

    $.ajax({
        url: "/takeaway/collection_delivery_js",
        type: 'GET',
        data: form_data,
        success: function(msg) {
            var obj = JSON.parse(msg);
            $('#day').html(obj.date);
            $('#time').html(obj.time);
            //console.log(obj.time);
            alertify.success(obj.alert);
        }
    });
    return false;
});

$("#day").change(function(){
    var form_data = {
        value: $("#day").attr("value"),
        ajax: '1'
    };

    $.ajax({
        url: "/takeaway/day_js",
        type: 'GET',
        data: form_data,
        success: function(msg) {
            var obj = JSON.parse(msg);
            $('#time').html(obj.time);
            //console.log(obj.time);
            alertify.success(obj.alert);
        }
    });
    return false;
});