# Candy
function which
{
	param($packageName)
	scoop which $packageName
}

function gac
{
	param($message)
	git add .
	git commit -S -m "$message"
}

function convertToMp3
{
	param($mp4SourceFile, $mp3ConvertedFile)
	ffmpeg -i $mp4SourceFile -b:a 192K -vn $mp3ConvertedFile -stats
}

function vsvars {
	Import-VisualStudioVars -Architecture x64
}

function cp-mk {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )
    if (-Not (Test-Path $destinationPath)) {
        New-Item -Path $destinationPath -ItemType Directory
    }
    Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
}
