function shiftedArray = move0frqcomp2center(array)
%
% moves the zero-frequency component to center of the array 
% my naive implementation of Matlab buit-in function fftshift 
% input:
% array : N dimentional matrix of size XxY
% returns:
% shifterArray : N dimensional matrix with shifted zero-frequency componet
% to the center.
%

arrayDim = ndims(array);

index = cell(1, arrayDim);
for dim = 1:arrayDim
    sizeOfeachDim = size(array,dim);
    middlePoint = ceil(sizeOfeachDim/2);
    index{dim} = [middlePoint+1:sizeOfeachDim 1:middlePoint];
end

shiftedArray = array(index{:});