function [h1_op,output_h2,output] = forwardprop (p,h1,op)
        A = h1 * p;
        h1_op = sigm(A);
        output_h2 = op * h1_op;
        output = sigm(output_h2);
end