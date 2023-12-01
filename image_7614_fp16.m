for i = 1:10000;
    image = fp16_images(:,i);
    binary_fp16_image = dec2bin(image);
    for j = 1:10;
        if test_labels(i,j) == 1
            z = j-1;
            y = num2str(z);
        end
    end
    x = num2str(i);
    dlmwrite("binary_fp16_image_" + x + "_" + y + ".txt", binary_fp16_image, '');
end