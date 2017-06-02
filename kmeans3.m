function [idx,C] = kmeans3(X,K)
    N = size(X,1);
    M = 20;
    [d1,d2,d3] = size(X{1});
    C = cell(K,1);
    for k = 1:K
        C{k} = 256*ones([d1,d2,d3])*(k-1)/K + rand([d1,d2,d3])*256/K;
    end
    idx = ones(N,1);
    for m=1:M
        sumData = zeros([d1,d2,d3,k]);
        for n=1:N
            distn = 10^10;
            datan = X{n};
            for k=1:K
                dkn = norm3(datan-C{k});
                if(dkn < distn)
                    distn = dkn;
                    idx(n) = k;
                end
            end
            sumData(:,:,:,idx(n)) = sumData(:,:,:,idx(n)) + datan;
        end
        for k=1:K
            sum(idx == k)
            C{k} = squeeze(sumData(:,:,:,k))/sum(idx == k);
        end
    end
end