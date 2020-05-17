<?php

function echoEvent($event){
    $feed = buzz();
    return $feed;
    
}

function buzz(){
 $client = new GuzzleHttp\Client();
 $res = $client->request('GET', 'http://www.buzzfeed.com/api/v2/feeds/news');
 $body = (string) $res->getBody() ;
 return $body ;
}
