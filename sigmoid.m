function g = sigmoid(z)
%This file is the MATLAB functio to implement the Sigmoid function(https://en.wikipedia.org/wiki/Sigmoid_function). 
g = 1.0 ./ (1.0 + exp(-z));
end
