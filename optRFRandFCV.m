%when running this should enable the randomizeFeatures method
%class to optimize the size of the random feature subset given a datafile, uses 5
%fold Cross Validation
function [errorRate] = optRFRandFCV(datafile,depth,noTrees,in)
dataset = load(datafile);

cvFolds = 5;
errorRate = zeros(size(1:2:size(dataset.data,2),1),cvFolds);

featNo = (1:2:size(dataset.data,2));

parfor f = 1:size(featNo,2)
    dataset = load(datafile);
    sprintf('no of randomized features we choose from %d ',f);
    cvInd = cvpartition(dataset.labels,'k',cvFolds);
    for i = 1:cvFolds
        sprintf('cross validation index is %d ', i);
        trainSet = dataset.data(cvInd.training(i),:);
        trainLabels = dataset.labels(cvInd.training(i),1);

        testSet = dataset.data(cvInd.test(i),:);
        testLabels = dataset.labels(cvInd.test(i),1);
        
        trainingData = struct('data',trainSet,'labels',trainLabels);
        testingData = struct('data',testSet,'labels',testLabels);

        [~,errorRate(f,i)] = RandomForest(trainingData,testingData,noTrees,depth, featNo(f),in);
    end
    sprintf('finished for %d ',f)
end

end