param (
    [parameter(Mandatory=$True, Position=1)]
    [String]$inPath,

    [parameter(Mandatory=$True, Position=2)]
    [String]$outPath,

    [parameter(Mandatory=$True, Position=3)]
    [System.URI]$Url,

    [parameter(Mandatory=$True, Position=4)]
    [String]$InName,

)

$InNameLeaf = [System.IO.Path]::GetFileNameWithoutExtension($InName)


try {
    # Invoke-RestRequest
    Invoke-RestMethod -Uri $Url -Method Post -ContentType "text/csv" -Body (Get-Content "$inPath\$InName") |  
        Select-Object -ExpandProperty 'Content' |
        Out-File -filePath "$outPath\$InNameLeaf.response.csv"
} catch [System.Net.WebException] {
    Write-Error( "FAILED to reach '$Url': $_" )
    throw $_
}

