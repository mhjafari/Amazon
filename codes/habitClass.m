function oImage1 = habitClass(number)
    close all
    load('habitation/label');
    N = length(label);
    N_ = sum(label);
    datan_ = zeros(258,258,3);
    One = ones(2,2)/4;
    white = ones(3,3,3);
%     for th = 0.8580:-0.0001:0.8560
%     for n=1:N
%         if(label(n) == 0)
%             continue;
%         else
%             datan = double(imread(['jpg/train_',num2str(n-1),'.jpg']))/256;
%             datan_rgb = rgb2gray(datan);
%             [seriesX,indX] = max(datan_rgb,[],1);
%             [~,indy] = max(seriesX);
%             pos = [indX(indy),indy];
%             datan_(2:257,2:257,:) = datan;
%             w = datan_(pos(1):pos(1)+2,pos(2):pos(2)+2,:);
%             distancen = norm3(w-white)/27;
%             Indicator = exp( -distancen ) > th;
%         end
%         if(Indicator == 0)
%             break;
%         end 
%     end
%     [th,n]
%     if(n == N)
%         break;
%     end
%     end
    th2 = 0.8573;
    th = 0.3597;
    tmp = 0;
     for n=1:N
        if(label(n) == 10)
            continue;
        else
            datan = double(imread(['jpg/train_',num2str(n-1),'.jpg']))/256;
            datan_rgb = rgb2gray(datan);
            datan_rgbc = conv2(datan_rgb,One,'same');
            [seriesX,indX] = max(datan_rgb,[],1);
            [~,indy] = max(seriesX);
            pos = [indX(indy),indy];
            datan_(2:257,2:257,:) = datan;
            w = datan_(pos(1):pos(1)+2,pos(2):pos(2)+2,:);
            distancen = norm3(w-white)/27;
            if(sum(sum(datan_rgb > th)) == 0 || ... 
                    sum(sum(datan_rgbc > th)) == 0 || ...
                    exp( -distancen ) < th2 )
                tmp = tmp + 1;
                [tmp,n]
            end
        end
     end
    S = 8;
    
    
    imshow(Image)
    %wnorm = norm(window);
    oImage1 = Image;
    oImageS = Image;

    for i=1:256
        for j=1:256
            [ii,jj] = smartind(i,j,S,256);
            imageij = Image(i:ii,j:jj);
%             if(length(imageij) >1 )
%                 [~,C] = kmeans(imageij(:),2);
%             else
%                 C = [1,1];
%             end
            oImageS(i,j) = max(imageij(:)) - min(imageij(:)) > S/(S+16);
        end
    end
    %oImageS = conv2(oImageS,ones(S,S)/S^2,'same');
    %oImageS = oImageS > 0;
    %imshow(oImageS)
    %imshow(oImageS.*oImage1)
    H = [0.17 0.67 0.17 ; 0.67 -3.33 0.67; 0.17 0.67 0.17];
    imshow(10*conv2(Image,H,'same'))
    figure 
    imshow(Image)
    %imshow(oImage1)
end