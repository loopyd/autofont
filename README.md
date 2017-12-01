# autofont
So many useful fonts - part of my streaming toolkit - w/ powershell installer!

## Instructions

1.  Go here:
https://mintywhite.com/customize/fonts/download-windows-fonts-megapack-1003-free-fonts/
2.  Extract all the zips in the download
3.  Move all the ttf and otf files to a subfolder below this powerhsell named "data"
4.  Run the script, bam!  **Free fonts!**

## Tips

- You can add as many fonts as you'd like to your data folder!  The script doesn't care.  Whatever it finds in **./data**, it begins auto-installing.
- The script isn't fully auto-unattended, but its pretty darn close.  If you've run over a corrupt or duplicate (already installed) font, you'll have to acknowledge the prompt to continue (for safety!)
