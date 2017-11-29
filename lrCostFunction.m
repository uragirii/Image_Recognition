function [J, grad] = lrCostFunction(theta, X, y, lambda)
%This is also most important function as it defines the CostFunction for Logistic Regression.
%Lamda is used as the regularization factor and can be played with to make the network more sophisticated and accurate
%The function also return the gradient as it is need in the fminc function

% Initialize some useful values
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

h_theta = sigmoid(X*theta);

J = -(1/m)*sum(y.*log(h_theta)+(1-y).*log(1-h_theta)) + (lambda/(2*m))*sum(theta(2:end).^2);
grad = (1/m)*(X'*(h_theta-y));
grad(2:end,:) = grad(2:end,:)+ (lambda/m)*theta(2:end);

grad = grad(:);

end
