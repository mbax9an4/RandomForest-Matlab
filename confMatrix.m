function [] = confMatrix()
dataset = load('heart.mat');
trainSet = dataset.data(1:round((3/4)*size(dataset.data,1)),:);
trainLabels = dataset.labels(1:round((3/4)*size(dataset.labels,1)));

testSet = dataset.data(round((3/4)*size(dataset.data,1))+1:size(dataset.data,1),:);
testLabels = dataset.labels(round((3/4)*size(dataset.labels,1))+1:size(dataset.labels,1),:);

trainingData = struct('data',trainSet,'labels',trainLabels);
testingData = struct('data',testSet,'labels',testLabels);

[~,~,predLabels]=RandomForest(trainingData,testingData,15,6,5, 1);
c = confusionmat(testingData.labels, predLabels)

[~,~,predLabels]=RandomForest(trainingData,testingData,5,6,11, 2);
c = confusionmat(testingData.labels, predLabels)

[~,~,predLabels]=RandomForest(trainingData,testingData,23,6,11, 2);
c = confusionmat(testingData.labels, predLabels)


c =

    37     1
    26     3


c =

    33     5
     7    22


c =

    36     2
     8    21
end