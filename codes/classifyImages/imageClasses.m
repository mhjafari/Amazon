%% Find tags
clear;clc;

if ~(exist('JPEG','dir'))
    error('JPEG directory does not exist!!!')
end

% Array of labels
labels = {'primary';'clear';'agriculture' ...
          ;'road';'water';'partly_cloudy' ...
          ;'cultivation';'habitation';'haze' ... 
          ;'cloudy';'bare_ground';'selective_logging' ...
          ;'artisinal_mine';'blooming';'slash_burn' ...
          ;'blow_down';'conventional_mine'};


% Load train image tags
load('tags.mat')

mkdir('photos')

for j = 1:size(labels,1)
    
    % Find indexes based on the labels
    [notTag,tag]=findTag(image_name,tags,char(labels(j)));
    
    mkdir(strcat('photos/',char(labels(j))))
    mkdir(strcat('photos/',char(labels(j)),'/',char(labels(j))))
    mkdir(strcat('photos/',char(labels(j)),'/non',char(labels(j))))
    parfor i=1:size(tag,2)
        I = imread(strcat('JPEG/train_',num2str(tag(i)),'.jpg'));
        imwrite(I,strcat('photos/',char(labels(j)),'/',char(labels(j)),'/train_',num2str(tag(i)),'.jpg'))
    end
    parfor i=1:size(notTag,2)
        I = imread(strcat('JPEG/train_',num2str(notTag(i)),'.jpg'));
        imwrite(I,strcat('photos/',char(labels(j)),'/non',char(labels(j)),'/train_',num2str(notTag(i)),'.jpg'))
    end

end
