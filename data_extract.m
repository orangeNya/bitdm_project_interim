function data_extract
%DATA_EXTRACT Extract the part of the data set for computing or updating.
%   Load the data set and extract data. This .m function may not run due to
%   the absence of some source data set. We only give the data set after
%   pre-deal. So please do not run this function.

fprintf('Transform the data set...\n');

% fprintf('Converting the rec_log_test...\n');
% rec_log_test = csvread('rec_log_test.csv');
% random_index = randperm(size(rec_log_test, 1));
% csvwrite('extracted_rec_log_test.csv', rec_log_test(random_index(1: 10000), :));
% fprintf('rec_log_test finished.\n');

% fprintf('Converting the rec_log_train...\n');
% rec_log_train = csvread('rec_log_train.csv');
% random_index = randperm(size(rec_log_train, 1));
% csvwrite('extracted_rec_log_train.csv', rec_log_train(random_index(1: 30000), :));
% fprintf('rec_log_train finished.\n');

% fprintf('Converting the user_action...\n');
% user_action = csvread('user_action.csv');
% random_index = randperm(size(user_action, 1));
% csvwrite('extracted_user_action.csv', user_action(random_index(1: 30000), :));
% fprintf('user_action finished.\n');

% fprintf('Converting the user_key_word...\n');
% user_key_word = dataread('user_key_word.txt');
% random_index = randomperm(size(user_key_word, 1));
% datawrite('extracted_user_key_word.csv', user_key_word(random_index(1: 30000), :));
% fprintf('user_key_word finished.\n');

% fprintf('Converting the user_profile...\n');
% user_profile = dataread('user_profile.txt');
% random_index = randomperm(size(user_profile, 1));
% datawrite('extracted_user_profile.csv', user_profile(random_index(1: 30000), :));
% fprintf('user_profile finished.\n');

% fprintf('Converting the user_sns...\n');
% user_sns = dataread('user_sns.txt');
% random_index = randomperm(size(user_sns, 1));
% datawrite('extracted_user_sns.csv', user_sns(random_index(1: 30000), :));
% fprintf('user_sns finished.\n');

% fprintf('Converting the item...\n');
% item = dataread('item.txt');
% random_index = randomperm(size(item, 1));
% datawrite('extracted_item.csv', item(random_index(1: 30000), :));
% fprintf('item finished.\n');

fprintf('All finished.\n');

end

function content = dataread(path)
%DATAREAD Read the file under the path.
%   Read the file line by line.

content = {};

fidin = fopen(path);
while ~feof(fidin)
    tline = fgetl(fidin);
    content = [content; tline]; %#ok<AGROW>
end

end

function datawrite(path, content)
%DATAWRITE Write the content (the first 30000 rows of the data) to the file under the path.
%   Write the file line by line.

fidout = fopen(path, 'w');
for i = 1: size(content, 1)
    fprintf(fidout, '%s\n', content{i});
end
fclose(fidout);

end