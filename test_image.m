image_index =874;

A2 = fp16_images(:,image_index);
A = b * A2;
h1_op = sigm(A);
output_h2 = f * h1_op;
output = sigm(output_h2)
output = output.'
test_labels(image_index, :)
matrix = reshape(testImages(:,image_index), [28, 28]);
imagesc(matrix)