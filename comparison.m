clear
close all

orig = load('volume.mat');
origVol = orig.r;

recon = load('reconstructedVolume.mat');
reconVol = recon.volume;

randomIntegers = randi([8, 28], 1, 5);

for aNum = 1:length(randomIntegers)
   figure(aNum)
   origSlice = origVol(:,:,randomIntegers(aNum));
   reconSlice = reconVol(:,:,randomIntegers(aNum));
   subplot(1,2,1)
   imshow(origSlice, 'DisplayRange', [min(min(origSlice)), max(max(origSlice))]);
   title(sprintf('Orig. Slice = %d', randomIntegers(aNum)))
   subplot(1,2,2)
   imshow(rot90(reconSlice,3), 'DisplayRange', [min(min(reconSlice)), max(max(reconSlice))]);
   title(sprintf('Recon. Slice = %d', randomIntegers(aNum)))
   
end