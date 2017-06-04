function theta = angle3(X,Y)
    nX = norm3(X);
    nY = norm3(Y);
    theta = sum(sum(sum( times(X,Y) )))/(nX*nY);
end