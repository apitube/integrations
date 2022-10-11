<?php

$request = new HttpRequest();
$request->setUrl('https://apitube.io/v1/sets/76521250');
$request->setMethod(HTTP_METH_GET);

$request->setQueryData([
    'currency_code' => 'HELLO'
]);

$request->setHeaders([
    'key' => 'KEY'
]);

try {
    $response = $request->send();

    echo $response->getBody();
} catch (HttpException $ex) {
    echo $ex;
}
