function user_action_analysis
%USER_ACTION_ANALYSIS Analyze and visulize the user_action file.
%   Construct the histograms and other information about the data.
%   Please do not run this program. You should first load the csv file and
%   then run the command in the command window.

% Let the VarName11~14 be the user id, at num, retweet num and the comment
% num.
% Show the bar graph
figure;
% The at action
subplot(3, 1, 1), bar(VarName12);
disp(['The user who at most frequent: ', num2str(VarName11(VarName12 == ...
    max(VarName12)))]);
% The retweet action
subplot(3, 1, 2), bar(VarName13);
disp(['The user who retweeted most frequent: ', num2str(VarName11(VarName13 == ...
    max(VarName13)))]);
% The comment action
subplot(3, 1, 3), bar(VarName14);
disp(['The user who commented most frequent: ', num2str(VarName11(VarName14 == ...
    max(VarName14)))]);
% Calculate the coefficience
user_acceptance = [];
for i = 1: length(VarName1)
    temp = zeros(1, 6);
    temp(1, 1) = VarName1(i);
    for j = 1: length(VarName11)
        if(VarName11(j) == VarName1(i))
            if(VarName7(j) == 1)
                temp(1, 2) = temp(1, 2) + 1; % acceptance
            else
                temp(1, 3) = temp(1, 3) + 1; % rejection
            end
        end
    end
    temp(1, 4) = VarName12(i); % at
    temp(1, 5) = VarName13(i); % retweet
    temp(1, 6) = VarName14(i); % comment
    if(temp(1, 2) ~=0 || temp(1, 3) ~= 0)
        user_acceptance = [user_acceptance; temp]; %#ok<AGROW>
    end
end
user_acceptance(3, 6) = 1;

% Draw QQ-plot
figure;
subplot(2, 1, 1), qqplot(user_acceptance(:,4), user_acceptance(:, 2));
xlabel('number of at action'), ylabel('acceptance');
subplot(2, 1, 2), qqplot(user_acceptance(:,4), user_acceptance(:, 3));
xlabel('number of at action'), ylabel('rejection');
% at
figure;
subplot(2, 1, 1), qqplot(user_acceptance(:,5), user_acceptance(:, 2)); 
xlabel('number of retweet action'), ylabel('acceptance');
subplot(2, 1, 2), qqplot(user_acceptance(:,5), user_acceptance(:, 3));
xlabel('number of retweet action'), ylabel('rejection');
% retweet
figure;
subplot(2, 1, 1), qqplot(user_acceptance(:,6), user_acceptance(:, 2));
xlabel('number of comment action'), ylabel('acceptance');
subplot(2, 1, 2), qqplot(user_acceptance(:,6), user_acceptance(:, 3));
xlabel('number of comment action'), ylabel('rejection');
% comment

% Calculate the coff
disp(['The coeffience between rejection and number of at action: ', ...
    num2str(corr(user_acceptance(:,4), user_acceptance(:,3), 'type', 'Spearman'))]);
disp(['The coeffience between rejection and number of rewteet action: ', ...
    num2str(corr(user_acceptance(:,5), user_acceptance(:,3), 'type', 'Pearson'))]);
disp(['The coeffience between rejection and number of comment action: ', ...
    num2str(corr(user_acceptance(:,6), user_acceptance(:,3), 'type', 'Spearman'))]);

end

