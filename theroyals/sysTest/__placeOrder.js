 /**
 * Created by amzad on 21/04/2014.
 * File Name: placeOrder.js
 * Sample Run :: casperjs test placeOrder.js --domain=http://theroyals.lc
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




//var utils = require('utils');
//require("utils").dump(casper.cli.options);
//var domain = utils.dump(casper.cli.get('domain'));


casper.start();
var dir = '/home/amzad/temp/placeOrder';

var domain = casper.cli.get("domain");  // Get domain name from cli
var Menu2 = domain + '/takeaway/menu/2';
console.log(" Menu2 : ", Menu2 );
var checkoutUrl = domain + '/takeaway/checkout';
var titleTest = 'Placing an order with ' + domain;
var resetFoodBag = domain + '/takeaway/reset_bag/AAA1786';
var pageLoadedSuccessfully = casper.waitUntilVisible('div[id="footer"]');


var timeOut = 20000;
var totalTest= 2;
var totalTime = timeOut * totalTest;

// Set timeOut :: How long should wait for response from browser
// Time out value is too long, working to make it shorter. by optimizing the APP.
casper.options.waitTimeout = timeOut;


console.log(' Time out ' + timeOut + '\n Maximum time required ' + totalTime);


casper.test.begin(titleTest, totalTest, function suite(test) {
    casper.start(Menu2, function() {
    });


//    Clearing existing cart if there is any
    casper.thenOpen(Menu2, function(response) {   /* require('utils').dump(response); */ });


//    Go to Menu page and add some order.
    casper.then(function() {
        pageLoadedSuccessfully;

        this.capture(  dir + '/' +  'Menu1.png' );
//        this.capture('google.png');
        console.log('Cutrrent URL :  ' + this.getCurrentUrl());


        test.assertSelectorHasText("title", 'Menu');
        this.click('input[prod_id="2"]');
        pageLoadedSuccessfully;
//        this.click('input[prod_id="3"]');
//        pageLoadedSuccessfully;
//        this.click('input[prod_id="4"]');
//        pageLoadedSuccessfully;

        pageLoadedSuccessfully;
//        this.click('a[href="'+ checkoutUrl +'"]');
    });


    // Checkout Page
    casper.then(function() {
        pageLoadedSuccessfully;
        this.capture(  dir + '/' + 'Menu5.png' );
        test.assertSelectorHasText('title', 'Menu');
        this.click('input[prod_id="4"]');
        pageLoadedSuccessfully;
    });

/*
    // Checkout Page
    casper.then(function() {
        pageLoadedSuccessfully;
        test.assertSelectorHasText('title', ':: Checkout ::');
        this.click('input[value="Confirm"]');
    });

    // Confirm Page
    casper.then(function() {
        pageLoadedSuccessfully;
        test.assertSelectorHasText('title', ':: Confirm ::');
        this.click('input[value="Send To Kitchen"]');
    });

    // Order Page
    casper.then(function() {
        pageLoadedSuccessfully;
        pageLoadedSuccessfully;
        test.assertSelectorHasText('title', ':: Order ::');
        this.click('img[src="/cono/images/system/reorder.png"]');
        console.log('Ordering a Meal Like This');
        pageLoadedSuccessfully;
    });

    //Checkout page
    casper.then(function() {
        pageLoadedSuccessfully;
        pageLoadedSuccessfully;
        test.assertSelectorHasText('title', ':: Checkout ::');
        this.click('input[value="Confirm"]');
    });

    // Confirm Page
    casper.then(function() {
        pageLoadedSuccessfully;
        pageLoadedSuccessfully;
        test.assertSelectorHasText('title', ':: Confirm ::');
        this.click('input[value="Send To Kitchen"]');
    });

    // Order Page
    casper.then(function() {
        test.assertSelectorHasText('title', ':: Order ::');
        console.log('Reoder Succeeded...!! ');
    });
*/

    casper.run(function() {
        test.done();
    });
});
