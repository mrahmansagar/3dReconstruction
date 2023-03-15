clear
close all

%% Projections loading

% defining the path to the projection directory
projectionDir = '2dProjections';
% loading all the projection files
files = dir(sprintf('%s/p*.mat', projectionDir));
nbOfProjections = length(files);
% loading a projection to get the dimension to initialize projection volume
aProjection = load(sprintf('%s/%s',projectionDir,files(1).name));
projDim = size(aProjection.projection2D);

fprintf('Loading %d projections from "%s" directory...\n', nbOfProjections, projectionDir);
% initializing the projection volume 
projVolume = zeros(projDim(1),projDim(2),nbOfProjections);

for file = 1:nbOfProjections
    aProjFile = load(sprintf('%s/%s',projectionDir,files(file).name));
    aProjData = aProjFile.projection2D;
    projVolume(:,:,file) = aProjData;
    
    % progress
    if mod(file, 100) == 0
        fprintf('Loaded %d out of %d projections....\n', file, nbOfProjections)
    end
end

disp('Loading the corresponding projection angles...')
% loading the corresponding projection angle
anglesFile = dir(sprintf('%s/a*.mat', projectionDir));
loadedFile = load(sprintf('%s/%s',projectionDir,anglesFile.name));
projectionAngles = loadedFile.angles2Rotate;
disp('Done loading and projections and corresponding angles.')

%% Volume reconstruction 

disp('Reconstructing ....')
% initializing the reconstructed volume
volume = zeros(projDim(1),projDim(2),projDim(1));
% creating projection matrix per slice of the volume
for aSlice=1:projDim(2)
    % initializing the projection matrix for a slice
    aSliceProj = zeros(projDim(1),nbOfProjections);
    % taking all the projections for the slice
    for aProj = 1:nbOfProjections
        aSliceProj(:, aProj) = projVolume(aSlice,:,aProj);
    end
    % reconstruting the slice using backprojection 
    reconstructedSlice = filteredbackproject(aSliceProj, projectionAngles);
    % adding the slice to the reconstructed volume 
    volume(:,:,aSlice) = reconstructedSlice;
    
    %progress
    if mod(aSlice,4) == 0
        fprintf('Reconstructed %d slices out of %d slices...\n', aSlice, projDim(1))
    end
end

disp('Done reconstructing')

%% Save the reconstructed volume

% saving the reconstructed volume to the current directory 
save(['reconstructedVolume','.mat'], 'volume')
disp('Saved the reconstructed volume to the current working directory')



