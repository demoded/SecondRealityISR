$skippedFilesList="i0010427.png-i0010511.png"
# "i0011357.png-i0011406.png",
# "i0013204.png-i0013262.png",
# "i0013309.png-i0013707.png",
# "i0013810.png-i0014096.png",
# "i0015870.png-i0016231.png",
# "i0018560.png-i0018651.png",
# "i0020861.png-i0020904.png",
# "i0022620.png-i0022714.png",
# "i0024923.png-i0025433.png",
# "i0028315.png-i0028383.png",
# "i0029318.png-i0029391.png",
# "i0032648.png-i0032962.png",
# "i0033099.png-i0033295.png",
# "i0033414.png-i0033613.png",
# "i0033729.png-i0033929.png",
# "i0034042.png-i0034241.png",
# "i0034356.png-i0034555.png",
# "i0034670.png-i0034869.png",
# "i0034984.png-i0035183.png",
# "i0035298.png-i0035497.png",
# "i0035612.png-i0035812.png",
# "i0035927.png-i0036127.png",
# "i0036241.png-i0036441.png",
# "i0036556.png-i0036757.png",
# "i0036870.png-i0037070.png",
# "i0037184.png-i0037384.png",
# "i0037499.png-i0037699.png",
# "i0037813.png-i0038013.png",
# "i0038127.png-i0038328.png",
# "i0038441.png-i0038641.png",
# "i0038755.png-i0038955.png",
# "i0039069.png-i0039269.png",
# "i0039383.png-i0039583.png"

foreach($filepair in $skippedFilesList)
{
    $fileNames = $filepair.Split("-");
    $startFileName = $fileNames[0];
    $startFileNumber = [int]$startFileName.Substring(1,7) + 1;
    $endFileName = $fileNames[1];
    $endFileNumber = [int]$endFileName.Substring(1,7);

    #check $startFileName exists
    $tmp = Join-Path -Path $PSScriptRoot -ChildPath $startFileName;
    if(!(Test-Path $tmp))
    {
        Write-Host $tmp;
        throw "Start file name is not exists $tmp";
    }
    #check $endFileName not exists
    $tmp = Join-Path -Path $PSScriptRoot -ChildPath $endFileName;
    if(Test-Path $tmp)
    {
        Write-Host $tmp;
        throw "End file name exists $tmp";
    }
    #check $endFileName+1 exists
    $num = "{0:0000000}" -f ($endFileNumber+1);
    $tmp = Join-Path -Path $PSScriptRoot -ChildPath ("i" + $num + ".png");
    if(!(Test-Path $tmp))
    {
        Write-Host $tmp;
        throw "Next file after $endFileNumber is not exists $tmp";
    }
    Write-host "start file $startFileName[$startFileNumber], end file $endFileName"
    for($i = $startFileNumber; $i -le $endFileNumber; $i++)
    {
        $num = "{0:0000000}" -f ($i);
        $destFileNamePath = Join-Path -Path $PSScriptRoot -ChildPath ("i" + $num + ".png");
        $sourceFileNamePath = Join-Path -Path $PSScriptRoot -ChildPath $startFileName;
        Write-Host "Copying $sourceFileNamePath to " $destFileNamePath;
        Copy-Item $sourceFileNamePath -Destination $destFileNamePath;
    }
}