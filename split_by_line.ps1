
## find num of lines in file cmd: type BigDataFile.csv | find /v /c ""
### find num of lines in file PS: (Get-Content .\BigDataFile.csv).Length

# Read parent file
$InputFilename = Get-Content '.\file_to_split.json'
$OutputFilenamePattern = 'output_done_'
$LineLimit = 200000
# Initialize
$line = 0
$i = 0
$file = 0
$start = 0
# Loop all text lines
while ($line -le $InputFilename.Length) {
    # Generate child files
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
