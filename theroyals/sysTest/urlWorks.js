/**
 * Created by amzad on 23/01/14.
 * File Name : urlWorks.js
 * Sample Run :: casperjs /home/amzad/dev/casperJS/src/cwaiter/urlWorks.js --rootDir=/home/amzad/temp --dirName=defaultDidName --img=defaultImgPrefix  --domain=http://bccwl.co.uk
 * Run2 :: /home/amzad/dev/casperJS/src/cwaiter/visiteSite.sh http://bccwl.co.uk
 *
 * SIte Improvements..
 * ==================
 * Travel through all the urls founds on the given url
 * Save all the urls screen shoot
 * Save the urls to given directory urls.txt
 * Save all urls with travel time and image ID in a log file log.txt
 * Set default URL if URL not found.
 *
 *
 *
 *
 * Improve this script.
 * ====================
 * Travel through all the urls
 *
 */




//Important debug tools
//var utils = require('utils');
//require("utils").dump(casper.cli.options);
//var domain = utils.dump(casper.cli.get('domain'));
//this.capture('screenshot.png');
//console.log('Cutrrent URL :  ' + this.getCurrentUrl());




var casper = require('casper').create({
    logLevel:"verbose",
    debug:true
});
var links;

var d = new Date();
var time = d.getFullYear() +':'+  d.getMonth() +':'+ d.getDate() +':' +  d.getHours()  +':' + d.getMinutes() + ':' +  d.getSeconds();


var domain = (casper.cli.get("domain") != null ? casper.cli.get("domain") : "http://bccwl.co.uk"); // Get domain name from cli
var imgPrefix = (casper.cli.get("img") != null ? casper.cli.get("img") : "--img_NotDefined"); // Get domain name from cli
var rootDir = (casper.cli.get("rootDir") != null ? casper.cli.get("rootDir") : "/home/amzad/temp"); // Get rootDir from cli
var imgDir = (casper.cli.get("dirName") != null ? casper.cli.get("dirName") : time); // Get dirName from cli

var dir = rootDir + '/' + imgDir;
var logFile = dir +'/'+ 'log.txt';
var urlList = dir +'/'+ 'urls.txt';
imageId=1001;

var fs = require('fs');
fs.makeDirectory(dir);

console.log( '\n Current URL :: ' +  domain );
console.log( ' Image Will be saved to  ::  ' +  dir );
console.log('\n Please wait .... \n');



casper.start(domain);

casper.then(function getLinks(){
    links = this.evaluate(function(){
        var links = document.getElementsByTagName('a');
        links = Array.prototype.map.call(links,function(link){
            return link.getAttribute('href');
        });
        return links;
    });
});

casper.then(function(){
    this.each(links,function(self,link){
        self.thenOpen(link,function(a){
            var url = this.getCurrentUrl();
            this.echo(url);
            var imageName = url.replace("http://","");
            var imageName = imageName.replace(/\//g, ':');

            var d = new Date();
            var line =  d.getMinutes() + ':' +  d.getSeconds() + ' :: ' + imageName + ' :: ' + url + '\n';
            var urls = url + '\n';

            this.capture(  dir + '/' + imageName + '.png' );

            try {
                fs.write(logFile, line , 'a');
                fs.write(urlList, urls , 'a');
            } catch(e) {
                console.log(e);
            }
            imageId++;
        });
    });
});

casper.run(function(){
    this.exit();
});

