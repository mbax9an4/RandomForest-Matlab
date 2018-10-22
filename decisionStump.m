function [bestT,leftSample,rightSample,leftLabels,rightLabels] = decisionStump(featureIndex,data,labels)
learningRate = 0.1;
minError = intmax;
bestT = 0.0;

cL = 0;
cR = 0;

[examples,~] = size(data);

%check the error rate given by each threshol, starting from the smallest
%value until we reach the largest value in the dataset for the current
%feature
for threshold = min(data(:,featureIndex)):learningRate:max(data(:,featureIndex))
    errorRate = intmax;
    less = [];
    greater = [];
    
    %for the current threshold, go through each example and check if the
    %value of the feature is smaller or bigger than the threshold
    for i = 1:examples
        if data(i,featureIndex) <= threshold
%             if labels(i,1) == max(labels(:,1))
%                 errorRate = errorRate+1;
%             end
            %row vector that contains all the labels of the examples that
            %are smaller than the threshold
            less(size(less,2)+1) = labels(i,1);
        else
%             if labels(i,1) == min(labels(:,1))
%                 errorRate = errorRate+1;
%             end
            %row vector that contains all the labels of the examples that
            %are greater than the threshold
            greater(size(greater,2)+1) = labels(i,1);
        end            
    end

    %check that the most common label on the left branch and on the right
    %branch are different
    if mode(less,2) == mode(greater,2)
        errorRate = intmax;
    else
        errorRate=0;
        
        %get the most common label on the left branch and find the number
        %of occurences of each label in this branch (column vector)
        classL = mode(less,2);
        locc = histc(less(:),unique(less));
        
        %if we have more than 1 label occuring on this branch add the
        %number of occurences of the least common labels to the error rate
        if size(locc,1) > 1
            errorRate = errorRate + sum(locc)-locc(classL+1,1);
        end
        
        %get the most common label on the right branch and find the number
        %of occurences of each label in this branch (column vector)
        classR = mode(greater,2);
        rocc = histc(greater(:),unique(greater));
        
        %if we have more than 1 label occuring on this branch add the
        %number of occurences of the least common labels to the error rate
        if size(rocc,1) > 1
            errorRate = errorRate + sum(rocc)-rocc(classR+1,1);
        end
    end
    
    %check if the current error rate is smaller than the min so far and
    %update parameteres if needed
    if minError >= errorRate
        minError = errorRate;
        bestT = threshold;
    end
end

leftSample = [];
leftLabels = [];
rightSample = [];
rightLabels = [];

%return the left and right branches according to the best threshold
for i = 1:examples
    [ls,~] = size(leftSample);
    [rs,~] = size(rightSample);
    if data(i,featureIndex) <= bestT
        leftSample(ls+1,:) = data(i,:);
        leftLabels(ls+1,1) = labels(i,1);
    else
        rightSample(rs+1,:) = data(i,:);
        rightLabels(rs+1,1) = labels(i,1);
    end
end

end
