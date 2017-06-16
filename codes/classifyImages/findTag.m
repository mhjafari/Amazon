function [notInd,ind]=findTag(image_name,tags,char)

% Find the tag index of the string
ind =[];
notInd = [];

    if strfind(char,'cloudy') == 1
        
        for i=2:size(tags,1)
            if strfind(tags(i,:),char)
                if strfind(tags(i,:),'partly')
                    notInd = [notInd image_name(i)];
                else
                    ind = [ind image_name(i)];
                end
            else
                notInd = [notInd image_name(i)];
            end
        end
        
    else
        
        for i=2:size(tags,1)
            if strfind(tags(i,:),char)
                    ind = [ind image_name(i)];
            else
                notInd = [notInd image_name(i)];
            end
        end
        
    end
end