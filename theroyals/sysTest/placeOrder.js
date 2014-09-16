/**
 * Created by amzad on 21/04/2014.
 * File Name: placeOrder.js
 * Sample Run :: casperjs test ../sysTest/placeOrder.js --url=http://theroyals.lc/ --imgDir='1' --wTime=5000
 * Sample Run :: casperjs test ../sysTest/placeOrder.js --url=http://al-aminrestaurant.co.uk --imgDir='2' --wTime=5000
 *
 *  Test Description
 *  =================
 *  PaymentType = Cash
 *  Discountcode= Amzad
 *  Reciving = Collection
 *
 *
 *
 * SIte Improvements..
 * ==================
 * Reset bag should reset current users bag. if user ID has not supplied.
 * each button should have css ID# to identify.
 * Load add data from DB on load.
 * keep site data cache
 * user data will load on request and all data will load from controller.
 * Order Processing site and admin site will be one section. And frontend separate.
 * background will be one image
 * All page should content footer .. to check page loaded successfully.
 * Keep user id, domain name, email address.  on each page if logged in. to read user id if required.
 *
 * Improve this script.
 * ====================
 * Place random items for order.
 *
 */


var IMG_SUB_DIR     = casper.cli.get('imgDir');
var WAITING_TIME    = casper.cli.get('wTime');
var BASE_URL        = casper.cli.get('url');
var IMG_DIR         = '/home/amzad/temp/placeOrder/'+IMG_SUB_DIR+'/';
var WAITING_TIME2   = WAITING_TIME+WAITING_TIME+WAITING_TIME;


casper.test.comment('IMG_DIR :: ' + IMG_DIR );
casper.test.comment('WAITING_TIME :: ' + WAITING_TIME  + ' WAITING_TIME2 :: ' + WAITING_TIME2 );


// Go to home
casper.test.comment('Go to home ' + BASE_URL );
casper.start(BASE_URL, function() {
    this.test.pass('Home was loaded');
    this.test.info(this.getCurrentUrl());
    this.test.pass(this.getTitle());
});
var pageLoadedSuccessfully = casper.waitUntilVisible('div[id="cj_footer"]');


// Click Menu on Home page
casper.then(function() {
    pageLoadedSuccessfully;
    this.wait(WAITING_TIME);
    this.test.info(this.getCurrentUrl());
    this.test.pass(this.getTitle());
    this.capture(IMG_DIR+'A_clickMenu.png');
    this.click('#cj_menu');
});
casper.then(function() {
    this.test.info(this.getCurrentUrl());
});
casper.then(function() {
    this.test.info(this.getCurrentUrl());
});
casper.then(function() {
    pageLoadedSuccessfully;
    this.wait(WAITING_TIME);
    this.test.info(this.getCurrentUrl());
    this.test.pass(this.getTitle());
    this.click('#cj_p1');
    this.capture(IMG_DIR+'B_addToCart_c1p1.png');
});
casper.then(function() {
    pageLoadedSuccessfully;
    this.wait(WAITING_TIME);
    this.test.info(this.getCurrentUrl());
    this.test.pass(this.getTitle());
    this.click('#cj_p3');
    this.capture(IMG_DIR+'B_addToCart_c1p3.png');
});


casper.then(function() {
    pageLoadedSuccessfully;
    this.wait(WAITING_TIME);
    this.test.info(this.getCurrentUrl());
    this.test.pass(this.getTitle());
    this.click('#cj_checkout');
    this.capture(IMG_DIR+'B_checkout.png');
});

casper.then(function() {
    pageLoadedSuccessfully;
    this.wait(WAITING_TIME);
    this.test.info(this.getCurrentUrl());
    this.test.pass(this.getTitle());
    this.evaluate(function() {
        document.querySelector('select#payMethod').selectedIndex = 2; //it is obvious
        return true;
    });
    casper.fill('form[name="cj_orderDetails"]', {
        'discount'      : 'Amzad',
        'orderNote'     : 'This is a automated test order. DO NOT COOK !!'
    });
    this.click('#cj_next');
    this.capture(IMG_DIR+'C_detailsPage.png');
});

casper.then(function() {
    pageLoadedSuccessfully;
    this.wait(WAITING_TIME);
    this.test.info(this.getCurrentUrl());
    this.test.pass(this.getTitle());
    this.capture(IMG_DIR+'D1_userDetailsPre.png');
    //casper.fill('form[name="cj_userInfo"]', {
    //    'email': 'amzadfof@gmail.com',
    //    'fname': 'Amzad',
    //    'lname': 'Mojumder',
    //    'phone': '07900642131',
    //    'houseNo': '48'
    //});

    casper.test.comment('>> email');
    casper.fill('form[name="cj_userDetails"]', {
        'email': 'amzadfof@gmail.com'
    });
    this.wait(WAITING_TIME2);
    this.wait(WAITING_TIME2);
    this.capture(IMG_DIR+'D2_userDetails.png');

    casper.test.comment('>> fname');
    casper.fill('form[name="cj_userDetails"]', {
        'fname': 'Amzad'
    });
    this.wait(WAITING_TIME2);
    this.capture(IMG_DIR+'D2_userDetails.png');

    casper.test.comment('>> lname');
    casper.fill('form[name="cj_userDetails"]', {
        'lname': 'Mojumder'
    });
    this.wait(WAITING_TIME2);
    this.capture(IMG_DIR+'D3_userDetails.png');

    casper.test.comment('>> phone');
    casper.fill('form[name="cj_userDetails"]', {
        'phone': '07900642131'
    });
    this.wait(WAITING_TIME2);
    this.capture(IMG_DIR+'D4_userDetails.png');

    casper.test.comment('>> houseNo');
    casper.fill('form[name="cj_userDetails"]', {
        'houseNo': '48'
    });
    this.wait(WAITING_TIME2);
    this.wait(WAITING_TIME2);
    this.click('#cj_next');
    this.capture(IMG_DIR+'D5_userDetailsPost.png');
});

casper.then(function() {
    pageLoadedSuccessfully;
    this.wait(WAITING_TIME);
    this.test.info(this.getCurrentUrl());
    this.test.pass(this.getTitle());
    this.click('#cj_next');
    this.capture(IMG_DIR+'E_confirmPage.png');
});

casper.then(function() {
    pageLoadedSuccessfully;
    this.wait(WAITING_TIME);
    this.test.info(this.getCurrentUrl());
    this.test.pass(this.getTitle());
    //this.click('#cj_next');
    this.capture(IMG_DIR+'F_orderPlacedPage.png');
});

casper.run(function() {
    this.test.done();
});