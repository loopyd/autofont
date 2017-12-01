$ssfFonts = 0x14
$fontSourceFolder = (Get-Item -Path ".\" -Verbose).FullName + "\data"
$Shell = New-Object -ComObject Shell.Application
$SystemFontsFolder = $Shell.Namespace($ssfFonts)
$FontFiles = Get-ChildItem $fontSourceFolder
$SystemFontsPath = $SystemFontsFolder.Self.Path
$rebootFlag = $false
$NumFound = @($FontFiles).Count

Write-Host "LupineDream's AutoFont installer" -foregroundcolor "cyan"
Write-Host "--- For the Stream Toolkit -----" -foregroundcolor "yellow"
Write-Host ""
Write-Host ""
Write-Host "  Found $NumFound fonts!" -foregroundcolor "green"
Write-Host "  Beginning auto-installation..."
Write-Host ""
Write-Host -nonewline "  NOTICE:" -foregroundcolor "red"
Write-Host "If you are asked to replace a font that already exists, select 'Yes!'"

foreach($FontFile in $FontFiles) {
	# $FontFile will be copied to this path:
	$targetPath = Join-Path $SystemFontsPath $FontFile.Name
	# So, see if target exists...
	if(Test-Path $targetPath){
		# font file with the same name already there.
		# delete and replace.
		$rebootFlag = $true
		Remove-Item $targetPath -Force
		Copy-Item $FontFile.FullName $targetPath -Force
	}else{
		#install the font.
		$SystemFontsFolder.CopyHere($FontFile.fullname)
	}
}

#Follow-up message
if($rebootFlag){
	Write-Host "At least one existing font overwritten. A reboot may be necessary."
}