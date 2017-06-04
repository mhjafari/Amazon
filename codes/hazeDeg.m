function [x0,x1,x2] = hazeDeg(X)
    %,w
    w = zeros(1,1);
    dI = min(X,[],3);
    d = mean(dI(:));
    bI = max(X,[],3);
    b = mean(bI(:));
    c = b-d;
    lambda = 1/3;
    A0 = lambda * max(bI(:)) + (1-lambda) * b;
    x0 = (A0-b)/A0;
    x1 = (A0-d)/A0;
    x2 = c/A0;
    sigma = 0.2461;
    nu = 2.9;
    mu = 5.1;
    w(1) = exp(-1/2*(mu*x1+nu*x2)+sigma);
    %w(2:4) = [x0,x1,x2];
end