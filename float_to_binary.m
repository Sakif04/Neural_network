clc
d = weights_h1.';
e = weights_op.';
f = half(e);
b = half(d);
g = dec2bin(b);
h = dec2bin(f);
fp16_images = half(testImages);
dlmwrite('weights_op.txt', h, '');
dlmwrite('weights_h1.txt', g, '');