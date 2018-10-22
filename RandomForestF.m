function [decisionTrees,errorRate] = RandomForestF(trainingData,testingData,noTrees,treeDepth,f)
[noEx, noFeat] = size(trainingData.data);

bootInd = bootstrap(noTrees, noEx);
decisionTrees = cell(noTrees,1);

parfor t = 1:noTrees
    [data,labels] = bootstrapData(bootInd(:,t),trainingData);
    tree = Tree(-10,intmax,-1,[]);
%     sprintf('training tree %d',t)
    decisionTrees{t,1} = tree.train(data,labels,treeDepth,f);    
end

[noEx, ~] = size(testingData.data);
label = zeros(noTrees,1);
errorRate = 0;

for e=1:noEx
    for t=1:noTrees
        label(t,1) = decisionTrees{t,1}.testExample(testingData.data(e,:),testingData.labels(e,1));
    end
    exLabel = mode(label,1);
    if exLabel ~= testingData.labels(e,1);
        errorRate = errorRate + 1;
    end
end
errorRate = errorRate/noEx;
end