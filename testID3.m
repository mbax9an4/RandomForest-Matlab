function [decisionTree,errorRate] = testID3(datafile,in)
 %function [decisionTree,errorRate] = testID3(dataset)
dataset = load(datafile);

data=dataset.data(1:50,:);
labels=dataset.labels(1:50,:);

[examples,features] = size(data);
% dataset=data;
% [examples,features] = size(dataset);

testTrainDistr = floor(3*examples/4);

trainingData = data(1:testTrainDistr,:);
trainingLabels = labels(1:testTrainDistr,1);
testingData = data(testTrainDistr+1:examples,:);
testingLabels = labels(testTrainDistr+1:examples,1);

tree = Tree(-10,intmax,-1,[]);

decisionTree = tree.train(trainingData, trainingLabels,4,-4,in);

% decisionTree.toString(0);

errorRate = decisionTree.test(testingData,testingLabels);

end