param (
    [parameter(Mandatory=$True, Position=1)]
    [ValidateScript({ Test-Path -Path $_ -PathType Container })]
    [String]$InFolder,

    [parameter(Mandatory=$True, Position=2)]
    [ValidateScript({ Test-Path -Path $_ -PathType Container })]
    [String]$OutFolder,


    [parameter(Mandatory=$True, Position=5)]
    [System.URI]$Url
)



try{
Get-ChildItem -Path $InFolder | ForEach-Object -Process {
    $InName = $_.Name
    Write-Host "Reading: $InName"
    
    &"$PSScriptRoot/single_post.ps1" -inPath $InFolder -outPath $OutFolder -Url $Url -InName $InName

    Move-Item -Path "$PSScriptRoot\inputs\$_" -Destination "$PSScriptRoot\archives\$_"
}}
catch {
    Write-Output $_
}

Write-Host 'Process completed ... files processed'
