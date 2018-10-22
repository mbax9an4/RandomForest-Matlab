function [decisionTrees,errorRate] = testRF(datafile,in)
dataset = load(datafile);

%[data,labels]=shufflerows(dataset.data,dataset.labels);

data=dataset.data(1:50,:);
labels=dataset.labels(1:50,:);

testTrainDistr = floor(3*size(labels,1)/4);

trData = data(1:testTrainDistr,:);
trLabels = labels(1:testTrainDistr,1);
teData = data(testTrainDistr+1:size(labels,1),:);
teLabels = labels(testTrainDistr+1:size(labels,1),1);

trainingData = struct('data',trData,'labels',trLabels);
testingData = struct('data',teData,'labels',teLabels);

[decisionTrees,errorRate] = RandomForest(trainingData,testingData,2,20,30,in);

end