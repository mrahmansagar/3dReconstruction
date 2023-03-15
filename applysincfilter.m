function filteredProjections = applysincfilter(projections)
%
% sinc(x) function has characteristics of a low pass filter.
% this idea is used here 
% input:
% projections : an array with all the projections per column.
% output:
% filteredProjections: returns projections after applying the filter 
%


% initialization 
filteredProjections = zeros(size(projections));

projectionSize = size(projections, 1);
nbOfProjections = size(projections, 2);
a = 1;
wgts = -pi:(2*pi/projectionSize):pi-(2*pi)/projectionSize;
% creating mask to multiply with projection to filter
mask = abs(2/a*sin(a.*wgts./2))*( (sin(a.*wgts./2))/((a*wgts)./2) )^2;
% zero-frequency component to the center
shiftedMask = move0frqcomp2center(mask);
% iterating through each projection 
for step = 1:nbOfProjections
    % extracting a projection
    aProj = projections(:, step);
    % taking fourier transform to multiply the mask 
    freqProj = fouriertransform(aProj);
    % filtering the projection
    filteredProj = freqProj .*shiftedMask';
    % taking inverse fourier transform  and adding it in right spot
    spatiProj = inversefouriertrans(filteredProj);
    filteredProjections(:, step) = spatiProj;
end
% considering only the real part of the filtered projections
filteredProjections = real(filteredProjections);

    


