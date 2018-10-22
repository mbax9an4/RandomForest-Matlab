%should be run with training and tetsing data as structs, number of trees
%parameter, depth of trees and size of feature subsample, as well as the 
%index of the feature selection method 1 for IG, 2 for IGR and 3 for GG
function [decisionTrees,errorRate] = RandomForest(trainingData,testingData,noTrees,treeDepth,fNo, in)
[noEx, noFeat] = size(trainingData.data);

bootInd = bootstrap(noTrees, noEx);
decisionTrees = cell(noTrees,1);

%trains trees in parallel using ID3 algorithm
parfor t = 1:noTrees
    [data,labels] = bootstrapData(bootInd(:,t),trainingData);
    tree = Tree(-10,intmax,-1,[]);
%     sprintf('training tree %d',t)
    decisionTrees{t,1} = tree.train(data,labels,treeDepth,fNo,in);    
end

[noEx, ~] = size(testingData.data);
label = zeros(noTrees,1);
errorRate = 0;

%tests all trees and does a majority vote to assign a predicted label to
%each example in the testing set
for e=1:noEx
    for t=1:noTrees
        label(t,1) = decisionTrees{t,1}.testExample(testingData.data(e,:));
    end
    
    exLabel = mode(label,1);
    if exLabel ~= testingData.labels(e,1)
        errorRate = errorRate + 1;
    end
end

errorRate = errorRate/noEx;
end