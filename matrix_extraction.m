test = trainImages( 1:784, 1:1000);
arif = test(:, 2);
matrix = reshape(arif, [28, 28]);
imagesc(matrix);
