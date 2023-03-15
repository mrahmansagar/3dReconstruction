function spatiDomain = inversefouriertrans(freqDomain)
%
% my naive implemtation of inverse discrete fourier transform 
% input:
% freqDomain : an array of values in the frequency domain
% output:
% spatiDomain : calculated spatial domain response for the given frequency
% domain values 
%

% getting the size 
N = length(freqDomain); 
% inintializing
spatiDomain = zeros(N,1);

for s = 1:N
   spatiDomain(s) = 0;
   for t = 1:N
       spatiDomain(s) = spatiDomain(s) + ...
           ((1/N)*(cos((2*pi*(s-1)*(t-1))/N) + 1i*sin((2*pi*(s-1)*(t-1))/N)))*freqDomain(t);
       
   end
end