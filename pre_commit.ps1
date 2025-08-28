Write-Host "=== PowerShell Script: Adding headers to .cs and C++ files ==="

$author = "Nikolay Dvurechensky"
$commitCount = git rev-list --count HEAD
$date = Get-Date -Format "dd MMMM yyyy HH:mm:ss"
$version = "1.0.$commitCount"
$logFile = "pre_commit.log"
$extensions = @(".cs", ".cpp", ".h", ".hpp", ".ts")

Add-Content -Path $logFile -Value "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] === Commit Start ==="

# Чёткий паттерн только для заголовка
$headerPattern = '/\*\s*\* Author:.*?\* Last Updated:.*?\* Version:.*?\*/'
$headerRegex = [regex]::new($headerPattern, 'Singleline')

$newHeader = @"
/*
 * Author: $author
 * Site: https://sites.google.com/view/dvurechensky
 * Gmail: dvurechenskysoft@gmail.com
 * Last Updated: $date
 * Version: $version
 */
"@

# Поиск файлов и добавление/обновление заголовка
Get-ChildItem -Recurse -File | Where-Object { $extensions -contains $_.Extension.ToLower() } | ForEach-Object {
    $file = $_.FullName
    $content = Get-Content -Path $file -Raw

    if ($headerRegex.IsMatch($content)) {
        $content = $headerRegex.Replace($content, $newHeader)
        Write-Host "[UPDATE] $file"
        Add-Content -Path $logFile -Value "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] UPDATED HEADER: $file"
    } else {
        $content = $newHeader + "`n`n" + $content
        Write-Host "[ADD] $file"
        Add-Content -Path $logFile -Value "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] ADDED HEADER: $file"
    }

    [System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
    git add $file
}

Add-Content -Path $logFile -Value "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] === Commit End ==="
