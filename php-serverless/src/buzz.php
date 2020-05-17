<?php

function buzz($event){
    $feed = buzzFeed();
    return $feed;
    
}

function buzzFeed(){
 $client = new GuzzleHttp\Client();
 $res = $client->request('GET', 'http://www.buzzfeed.com/api/v2/feeds/news');
 $body = (string) $res->getBody() ;
 return $body ;
}
