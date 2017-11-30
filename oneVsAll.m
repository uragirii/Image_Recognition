function [all_theta] = oneVsAll(X, y, num_labels, lambda,maxitr)
%This is one of the most important function as it trains the model and return the apporpriate Theta matrix.
m = size(X, 1);
n = size(X, 2);

% Add ones to the X data matrix
X = [ones(m, 1) X];

%     Guide how to use fminunc function
%     % Set options for fminunc
%     options = optimset('GradObj', 'on', 'MaxIter', 50);
% 
%     % Run fmincg to obtain the optimal theta
%     % This function will return theta and the cost 
%     [theta] = ...
%         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
%                 initial_theta, options);
%

for c=1:num_labels
    temp_theta = zeros(n+1,1);
    options = optimset('GradObj', 'on', 'MaxIter', maxitr);
    [temp_theta] = fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)),temp_theta, options);
    all_theta(c,:)=temp_theta;
end

end