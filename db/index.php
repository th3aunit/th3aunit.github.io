<?php

declare(strict_types=1);

namespace FileListingScript;

/**
 * List of files and directories to exclude from the listing
 */
const EXCLUDE_LIST = [
    '.',
    '..',
    '.htaccess',
    'index.php',
    'index.html',
];

header('Content-Type: text/plain');

$queryString = $_SERVER['QUERY_STRING'] ?? '';

if ($queryString !== '') {
    handleFileSize($queryString);
} else {
    listFiles();
}

/**
 * Handle file size request
 *
 * @param string $queryString
 * @return void
 */
function handleFileSize($queryString)
{
    $filename = htmlspecialchars($queryString, ENT_QUOTES, 'UTF-8');
    $filename = basename($filename);
    $filePath = __DIR__ . DIRECTORY_SEPARATOR . $filename;
    
    if (is_file($filePath)) {
        echo filesize($filePath);
    } else {
        echo "File not found or is not accessible.";
    }
}

/**
 * List files in the current directory
 *
 * @return void
 */
function listFiles()
{
    $items = scandir(__DIR__) ?: [];
    $filteredItems = array_filter(
        $items,
        function ($item) {
            return !in_array($item, EXCLUDE_LIST, true)
                && is_file(__DIR__ . DIRECTORY_SEPARATOR . $item);
        }
    );

    echo implode("\n", $filteredItems);
}