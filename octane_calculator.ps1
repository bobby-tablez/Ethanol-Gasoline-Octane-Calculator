$ethPercent = Read-Host "Enter the percentage of ethanol in the mixture (e.g. 75)"

if (($ethPercent -lt 0) -or ($ethPercent -gt 100)) {
    Write-Host "Error: Invalid percentage value entered."
    exit
}

$gasPercent = 100 - $ethPercent
$gasOctInt = Read-Host "Enter the octane rating of the gasoline (e.g. 91)"
[int]$gasOct = $gasOctInt

if ($gasOct -lt 0) {
    Write-Host "Error: Invalid octane rating entered."
    exit
}

if ( $ethPercent -eq 0) {
    $octRating = $gasOct
} else {
    $octRating = ($gasOct * $gasPercent / 100) + (113 * $ethPercent / 100)
}

$octRating = [Math]::Round($octRating, 2)

Write-Host "The octane rating of a mixture of $ethPercent% ethanol and $gasPercent% gasoline with an octane rating of $gasOct is $octRating."
