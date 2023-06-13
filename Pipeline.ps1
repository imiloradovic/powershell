using module ./FileManager.psm1

# function Pipeline01
# {
    # Import-Module ./FileManager.psm1
    # in this example, we create 4 text files with different sizes and delete all of them, except two largest
    $guid = New-Guid
    $testFolderPath = "$PSScriptRoot\$guid"
    [FileManager]::CreateFolder($testFolderPath)

    [FileManager]::CreateTestFile("$testFolderPath\file01.txt", 1)
    [FileManager]::CreateTestFile("$testFolderPath\file02.txt", 2)
    [FileManager]::CreateTestFile("$testFolderPath\file03.txt", 3)
    [FileManager]::CreateTestFile("$testFolderPath\file04.txt", 4)
# }

# & Pipeline01