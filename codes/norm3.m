function y= norm3(X)
    y = sqrt( sum(sum(sum( times(X,X) ))) );
end