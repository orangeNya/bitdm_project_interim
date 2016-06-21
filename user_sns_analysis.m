function user_sns_analysis
%USER_SNS_ANALYSIS Analyze and visulize the user_sns file.
%   Construct the histograms and other information about the data.
%   Please do not run this program. You should first load the csv file and
%   then run the command in the command window.

% Let the VarName9 and the VarName10 be the follower and followee
% respectively.
% Calculate the coeffience between the count of followee and the
% acceptance.
user_acceptance = [];
for i = 1: length(VarName1)
    temp = zeros(1, 4);
    temp(1, 1) = VarName1(i);
    for j = 1: length(VarName9)
        if(VarName9(j) == VarName1(i))
            temp(1, 4) = temp(1, 4) + 1; % number of followee
            if(VarName7(j) == 1)
                temp(1, 2) = temp(1, 2) + 1; % acceptance
            else
                temp(1, 3) = temp(1, 3) + 1; % rejection
            end
        end
    end
    if(temp(1, 2) ~=0 || temp(1, 3) ~= 0)
        user_acceptance = [user_acceptance; temp]; %#ok<AGROW>
    end
end

% Draw QQ-plot
figure;
subplot(2, 1, 1), qqplot(user_acceptance(:,4), user_acceptance(:, 2));
xlabel('number of followee'), ylabel('acceptance');
subplot(2, 1, 2), qqplot(user_acceptance(:,4), user_acceptance(:, 3));
xlabel('number of followee'), ylabel('rejection');

% Calculate the coff
disp(['The coeffience between rejection and number of followee: ', ...
    num2str(-corr(user_acceptance(:,4), user_acceptance(:,3), 'type', 'Spearman'))]);

end

