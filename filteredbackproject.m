function [reconstrutedImg] = filteredbackproject(projections, anglesInDeg)
%
% reconstructs a 2d image from projections at diffrent angles.
% input:
% projections : 2d array with each column represents a projection.
% anglesInDeg : 1d array with corresponding angles in degree for the projections. 
% output:
% reconstructedImg: reconstructed 2d Image.
%


% getting the image dimension
imgLength = size(projections,1);

% degree to radian
anglesInRad = (3.1416/180)*anglesInDeg;
% filtering the projection matrix
filteredProjection = applysincfilter(projections);

% initializing
middlePoint = (imgLength+1)/2;
x = 1:imgLength;
y = 1:imgLength;
[xIndex,yIndex] = meshgrid(x,y);
xPrime = xIndex - (imgLength+1)/2;
yPrime = yIndex - (imgLength+1)/2;
reconstrutedImg = zeros(imgLength, imgLength);

% iterating over each projection
for p = 1:length(anglesInDeg)
    
    imgPoint = (middlePoint + xPrime*sin(anglesInRad(p)) - yPrime*cos(anglesInRad(p)));
    % nearest 
    imgPoint = round(imgPoint);
    % reconstruction for a projection 
    aReconstruction = zeros(imgLength, imgLength);
    point = find((imgPoint > 0) & (imgPoint <= imgLength));
    corrPoint = imgPoint(point);
    
    aReconstruction(point) = filteredProjection(corrPoint(:), p);
    
    % adding all reconstructions
    reconstrutedImg = reconstrutedImg + aReconstruction;
    
end

% averaging 
reconstrutedImg = reconstrutedImg./length(anglesInDeg);
