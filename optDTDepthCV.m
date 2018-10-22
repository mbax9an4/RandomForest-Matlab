%class to optimize the depth of a decision tree given a datafile, uses 5
%fold Cross Validation, is run with -4 as size of random feature subset so
%that the randomizeFeatures method is not called 
function [errorRate] = optDTDepthCV(datafile,in)
dataset = load(datafile);

cvFolds = 5;
errorRate = zeros(size(2:2:size(dataset.data,2),1),cvFolds);

depths = (2:2:size(dataset.data,2));

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
        
        tree = Tree(-10,intmax,-1,[]);
        DT = tree.train(trainSet, trainLabels, depths(d),-4,in);
        errorRate(d,i) = DT.test(testSet,testLabels);
    end
end

end