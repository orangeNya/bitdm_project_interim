function rec_log_train_analysis
%REG_LOG_TRAIN_ANALYSIS Analyze and visulize the rec_log_train file.
%   Construct the histograms and other information about the data.

rec_log_train = csvread('extracted_rec_log_train.csv');

% Change the line into string cell for the categorical
temp = mat2cell(num2str(rec_log_train(:, 3)), ones(size(rec_log_train,1), 1));
acceptance = categorical(temp, {'-1', '1'}, {'reject', 'accept'});
% Show the count of the acceptance and objection
figure, hist(acceptance);
disp('Show the acceptance in detail: ');
reject = sum(rec_log_train(:, 3) == -1);
accept = sum(rec_log_train(:, 3) == 1);
disp(['reject: ', num2str(reject), ', ', num2str(reject/size(rec_log_train, 1)*100), '%']);
disp(['accept: ', num2str(accept), ', ', num2str(accept/size(rec_log_train, 1)*100), '%']);

% Show the status of the recommand item
[~, XTick] = hist(rec_log_train(:, 2));
figure, hist(rec_log_train(:, 2));
set(gca, 'XTickLabel', round(double(XTick)/100000, 2));
text(2450000, -700, '¡Á10^5');
disp(' ');
disp('Show the recommand item data abstract: ');
disp(['Most recommand frequency item id: ', num2str(mode(rec_log_train(:, 2)))]);
disp(['Most recommand item id: ', num2str(mode(rec_log_train(...
    rec_log_train(:, 3) == 1, 2)))]);
% Show item list
% disp('Item list: ');
item_list = unique(rec_log_train(:, 2));
% for i = 1: length(item_list)
%     disp(['    ', num2str(item_list(i))]);
% end
disp(['    ', num2str(length(item_list)), ' items in total.']);

end