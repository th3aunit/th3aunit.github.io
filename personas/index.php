<?php
    header('Content-Type: text/plain');

    if(!isset($queryString))
        $queryString = $_SERVER['QUERY_STRING'];

    if($queryString != '') {
        $queryString = str_replace('/', '_', $queryString);
        echo(filesize($queryString));
        return;
    }

    $items = scandir(getcwd());
    array_splice($items, array_search('.htaccess', $items), 1);
    array_splice($items, array_search('index.php', $items), 1);
    array_splice($items, array_search('..', $items), 1);
    array_splice($items, array_search('.', $items), 1);
    echo implode('\n', $items);