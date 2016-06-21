function item_analysis
%ITEM_ANALYSIS Analyze and visulize the item file.
%   Construct the histograms and other information about the data.
%   Please do not run this program. You should first load the csv file and
%   then run the command in the command window.

% Let the VarName8 be the item keyword
keywords = [];
for i = 1: length(VarName8)
    line = VarName8{i, 1};
    temp = [];
    for j = 1: length(line)
        if(line(j) == ';')
            keywords = [keywords; str2double(temp)]; %#ok<AGROW>
            temp = [];
            continue;
        else
            temp = [temp, line(j)]; %#ok<AGROW>
        end
    end
end
disp(['Most frequent keywords: ', num2str(mode(keywords))]);

end

