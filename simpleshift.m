function shiftedSquare = simpleshift(square, rangeStart, rangeEnd)
%
% function simpleshift shifts a square matrix with nearest mean pading along row/col/diagonal
% with randomly seleted values between the defined range 
% input:
% square : a square matrix
% rangeStart : an integer  
% rangeEnd : an integer 
% output:
% shiftedSquare : returns square matrix after shifting accorgingly
%

% selecting an integer value randomly within the range for row and col
row = randi([rangeStart, rangeEnd]);
col = randi([rangeStart, rangeEnd]);

if col >= row
    st = 1;
elseif col < row
    st = row - col;
end

m = row;
n = col;

anArray = square;
shiftedArray = zeros(size(square));

for i = 1:size(square,1)
    shiftedArray(i, n+1:end) = anArray(i, 1:end-n);
end

anArray = shiftedArray;
shiftedArray = zeros(size(square));

for i = st:size(square,1)
    shiftedArray(m+1:end, i) = anArray(1:end-m, i);
end

% replacing zero values with average of nearest matrix

for r = 1:size(square,1)-row
    for c = 1:size(square,1)-col
        if shiftedArray(r,c) == 0
            ex = shiftedArray(r:r+row, c:c+col);
            shiftedArray(r,c) = mean(ex(:));
        end
    end
end


shiftedSquare = shiftedArray;
