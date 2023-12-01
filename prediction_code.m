prediction = double(trainLabels( 1:60000,1));
labels = zeros(60000,10);
for i = 1:60000
    for j = 1:10
        if j == prediction(i,1);
            labels(i,j) = 1;
        else
            labels(i,j) = 0;
        end
    end
end