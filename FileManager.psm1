class FileManager {
    
    static [void] CreateFolder([string] $folderPath)
    {
        if(Test-Path $folderPath) { throw "Foder $folderPath already exists!"} 
        else { New-Item -ItemType Directory -Path "$PSScriptRoot\TestFiles" -ErrorAction Stop }
    }

    static [void] CreateTestFile ([string] $filePath, [int] $fileSizeKb)
    {
        $byteArray = New-Object -TypeName Byte[] -ArgumentList $fileSizeKb
        $randomGenerator = New-Object -TypeName System.Random
        $randomGenerator.NextBytes($byteArray)
        Set-Content -Path $filePath -Value $byteArray.ToString() 
    }
}

