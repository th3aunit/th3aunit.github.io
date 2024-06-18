<?php
header('Content-Type: text/plain');

if(!isset($queryString))
    $queryString = @$_SERVER['QUERY_STRING'];

if($queryString != '') {
    $queryString = str_replace('/', '_', $queryString);
    echo(filesize($queryString));
    return;
}

function filter_filenames(string $file) {
    $unlistedFiles = [
        '.htaccess',
        'index.php',
        'index.html',
        '..',
        '.'
    ];
    return !array_search($file, $unlistedFiles);
}

$items = scandir(getcwd());
$filteredItems = array_filter($items, 'filter_filenames');
echo implode("\n", $filteredItems);