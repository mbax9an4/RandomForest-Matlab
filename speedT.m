function [] = speedT()

% dataset = load('heart.mat');
% trainSet = dataset.data(1:round((3/4)*size(dataset.data,1)),:);
% trainLabels = dataset.labels(1:round((3/4)*size(dataset.labels,1)));
% 
% testSet = dataset.data(round((3/4)*size(dataset.data,1))+1:size(dataset.data,1),:);
% testLabels = dataset.labels(round((3/4)*size(dataset.labels,1))+1:size(dataset.labels,1),:);
% elSVM = zeros(5,1);
% 
% for i =1:5
%     stSVM = tic;
%     model = svm('-t 2 -c 32 -g 6.1035e-05');
%     model = model.train(trainSet,trainLabels);
%     err = model.test(testSet,testLabels).err();
%     elSVM(i) = toc(stSVM);
% end
% elSVM
% 
% trainingData = struct('data',trainSet,'labels',trainLabels);
% testingData = struct('data',testSet,'labels',testLabels);
% 
% elIG = zeros(5,1);
% elIGR = zeros(5,1);
% elGG = zeros(5,1);
% t=1;
% for i = 1:5
%     rfIG = tic;
%     RandomForest(trainingData,testingData,t,4,5, 1);
%     elIG(i) = toc(rfIG);
% 
%     rfIGR = tic;
%     RandomForest(trainingData,testingData,t,4,11, 2);
%     elIGR(i) = toc(rfIGR);
% 
%     rfGG = tic;
%     RandomForest(trainingData,testingData,t,4,11, 3);
%     elGG(i) = toc(rfGG);
%     t=t+2;
% end
% elIG
% elIGR
% elGG


elSVM =[
    0.0115
    0.0102
    0.0072
    0.0064
    0.0066];


elIG =[
    0.4919
    1.0962
    1.1730
    2.6644
    3.0957];


elIGR =[
    0.8597
    1.5096
    2.2593
    3.4017
    4.1770];


elGG =[
    0.6386
    1.3226
    2.5489
    3.8127
    4.8655];

figure 
plot((1:5),elSVM,'-*r')
hold on
plot((1:2:9),elIG,'-*b')
hold on
plot((1:2:9),elIGR,'-*y')
hold on
plot((1:2:9),elGG,'-*g')
axis([0,10,0,6]),title('Speed of execution comparison between SVM and RF with parallelization'),legend('SVM','using IG', 'using IGR','using GG')


elSVM =[
    0.0112
    0.0066
    0.0050
    0.0049
    0.0047];


elIG =[
    0.2453
    0.6924
    1.7153
    2.3326
    3.3330];


elIGR =[
    0.4007
    1.0800
    3.5233
    4.0647
    5.2905];


elGG =[
    0.4914
    1.9324
    4.2738
    4.9898
    6.2672];

figure 
plot((1:5),elSVM,'-*r')
hold on
plot((1:2:9),elIG,'-*b')
hold on
plot((1:2:9),elIGR,'-*y')
hold on
plot((1:2:9),elGG,'-*g')
axis([0,10,0,7]),title('Speed of execution comparison between SVM and RF'),legend('SVM','using IG', 'using IGR','using GG')

end