%A MATLAB file to implement all the other MATLAB functions and finally performing the real work.
%This file is part of project IMGRG.
%For more details see [log.txt]

clear all
close all
clc
fprintf('Loading the data ...\n')
data = load('IMGRG_data.txt');
X = data(:,1:784);
y = data(:,785);
num_labels = 9;
input_layer_size = 784;
m = size(X,1);
maxiter =100;
fprintf('\nTraining One-vs-All Logistic Regression...\n')
lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda,maxiter);
fprintf('Program paused. Press enter to continue.\n');
pause;
testdata = load('IMGRG_testdata.txt');
test_X = data(:,1:784);
test_y = data(:,785);
pred = predictOneVsAll(all_theta, test_X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == test_y)) * 100);