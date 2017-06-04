function hazeClass(address)
    ratio = 0.1;
    [data,siz] = createData(address,ratio);
    load label;
    %bin = 50;
    hlabel = label(1:siz);
    hlabel = (hlabel == 1);
    %Variance = zeros([siz,4]);
    %Mean = zeros([siz,4]);
    %Hist = zeros([siz,3,bin]);
    %H = [0.17 0.67 0.17 ; 0.67 -3.33 0.67; 0.17 0.67 0.17];
    %FFT = zeros([siz,256,256]);
    %M = 0;
    %S = sum(hlabel);
    %data1 = data(hlabel<siz);
    %[idx,C] = kmeans3(data1,5);
    %K =1;
    %KMean = zeros([siz,K]);
    w = zeros(siz,3);
    for i=1:siz
        data_  = data{i}/256;
        w(i,:) = hazeDeg(data_);
%         if(hlabel(i) == 1)
%             M = M + data_/S;
%         end
%        grdata = double(rgb2gray(data_));
%         %gdata_ = histeq(gdata_);
%         Mean(i,1:3) = squeeze(mean( mean(data_,1) , 2));
%         Mean(i,4) = squeeze(mean( mean(grdata,1) , 2));
%         rdata = data_(:,:,1);
%         gdata = data_(:,:,2);
%         bdata = data_(:,:,3);
%         Variance(i,1) = var(rdata(:));
%         Variance(i,2) = var(gdata(:));
%         Variance(i,3) = var(bdata(:));
%         Variance(i,4) = var(grdata(:));
%         for k=1:K
%             KMean(i,k) = norm3(C{k}-data_);
%         end
% %         [rhist,~] = imhist(rdata,bin);
% %         Hist(i,1,:) = rhist / (256*256);
% %         [ghist,~] = imhist(gdata,bin);
% %         Hist(i,2,:) = ghist / (256*256);
% %         [bhist,~] = imhist(bdata,bin);
% %         Hist(i,3,:) = bhist / (256*256);
%         %[ghist_,~] = imhist(grdata,bin);
%         %ghist_ = ghist_ / (256*256);
%         %Hist(i,:) = ghist_';
%         %FFT(i,:,:) = fftshift(fft2(grdata));
    end
%     hhlabel = zeros(size(hlabel));
%     hhlabel2 = hhlabel;
%     for i=1:siz
%         c = angle3(M,data{i}/256);
%         hhlabel2(i) = c;
%         if c > 0.999
%             hhlabel(i) = 1;
%         end
%     end
%         mean(hhlabel == hlabel)

%     plot(squeeze(mean(Hist(hlabel==1,1,:),1)),'r')
%     hold on
%     plot(squeeze(mean(Hist(hlabel==1,2,:),1)),'g')
%     hold on
%     plot(squeeze(mean(Hist(hlabel==1,3,:),1)),'b')
%     
%     plot(squeeze(mean(Hist(:,1,:),1)))
%     hold on
%     plot(squeeze(mean(Hist(:,2,:),1)))
%     hold on
%     plot(squeeze(mean(Hist(:,3,:),1)))

    
%     scatter3(Mean(hlabel==1,1),Mean(hlabel==1,2),Mean(hlabel==1,3),'r')
%     hold on
%     scatter3(Mean(hlabel==0,1),Mean(hlabel==0,2),Mean(hlabel==0,3),'b')
    %imshow(squeeze(abs(mean(FFT(hlabel==1,:,:),1))))
    %new figure
    %imshow(squeeze(abs(mean(FFT,1))))
    Data = w;%[Mean,Variance,KMean];%,Hist];
    for j=1:size(Data,2)
        %vmean = mean(Data(:,j));
        vvar = max(Data(:,j));
        Data(:,j) = (Data(:,j))/vvar;
    end
    
    r = 0.9;
    svmStruct = svmtrain(Data(1:r*siz,:),hlabel(1:r*siz),'kernel_function','linear');
    hhlabel = svmclassify(svmStruct,Data);
    mean(hhlabel == hlabel)

end