function [data,siz] = createData(address,ratio)
    cd(address);
    cd('jpg');
    files = dir('*.jpg');
    data = cell(numel(files),1);
    siz = floor(ratio*numel(files));
    for i=1:siz
        data{i,1} = double(imread(['train_',num2str(i-1),'.jpg']));
        i
    end
    cd ..;
end