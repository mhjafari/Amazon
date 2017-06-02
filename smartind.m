function [ii,jj] = smartind(i,j,S,number)
    ii = i+S-1;
    jj = j+S-1;
    if(ii>number)
        ii = number;
    end
    if(jj>number)
        jj = number;
    end
end