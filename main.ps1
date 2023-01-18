
#set variables here for POST URL
$Url = ""

#sets up folders
$InFolder = "$PSScriptRoot\inputs"

$OutFolder = "$PSScriptRoot\outputs"

$ArchiveFolder = "$PSScriptRoot\archives"

#Checks to see if folders exist or not
if (!(Test-Path -Path $InFolder)){
    New-Item -ItemType Directory -Force -Path $InFolder
} 

if (!(Test-Path -Path $OutFolder)) {
    New-Item -ItemType Directory -Force -Path $OutFolder
}

if (!(Test-Path -Path $ArchiveFolder)) {
    New-Item -ItemType Directory -Force -Path $ArchiveFolder
}

#calls main script
&'./multiple_post.ps1' -InFolder $InFolder -OutFolder $OutFolder -Url $Url