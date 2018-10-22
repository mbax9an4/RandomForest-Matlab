function [bestc,bestg] = optSVM(datafile)

dataset = load(datafile);
cvInd = cvpartition(dataset.labels,'k',5);

trainSet = dataset.data(cvInd.training(1),:);
trainLabels = dataset.labels(cvInd.training(1),1);

bestcv = 0;
i=1;
for log2c = -5:15
    j=1;
    for log2g = -14:2
        cmd = ['-v 5 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
        cv = svmtrain(trainLabels,trainSet, cmd);
        if (cv >= bestcv),
            bestcv = cv;
            bestc = 2^log2c;
            bestg = 2^log2g;
        end
        j=j+1;
    end 
    fprintf('(best c=%g, g=%g, rate=%g)\n',bestc, bestg, bestcv);
    cg(i,1) = bestc;
    cg(i,2) = bestg;
    err(i) = 1-bestcv/100;
    i=i+1;
end

end
