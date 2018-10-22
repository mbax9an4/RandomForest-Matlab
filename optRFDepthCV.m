%class to optimize the depth of a RF ensemble given a datafile, uses 5
%fold Cross Validation
function [errorRate] = optRFDepthCV(datafile,in)
dataset = load(datafile);

cvFolds = 5;
errorRate = zeros(size(2:3:size(dataset.data,2),1),cvFolds);

depths = (2:2:size(dataset.data,2));
fNo = floor(size(dataset.data,2)/4);

parfor d = 1:size(depths,2)
    dataset = load(datafile);
    sprintf('depth of tree %d ',d);
    cvInd = cvpartition(dataset.labels,'k',cvFolds);
    for i = 1:cvFolds
        sprintf('cross validation index is %d ', i);
        trainSet = dataset.data(cvInd.training(i),:);
        trainLabels = dataset.labels(cvInd.training(i),1);

        testSet = dataset.data(cvInd.test(i),:);
        testLabels = dataset.labels(cvInd.test(i),1);
        
        trainingData = struct('data',trainSet,'labels',trainLabels);
        testingData = struct('data',testSet,'labels',testLabels);

        [~,errorRate(d,i)] = RandomForest(trainingData,testingData,1,depths(d),fNo,in);
    end
end

end