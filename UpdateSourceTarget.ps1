param (
    [Parameter()]
    [string]$CurrentResourceGroup,

    [Parameter()]
    [string]$TargetResourceGroup,

    [Parameter()]
    [string]$CurrentApimInstance,

    [Parameter()]
    [string]$TargetApimInstance
)

$items = Get-ChildItem * -recurse -exclude '*.ps1'
# enumerate the items array
foreach ($item in $items)
{
    # if the item is a directory, then process it.
    if ($item.Attributes -ne "Directory")
    {
        (Get-Content $item.FullName ) |
        Foreach-Object { $_ -replace $CurrentResourceGroup, $TargetResourceGroup } |
        Set-Content $item.FullName
    }
}

$items = Get-ChildItem * -recurse -exclude '*.ps1'
# enumerate the items array
foreach ($item in $items)
{
    # if the item is a directory, then process it.
    if ($item.Attributes -ne "Directory")
    {
        (Get-Content $item.FullName ) |
        Foreach-Object { $_ -replace $CurrentApimInstance, $TargetApimInstance } |
        Set-Content $item.FullName
    }
}