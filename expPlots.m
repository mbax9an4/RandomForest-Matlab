function [] = expPlots()
% 
% dt is 2:3
% rf is 2:2
% mlo is 1:1

errDTDBreastIG =[
    0.1239    0.1053    0.0702    0.0526    0.0702
    0.0708    0.0526    0.0877    0.0789    0.0526
    0.0354    0.0965    0.0526    0.0439    0.0702
    0.0088    0.0439    0.0877    0.0965    0.0614
    0.0265    0.0351    0.0439    0.0877    0.0702
    0.0442    0.0526    0.0877    0.1140    0.0702
    0.1062    0.0526    0.0877    0.0789    0.0702
    0.0708    0.0439    0.0877    0.0702    0.0877
    0.0796    0.0614    0.0439    0.0877    0.0965
    0.0265    0.0702    0.0877    0.0702    0.1140
    0.1327    0.0877    0.0351    0.1404    0.1228
    0.0442    0.0702    0.0789    0.0439    0.0702
    0.0708    0.0789    0.1053    0.0702    0.1053
    0.0885    0.0702    0.1930    0.0439    0.1053
    0.0619    0.0965    0.0877    0.1754    0.5877];

plotDTIG(:,1) = min(errDTDBreastIG');
plotDTIG(:,2) = mean(errDTDBreastIG,2);
plotDTIG(:,3) = max(errDTDBreastIG');

errDTDBreastIGR =[
    0.1062    0.0965    0.0789    0.0614    0.1053
    0.1062    0.0614    0.0702    0.0965    0.0702
    0.0619    0.0526    0.0965    0.0789    0.1053
    0.0265    0.0702    0.1053    0.0702    0.0965
    0.0796    0.0614    0.0965    0.1053    0.0526
    0.0973    0.0789    0.0439    0.0702    0.1053
    0.0708    0.0789    0.0965    0.0526    0.0614
    0.0973    0.0614    0.0614    0.0965    0.0702
    0.0531    0.0789    0.0439    0.1053    0.0614
    0.0531    0.0789    0.0789    0.1228    0.0614
    0.0796    0.0439    0.0702    0.0965    0.0702
    0.0531    0.0702    0.0439    0.0789    0.0789
    0.0885    0.0877    0.0877    0.1053    0.0614
    0.0354    0.1053    0.0789    0.0614    0.5000
    0.1062    0.2456    0.4561    0.0614    0.0965];

plotDTIGR(:,1) = min(errDTDBreastIGR');
plotDTIGR(:,2) = mean(errDTDBreastIGR,2);
plotDTIGR(:,3) = max(errDTDBreastIGR');

errDTDBreastGG =[
    0.1327    0.0877    0.0702    0.0789    0.0789
    0.0708    0.0877    0.0702    0.0614    0.1053
    0.0973    0.0702    0.0789    0.1140    0.0088
    0.0531    0.0526    0.0702    0.0439    0.0877
    0.0796    0.0526    0.0789    0.1228    0.0526
    0.0354    0.0614    0.0877    0.0526    0.0439
    0.0531    0.1140    0.0526    0.0965    0.0789
    0.1150    0.0965    0.0965    0.1053    0.0965
    0.0973    0.0702    0.0614    0.1053    0.0789
    0.0531    0.0702    0.0702    0.0877    0.0526
    0.1062    0.0789    0.0439    0.0702    0.0877
    0.0796    0.1316    0.1053    0.0789    0.0175
    0.0708    0.0877    0.0351    0.0439    0.0702
    0.0531    0.0614    0.0702    0.1140    0.0965
    0.2124    0.0877    0.1930    0.0702    0.0789];

plotDTGG(:,1) = min(errDTDBreastGG');
plotDTGG(:,2) = mean(errDTDBreastGG,2);
plotDTGG(:,3) = max(errDTDBreastGG');


errRFTNBreastIG =[   
    0.0619    0.0789    0.0614    0.1053    0.0526
    0.0973    0.0439    0.0439    0.0702    0.0614
    0.0619    0.0614    0.0702    0.0439    0.0614
    0.0442    0.0614    0.0351    0.1053    0.0614
    0.0796    0.0175    0.0614    0.0702    0.0263
    0.0796    0.0789    0.0702    0.0263    0.0351
    0.0265    0.0789    0.0789    0.0526    0.0263
    0.0973    0.0263    0.0789    0.0175    0.0439
    0.1416    0.0439    0.0526    0.0351    0.0439
    0.0354    0.0526    0.0965    0.0526    0.0702
    0.0354    0.0789    0.0439    0.0526    0.0439
    0.0354    0.0526    0.0702    0.0789    0.0351
    0.0885    0.0175    0.0439    0.0526    0.0526
    0.0265    0.0526    0.0789    0.0702    0.0789
    0.0531    0.0526    0.0526    0.0439    0.0702];

plotRFIG(:,1) = min(errRFTNBreastIG');
plotRFIG(:,2) = mean(errRFTNBreastIG,2);
plotRFIG(:,3) = max(errRFTNBreastIG');

errRFTNBreastIGR =[   
    0.1062    0.0614    0.0702    0.0789    0.0702
    0.0796    0.0965    0.0702    0.0877    0.0614
    0.0442    0.0614    0.0614    0.0965    0.0789
    0.0885    0.0614    0.0614    0.0351    0.0351
    0.0619    0.0263    0.0702    0.0526    0.0702
    0.0796    0.0789    0.0614    0.0789    0.0614
    0.0619    0.0351    0.0614    0.0702    0.0789
    0.0177    0.0526    0.1053    0.0263    0.0877
    0.0973    0.0965    0.0263    0.0351    0.0526
    0.0531    0.0789    0.0789    0.0614    0.0351
    0.0531    0.0263    0.0702    0.0965    0.0351
    0.0708    0.0614    0.0702    0.0789    0.0263
    0.1062    0.0614    0.0526    0.0439    0.0702
    0.0354    0.0439    0.0439    0.0965    0.0965
    0.1062    0.0439    0.0702    0.0175    0.0965];

plotRFIGR(:,1) = min(errRFTNBreastIGR');
plotRFIGR(:,2) = mean(errRFTNBreastIGR,2);
plotRFIGR(:,3) = max(errRFTNBreastIGR');

errRFTNBreastGG =[   
    0.0708    0.1053    0.0877    0.0789    0.0526
    0.1150    0.0526    0.0439    0.1053    0.0351
    0.0442    0.0351    0.0263    0.0439    0.0702
    0.0531    0.0614    0.0351    0.0526    0.0614
    0.0531    0.0351    0.0439    0.0965    0.0526
    0.0442    0.0351    0.0526    0.0439    0.0526
    0.0796    0.0263    0.0439    0.0351    0.0526
    0.0619    0.0175    0.0263    0.0175    0.0614
    0.0354    0.0351    0.0702    0.0526    0.0439
    0.0265    0.0351    0.0439    0.0702    0.0526
    0.0708    0.0351    0.0263    0.0614    0.0702
    0.0177    0.0526    0.0877    0.0702    0.0263
    0.0796    0.0614    0.0439    0.0439    0.0614
    0.0177    0.0702    0.0614    0.0702    0.0526
    0.0354    0.0263    0.0702    0.0526    0.0526];

plotRFGG(:,1) = min(errRFTNBreastGG');
plotRFGG(:,2) = mean(errRFTNBreastGG,2);
plotRFGG(:,3) = max(errRFTNBreastGG');

figure 
errorbar((2:2:30),plotDTIG(:,2),plotDTIG(:,1),plotDTIG(:,3),'-*r')
hold on
errorbar((2:2:30),plotDTIGR(:,2),plotDTIGR(:,1),plotDTIGR(:,3),'-*g')
hold on
errorbar((2:2:30),plotDTGG(:,2),plotDTGG(:,1),plotDTGG(:,3),'-*b')
axis([0,31,0,0.4]),title('CV error rate for RF optimisation of tree depth'),legend('depth using IG', 'depth using IGR','depth using GG')
figure
errorbar((1:2:30),plotRFIG(:,2),plotRFIG(:,1),plotRFIG(:,3),'-*r')
hold on
errorbar((1:2:30),plotRFIGR(:,2),plotRFIGR(:,1),plotRFIGR(:,3),'-*g')
hold on
errorbar((1:2:30),plotRFGG(:,2),plotRFGG(:,1),plotRFGG(:,3),'-*b')
axis([0,31,0,0.4]),title('CV error rate for RF optimisation of number of trees'),legend('tree no using IG', 'tree no using IGR','tree no using GG')


% cg =optSVM('breast.mat');
% 
% dataset = load('breast.mat');
% for j = 1:size(cg,1)
%     cvInd = cvpartition(dataset.labels,'k',5);
%     for i = 1:5
%         sprintf('cross validation index is %d ', i);
%         trainSet = dataset.data(cvInd.training(i),:);
%         trainLabels = dataset.labels(cvInd.training(i),1);
% 
%         testSet = dataset.data(cvInd.test(i),:);
%         testLabels = dataset.labels(cvInd.test(i),1);
% 
%         cmd = ['-t 2 -c ', num2str(cg(j,1)), ' -g ', num2str(cg(j,2))];
%         model = svm(cmd);
% 
%         model = model.train(trainSet,trainLabels);
%         err(j,i) = model.test(testSet,testLabels).err();
%     end
% end
% 
% plotSVM(:,1) = mean(err,2);
% plotSVM(:,2) = min(err');
% plotSVM(:,3) = max(err');
% 
% figure 
% errorbar((-5:15),plotSVM(:,1), plotSVM(:,2), plotSVM(:,3)),
% axis([-6,16,0,0.4]),title('CV error rate for SVM optimisation of the c ang gamma parameters')

% 
% errSVM =[
%     0.0563
%     0.0833
%     0.0845
%     0.0563
%     0.0563
%     0.0563
%     0.0563];
% 
%  errDTMLO =[
%     0.0423
%     0.0833
%     0.1127
%     0.0563
%     0.0845
%     0.0563
%     0.0647];
% 
%  errDTIG =[
%     0.0556
%     0.0986
%     0.0282
%     0.0845
%     0.0986
%     0.0563
%     0.0563];
% 
% errDTIGR =[
%     0.0986
%     0.0556
%     0.1127
%     0.0423
%     0.0704
%     0.0845
%     0.0845];
% 
% errDTGG =[
%     0.1127
%     0.0694
%     0.1268
%     0.0423
%     0.0845
%     0.1127
%     0.0563];
% 
%  errRFIG =[
%     0.0563
%     0.0278
%     0.1127
%     0.0282
%     0.0423
%     0.0563
%     0.0704];
% 
% errRFIGR =[
%     0.0563
%     0.0556
%     0.1408
%     0.0423
%     0.0563
%     0.0282
%     0.0423];
% 
% errRFGG =[
%     0.0141
%     0.0417
%     0.0563
%     0.0282
%     0.0704
%     0.0563
%     0.0282];
% 
% figure
% plot((1:7),errDTMLO, '-r*')
% hold on
% plot((1:7),errDTIG, '-b*')
% hold on 
% plot((1:7),errDTIGR, '-y*')
% hold on 
% plot((1:7),errDTGG, '-g*')
% axis([0,8,0,0.4]),title('CV error rates of the base ID3 algorith with the MLO implementation of a DT'),legend('DT MLO implementation', 'DT with IG','DT with IGR', 'DT with GG')
% 
% figure
% plot((1:7),errSVM, '-r*')
% hold on
% plot((1:7),errRFIG, '-b*')
% hold on 
% plot((1:7),errRFIGR, '-y*')
% hold on 
% plot((1:7),errRFGG, '-g*')
% axis([0,8,0,0.4]),title('Comparison of CV error rates between Random Forest ensemble and SVM'), legend('SVM', 'RF with IG','RF with IGR', 'RF with GG')
end