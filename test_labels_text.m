for i = 1:10000;
    for j = 1:10;
        if test_labels(i,j) == 1
            z = j-1;
        end
    end
    fid = fopen('test_lables.txt', 'a+');
    fprintf(fid, '%d\n', z);
    fclose(fid);
end