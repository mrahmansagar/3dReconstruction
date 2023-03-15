Author:
Md Motiur Rahman Sagar
Email: mrahman.sagar@gmail.com 
 
This folder contains Matlab scripts and functions for the following two tasks 
without using built-in Matlab functions. 
I used my own implentation of fourier transform, inverse fourier transform, fftshift, filter etc.
Task 1. 2D projections.
Task 2. 3D reconstruction from the 2D projections generated in Task 1.

Instructions:
step 1. first run "projectionsOf3dVolume.m" for generating 2D projections. (Task 1) 
step 2. then run "reconstructionOf3dVolume.m" for reconstructing 3D volume using 2D projections from Task 1. (Task 2)
optinal:
after step 2. "reconstructedVolume.mat" will be saved in the current directory.
then you can run "comparison.m" to see the result. This script loads original and reconstructed volume, then
plots 5 figures with randomly selected slices for side by side comparison. 

Brief descriptions. (Look into each script and functions for more details.) 
Task 1. 
Run script "projectionsOf3dVolume.m". According to the task description it does the followings:
    (a) loads the volume.mat file from the current directory. [section: Volume loading]  
    (b) creates a folder "2dProjections" to store the 2d projections and 
        corresponding angles. [section: Angles and Projections directory]
    (c) saves the projections to the folder. [section: Projections]
    (d) plots randomly selected 15 projections. [section: Plot Projections]
 
Task 2.
Run script "reconstructionOf3dVolume.m". It does the followings:
    (a) loads the 2d projections and corresponding angles from the 
        folder "2dProjections". [section: Projection loading]
    (b) reconstructs 3D volume from the 2D projections. [section: Volume reconstruction] 
    (c) saves the reconstructed volume to the current working directory as  
        "reconstructedVolume.mat". [section: Save the reconstructed volume]

Please look into each script and function for more details. The codes are well documented so if you want to
change anything it should be stright forward.  