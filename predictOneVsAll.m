function p = predictOneVsAll(all_theta, X)

%This is a MATLAB function used to predict the output of each logictic Regression in case of One vs All classifier
%It uses predifned max() function to choose the output of a particular example by 
m = size(X, 1);
num_labels = size(all_theta, 1);

p = zeros(size(X, 1), 1);

% Adding ones to the X data matrix
X = [ones(m, 1) X];

h_theta = X*all_theta';
pred = sigmoid(h_theta);
[temp, p] = max(h_theta, [], 2);

end