function y = sigm(x,der)
    if der==0 
       y = 1/(1 + exp(-x));
    else 
       y=x*(1-x)
end
end