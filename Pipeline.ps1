using module ./FileManager.psm1

function Pipeline01
{
    # in this example, we create 4 text files with different sizes and delete two largest with extension .log

    $testFolderPath = "$PSScriptRoot\$(New-Guid)"
    [FileManager]::CreateFolder($testFolderPath)

    # create files with specified sizes
    [FileManager]::CreateTestFile("$testFolderPath\file01.log", 1)
    [FileManager]::CreateTestFile("$testFolderPath\file02.log", 2)
    [FileManager]::CreateTestFile("$testFolderPath\file03.log", 3)
    [FileManager]::CreateTestFile("$testFolderPath\file04.log", 4)

    [FileManager]::CreateTestFile("$testFolderPath\file05.txt", 5)
    [FileManager]::CreateTestFile("$testFolderPath\file06.txt", 6)

    # delete two largets files of type .log
    Get-ChildItem -Path $testFolderPath | Where-Object { $_.Extension -eq '.log' } | Sort-Object { $_.Length } -Descending `
        | Select-Object -First 2 | Remove-Item -Force
    # cleanup
    [FileManager]::DeleteFolder($testFolderPath)
}

& Pipeline01