function [freqDomain] = fouriertransform(spatialDomain)
%
% my naive implemtation of discrete fourier transform 
% input:
% spatialDomain : an array of values in the sptial domain
% output:
% freqDomain : calculated frequency domain response for the given spatial
% domain values 
% 

% intializing
freqDomain = zeros(length(spatialDomain), 1);

for m = 1:length(spatialDomain)
    freqDomain(m) = 0;
    for n = 1:length(spatialDomain)
        freqDomain(m) = freqDomain(m) + spatialDomain(n).*exp((-1i).*2.*pi.*(n-1).*(m-1)./length(spatialDomain)); 
    end
end