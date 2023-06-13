class FileManager {
    
    static [void] CreateFolder([string] $folderPath)
    {
        if(Test-Path $folderPath) { throw "Folder $folderPath already exists!"} 
        else { New-Item -ItemType Directory -Path $folderPath -ErrorAction Stop }
    }

    static [void] DeleteFolder([string] $folderPath)
    {
        Remove-Item -Path $folderPath -Force -Recurse -ErrorAction SilentlyContinue
    }

    static [void] CreateTestFile ([string] $filePath, [int] $fileSizeKb)
    {
        [Byte[]] $byteArray = [Byte[]]::new($fileSizeKb * 512)
        $randomGenerator = [System.Random]::new()
        $randomGenerator.NextBytes($byteArray)

        [string] $fileContent = [System.Text.Encoding]::UTF8.GetString($byteArray)
        Set-Content -Path $filePath -Value $fileContent
    }
}

