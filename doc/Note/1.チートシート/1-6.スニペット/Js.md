# Snippet

## Class
    (function(ns, w, d) {

    ns.YourName = initialize;
    ns.YourName.prototype = {
        run: run
    };

    function initialize(options){
        
    }
    
    function run(){
        var self = this;
        
    }

    })(this, this, document);

## HTML
    $(document).ready(function() {
        var yourName = new YourName();
        yourName.run();
    });

## dialog
    $('#dialog').css('top', $(w).scrollTop() + ($(w).height() / 2) + 'px');
    
    #dialog {
        position: absolute;
        /*display: none;*/
        left: 50%;
        top: 50%;
        margin-top: -40px;
        margin-left: -150px;
        padding: 20px;
        width: 300px;
        border: 2px solid black;
        background-color: white;
        text-align: center;
    }

## queryParameters
    function queryParameters(){
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for(var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    }
