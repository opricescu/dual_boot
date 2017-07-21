# dual_boot
dual_boot_windows10_ubuntu

Situation: 

After I decided to install a Ubuntu on my pc and I did a dual boot, I found that if window 10 updates, it does not manage to take into account the settings made with for the boot manager grub.
I reset the settings manually, but at the next update I encountered the same problem and then I decided to make a bash to help me solve my problem quickly.

What he does:

It opens the diskpart, lists the disks, helps you map your drive where the boot file is and if you did not change anything when you installed the grub manager, it’s backup your current boot file of windows and replaces it whit the grub manager file. After it finishes, it removes the driver.

Beware - an administrator instance is required and the changes are not reversible
