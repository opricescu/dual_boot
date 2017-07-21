@echo off
cls
delete diskpart.txt
echo >diskpart.txt LIST DISK
diskpart /s diskpart.txt

set /p Disk=Please select the disk where bootmgr is placed :
if "%Disk%"=="" goto
(echo select disk %disk% && echo list partition) > ./diskpart.txt
diskpart /s diskpart.txt
set /p Partition=Please select the partition of bootmgr :
if "%Partition%"=="" goto
(echo select disk %disk% && echo select partition %partition% && echo assign letter E && echo exit) > ./diskpart.txt
diskpart /s diskpart.txt
set/p<nul = Any key to continue  ...&pause>nul
cls
echo
echo Verify if you have a backup of the file.
E:
cd E:\EFI\Microsoft\Boot
dir *.bak
set/p<nul = Any key to continue  ...&pause>nul
cls
echo =====================================
echo Delete the backup file.
del /p *.bak
echo =====================================
echo
echo Verify if is deleted the file.
dir *.bak
set/p<nul = Any key to continue  ...&pause>nul
echo =====================================
echo
echo
echo Make a new backup file
copy /-Y E:\EFI\Microsoft\Boot\bootmgfw.efi E:\EFI\Microsoft\Boot\bootmgfw.efi.bak
set/p<nul = Any key to continue  ...&pause>nul
echo
echo =====================================
echo
echo Delete the boot file!
echo
echo
del e:\EFI\Microsoft\Boot\bootmgfw.efi
copy /-Y e:\EFI\ubuntu\grubx64.efi e:\EFI\Microsoft\Boot\bootmgfw.efi

echo
echo =====================================
echo
echo The file bootmgf is replaced with grubx64
echo Cleaning the mess :)
echo
echo =====================================
echo
(echo select disk %disk% && echo select partition %partition% && echo remove && echo exit) > ./diskpart.txt
diskpart /s diskpart.txt
echo
echo =====================================
echo seeya!
exit


