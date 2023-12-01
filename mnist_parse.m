function [images, labels] = mnist_parse(image_file, label_file)
    % Open the files
    fid_images = fopen(image_file, 'r');
    fid_labels = fopen(label_file, 'r');

    % Read the magic numbers
    fread(fid_images, 1, 'int32', 0, 'ieee-be');
    fread(fid_labels, 1, 'int32', 0, 'ieee-be');

    % Read the dimensions
    num_images = fread(fid_images, 1, 'int32', 0, 'ieee-be');
    num_rows = fread(fid_images, 1, 'int32', 0, 'ieee-be');
    num_cols = fread(fid_images, 1, 'int32', 0, 'ieee-be');
    fread(fid_labels, 1, 'int32', 0, 'ieee-be');

    % Read the data
    images = fread(fid_images, inf, 'unsigned char=>unsigned char');
    labels = fread(fid_labels, inf, 'unsigned char=>unsigned char');

    % Close the files
    fclose(fid_images);
    fclose(fid_labels);

    % Reshape the data
    images = reshape(images, num_cols, num_rows, num_images);
    images = permute(images, [2 1 3]);
    labels = double(labels);
end