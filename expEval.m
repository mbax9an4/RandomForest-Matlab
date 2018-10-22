function [] = expEval(datafile)
dataset = load(datafile);

cvInd = cvpartition(dataset.labels,'k',8);
evalSet = dataset.data(cvInd.training(8),:);
evalLabels = dataset.labels(cvInd.training(8),1);


[c,g] = optSVM(datafile);
clc
errSVM = zeros(8,1);
errDTMLO = zeros(8,1);
errDTIG = zeros(8,1);
errDTIGR = zeros(8,1);
errDTGG = zeros(8,1);
errRFIG = zeros(8,1);
errRFIGR = zeros(8,1);
errRFGG = zeros(8,1);

for i = 1:7
    trainSet = dataset.data(cvInd.training(i),:);
    trainLabels = dataset.labels(cvInd.training(i),1);
    
    testSet = dataset.data(cvInd.test(i),:);
    testLabels = dataset.labels(cvInd.test(i),1);
    
    cmd = ['-t 2 -c ', num2str(c), ' -g ', num2str(g)];
    model = svm(cmd);
    model = model.train(trainSet,trainLabels);
    errSVM(i) = model.test(testSet,testLabels).err();
    svmM{i} = model;
    disp('after svm')
    
    tree = dtree('maxdepth',11,'minex',30);
    DT = tree.train(trainSet,trainLabels);
    dtM{i} = DT;    
    errDTMLO(i) = DT.test(testSet,testLabels).err();
    disp('after mlo tree')
    
    tree = Tree(-10,intmax,-1,[]);
    DT = tree.train(trainSet, trainLabels, 26,-4,1);
    dtIG{i} = DT;
    errDTIG(i) = DT.test(testSet,testLabels);
    disp('after my dt ig')
    
    tree = Tree(-10,intmax,-1,[]);
    DT = tree.train(trainSet, trainLabels, 8,-4,2);
    dtIGR{i} = DT;
    errDTIGR(i) = DT.test(testSet,testLabels);
    disp('after my dt igr')
    
    tree = Tree(-10,intmax,-1,[]);
    DT = tree.train(trainSet, trainLabels, 11,-4,3);
    dtGG{i} = DT;
    errDTGG(i) = DT.test(testSet,testLabels);
    disp('after my dt gg')
    
    trainingData = struct('data',trainSet,'labels',trainLabels);
    testingData = struct('data',testSet,'labels',testLabels);
    
    [dtRFIG{i},errRFIG(i)]=RandomForest(trainingData,testingData,21,10,9, 1);
    disp('after rf ig')
    [dtRFIGR{i},errRFIGR(i)]=RandomForest(trainingData,testingData,9,24,30, 2);
    disp('after rf igr')
    [dtRFGG{i},errRFGG(i)]=RandomForest(trainingData,testingData,15,12,5, 3);
    disp('after rf gg')
end

errSVM
errDTMLO
errDTIG
errDTIGR
errDTGG
errRFIG
errRFIGR
errRFGG


[tf,loc] = ismember(errSVM,max(errSVM));
tf = find(tf);
[~,idx] = unique(loc(tf), 'first');
c = tf(idx);
bestInd = c(1);
bestModel = svmM{bestInd};
errSVM(8) = bestModel.test(evalSet,evalLabels).err()

errSVM

[tf,loc] = ismember(errDTMLO,max(errDTMLO));
tf = find(tf);
[~,idx] = unique(loc(tf), 'first');
c = tf(idx);
errDTMLO(8) = dtM{c(1)}.test(evalSet,evalLabels).err();

errDTMLO

[tf,loc] = ismember(errDTIG,max(errDTIG));
tf = find(tf);
[~,idx] = unique(loc(tf), 'first');
c = tf(idx);
errDTIG(8) = dtIG{c(1)}.test(evalSet,evalLabels).err();

errDTIG

[tf,loc] = ismember(errDTIGR,max(errDTIGR));
tf = find(tf);
[~,idx] = unique(loc(tf), 'first');
c = tf(idx);
errDTIGR(8) = dtIGR{c(1)}.test(evalSet,evalLabels).err();

errDTIGR

[tf,loc] = ismember(errDTGG,max(errDTGG));
tf = find(tf);
[~,idx] = unique(loc(tf), 'first');
c = tf(idx);
errDTGG(8) = dtGG{c(1)}.test(evalSet,evalLabels).err();

errDTGG

[noEx, ~] = size(evalSet);
noTrees = 21;
[tf,loc] = ismember(errRFIG,max(errRFIG));
tf = find(tf);
[~,idx] = unique(loc(tf), 'first');
c = tf(idx);
tr = dtRFIG{c(1)};

label = zeros(noTrees,1);
errorRate = 0;

for e=1:noEx
    for t=1:noTrees
        label(t,1) = tr(i).testExample(evalSet(e,:));
    end
    
    exLabel = mode(label,1);
    
    if exLabel ~= evalLabels(e,1)
        errorRate = errorRate + 1;
    end
end

errRFIG(8) = errorRate/noEx;

errRFIG

noTrees = 9;
[tf,loc] = ismember(errRFIGR,max(errRFIGR));
tf = find(tf);
[~,idx] = unique(loc(tf), 'first');
c = tf(idx);
tr = dtRFIGR{c(1)};

label = zeros(noTrees,1);
errorRate = 0;

for e=1:noEx
    for t=1:noTrees
        label(t,1) = tr(i).testExample(evalSet(e,:));
    end
    
    exLabel = mode(label,1);
    
    if exLabel ~= evalLabels(e,1)
        errorRate = errorRate + 1;
    end
end

errRFIGR(8) = errorRate/noEx;

errRFIGR

noTrees = 15;
[tf,loc] = ismember(errRFGG,max(errRFGG));
tf = find(tf);
[~,idx] = unique(loc(tf), 'first');
c = tf(idx);
tr = dtRFGG{c(1)};

label = zeros(noTrees,1);
errorRate = 0;

for e=1:noEx
    for t=1:noTrees
        label(t,1) = tr(i).testExample(evalSet(e,:));
    end
    
    exLabel = mode(label,1);
    
    if exLabel ~= evalLabels(e,1)
        errorRate = errorRate + 1;
    end
end

errRFGG(8) = errorRate/noEx;

errRFGG
end