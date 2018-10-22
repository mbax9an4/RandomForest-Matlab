%
% MLOtools Decision tree
% Optional arguments: minex, maxdepth
%
%   model = dtree().train(data,labels);
%   err = model.test(data,labels).err();
%
% Specify maximum tree depth by passing to the constructor:
%
%   model = dtree('maxdepth',5);
%
% Default maximum depth of 10.
%
% Change the minimum number of examples required to make a
% split in the same way:
%
%   model = dtree('maxdepth',5,'minex',30);
%
% Default minimum examples is 20.

function [errorRate] = mloDT(datafile)
dataset = load(datafile);

cvFolds = 5;
errorRate = zeros(size(dataset.data,2),cvFolds);


parfor d = 1:size(dataset.data,2)
    dataset = load(datafile);
    sprintf('depth of tree %d ',d);
    cvInd = cvpartition(dataset.labels,'k',cvFolds);
    for i = 1:cvFolds
        sprintf('cross validation index is %d ', i);
        trainSet = dataset.data(cvInd.training(i),:);
        trainLabels = dataset.labels(cvInd.training(i),1);

        testSet = dataset.data(cvInd.test(i),:);
        testLabels = dataset.labels(cvInd.test(i),1);
        
        tree = dtree('maxdepth',d,'minex',30);
        DT = tree.train(trainSet,trainLabels);
        
        errorRate(d,i) = DT.test(testSet,testLabels).err();
    end
end


end