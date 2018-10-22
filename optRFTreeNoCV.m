%when running this should enable the randomizeFeatures method
%class to optimize the number of trees of an RF ensemble given a datafile, uses 5
%fold Cross Validation
function [errorRate] = optRFTreeNoCV(datafile,depth,rfNo,in)
cvFolds = 5;
errorRate = zeros(10,cvFolds);

tNo=(1:2:30);

parfor t = 1:size(tNo,2)
    dataset = load(datafile);
%     sprintf('no of trees we train %d ',t);
    cvInd = cvpartition(dataset.labels,'k',cvFolds);
    for i = 1:cvFolds
%         sprintf('cross validation index is %d ', i);
        trainSet = dataset.data(cvInd.training(i),:);
        trainLabels = dataset.labels(cvInd.training(i),1);

        testSet = dataset.data(cvInd.test(i),:);
        testLabels = dataset.labels(cvInd.test(i),1);
        
        trainingData = struct('data',trainSet,'labels',trainLabels);
        testingData = struct('data',testSet,'labels',testLabels);

        [~,errorRate(t,i)] = RandomForest(trainingData,testingData,tNo(t),depth,rfNo,in)
    end
%     sprintf('finished for no of trees %d', t);
end

end