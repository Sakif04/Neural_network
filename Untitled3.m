clear all;
close all;

%//Open file
fid = fopen('t10k-images.idx3-ubyte', 'r');

A = fread(fid, 1, 'uint32');
magicNumber = swapbytes(uint32(A));

%//Read in total number of images
%//A = fread(fid, 4, 'uint8');
%//totalImages = sum(bitshift(A', [24 16 8 0]));

%//OR
A = fread(fid, 1, 'uint32');
totalImages = swapbytes(uint32(A));

%//Read in number of rows
%//A = fread(fid, 4, 'uint8');
%//numRows = sum(bitshift(A', [24 16 8 0]));

%//OR
A = fread(fid, 1, 'uint32');
numRows = swapbytes(uint32(A));

%//Read in number of columns
%//A = fread(fid, 4, 'uint8');
%//numCols = sum(bitshift(A', [24 16 8 0]));

%// OR
A = fread(fid, 1, 'uint32');
numCols = swapbytes(uint32(A));

for k = 1 : totalImages
    %//Read in numRows*numCols pixels at a time
    A = fread(fid, numRows*numCols, 'uint8');
    %//Reshape so that it becomes a matrix
    %//We are actually reading this in column major format
    %//so we need to transpose this at the end
    imageCellArray{k} = reshape(uint8(A), numCols, numRows)';
end

%//Close the file
fclose(fid);