## Copyright (C) 2016 juigilkishore
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Author: juigilkishore <juigilkishore@juigilkishore-Studio-1555>
## Created: 2016-04-24

close all
clear
clc

fprintf("Loading training data...\n")
fflush(stdout);
trainData = csvread("train.csv");
trainData = trainData(2:end, :);

trainLabels = trainData(:, 1);
trainFeatures = trainData(:, 2:end);
sizeFeatures = size(trainFeatures);
trainFeatures = [ones(sizeFeatures(1), 1), trainFeatures];

LABELS = union(trainLabels, trainLabels);
sizeFeatures = size(trainFeatures);
numInstances = sizeFeatures(1);
numFeatures = sizeFeatures(2);

################### TRAIN MODEL #####################

fprintf("Evaluate the features for every digit...\n")
fflush(stdout);

theta_optimal = oneVsAll(trainLabels, trainFeatures,...
                         numInstances, numFeatures,...
                         LABELS);
                         
fprintf("Evaluated the features for every digit.\n")
fflush(stdout);

################ TESTING TRAINING DATA #################

fprintf("Predict the training data based on the evaluated features...\n")
fflush(stdout);
predict_trainData = sigmoid(trainFeatures*theta_optimal);
[val, index] = max(predict_trainData');
estimate = index - 1;


error = length(find([estimate == trainLabels'] == 0))*(100/numInstances);
fprintf("Error between predicted training data and available data = %f\n", error)
fflush(stdout);


####################### TEST DATA ######################

fprintf("Loading test data...\n")
fflush(stdout);
testData = csvread("test.csv");
testData = testData(2:end, :);

numTestInstances = size(testData)(1)
testFeatures = [ones(numTestInstances, 1), testData];

fprintf("Predict the test data based on the evaluated features...\n")
fflush(stdout);
predict_testData = sigmoid(testFeatures*theta_optimal);
[val, index] = max(predict_testData');
test_estimate = index - 1;

fprintf("Write the predicted digits to test_prediction.csv...\n")
fflush(stdout);
csvwrite('test_prediction.csv', test_estimate');
fprintf("Wrote the predicted digits to test_prediction.csv\n")
fflush(stdout);
