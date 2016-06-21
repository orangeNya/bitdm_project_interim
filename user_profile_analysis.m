function user_profile_analysis
%USER_PROFILE_ANALYSIS Analyze and visulize the user_profile file.
%   Construct the histograms and other information about the data.
%   Please do not run this program. You should first load the csv file and
%   then run the command in the command window.

% Show the histogram of the birth year
VarName2(VarName2 > 2016) = 2016; % Let the VarName2 be the year of birth
VarName2(VarName2 < 1940) = 1940;
figure, hist(VarName2);

% Show the histogram of the gender
temp = mat2cell(num2str(VarName3), ones(size(VarName3, 1), 1));
% Let the VarName3 be the gender
gender = categorical(temp, {'0', '1', '2'}, {'unknown', 'male', 'famale'});
figure, hist(gender);

% Let the VarName4 be the count of retweeting
figure, bar(VarName4);
disp(['The user who tweeted most frequent: ', num2str(VarName1(VarName4 == ...
    max(VarName4)))]);

% Let the VarName6 and the VarName7 be the user id and acceptance
% respectively in the data set extracted_rec_log_train.
% VarName1 is also user id.
% Now we calculate the coeffience bwtween the 'acceptance agree' of user
% and the gender/count of retweet respectively.
user_acceptance = [];
for i = 1: length(VarName1)
    temp = zeros(1, 6);
    temp(1, 1) = VarName1(i);
    for j = 1: length(VarName6)
        if(VarName6(j) == VarName1(i))
            if(VarName7(j) == 1)
                temp(1, 2) = temp(1, 2) + 1; % acceptance
            else
                temp(1, 3) = temp(1, 3) + 1; % rejection
            end
        end
    end
    temp(1, 4) = VarName2(i); % birth
    temp(1, 5) = VarName3(i); % gender
    temp(1, 6) = VarName4(i); % tweet
    if(temp(1, 2) ~=0 || temp(1, 3) ~= 0)
        user_acceptance = [user_acceptance; temp]; %#ok<AGROW>
    end
end

% Draw QQ-plot
figure;
subplot(2, 1, 1), qqplot(user_acceptance(:,4), user_acceptance(:, 2));
xlabel('year of birth'), ylabel('acceptance');
subplot(2, 1, 2), qqplot(user_acceptance(:,4), user_acceptance(:, 3));
xlabel('year of birth'), ylabel('rejection');
% birth
figure;
subplot(2, 1, 1), qqplot(user_acceptance(:,5), user_acceptance(:, 2)); 
xlabel('gender'), ylabel('acceptance');
subplot(2, 1, 2), qqplot(user_acceptance(:,5), user_acceptance(:, 3));
xlabel('gender'), ylabel('rejection');
% gender
figure;
subplot(2, 1, 1), qqplot(user_acceptance(:,6), user_acceptance(:, 2));
xlabel('count of tweet'), ylabel('acceptance');
subplot(2, 1, 2), qqplot(user_acceptance(:,6), user_acceptance(:, 3));
xlabel('count of tweet'), ylabel('rejection');
% tweet

% Calculate the coff
disp(['The coeffience between rejection and birth year: ', ...
    num2str(corr(user_acceptance(:,4), user_acceptance(:,3), 'type', 'Spearman'))]);
disp(['The coeffience between rejection and gender: ', ...
    num2str(corr(user_acceptance(:,5), user_acceptance(:,3), 'type', 'Spearman'))]);
disp(['The coeffience between rejection and tweet: ', ...
    num2str(corr(user_acceptance(:,6), user_acceptance(:,3), 'type', 'Spearman'))]);

end

