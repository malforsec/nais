# Read parent CSV
$InputFilename = Get-Content '.\19530-emi-zeek-be6f052b-6738-48cd-b27d-c6fb60919fbb.json'
$OutputFilenamePattern = 'output_done_'
$LineLimit = 200000
# Initialize
$line = 0
$i = 0
$file = 0
$start = 0
# Loop all text lines
while ($line -le $InputFilename.Length) {
    # Generate child CSVs
    if ($i -eq $LineLimit -Or $line -eq $InputFilename.Length) {
        $file++
        $Filename = "$OutputFilenamePattern$file.json"
        $InputFilename[$start..($line - 1)] | Out-File $Filename -Force
        $start = $line;
        $i = 0
        Write-Host "$Filename"
    }
    # Increment counters
    $i++;
    $line++
}
