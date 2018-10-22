function [giniIndex] = giniIndex(labels,leftLabels,rightLabels)
classes = unique(labels);
occurences = histc(labels(:),classes);

%number of classes 
[noc,~] = size(classes);
[examples,~] = size(labels);
beforeSplit=0.0;

for c = 1:noc
    beforeSplit = beforeSplit + (occurences(c)/examples)^2;
end
beforeSplit = 1-beforeSplit;

[lnoc,~] = size(unique(leftLabels));
locc = histc(leftLabels(:),unique(leftLabels));
[exLeft,~] = size(leftLabels);
leftSplit=0.0;
for c = 1:lnoc
    leftSplit = leftSplit + (locc(c)/exLeft)^2;
end
leftSplit = 1-leftSplit;

[rnoc,~] = size(unique(rightLabels));
rocc = histc(rightLabels(:),unique(rightLabels));
[exRight,~] = size(rightLabels);
rightSplit=0.0;
for c = 1:rnoc
    rightSplit = rightSplit + (rocc(c)/exRight)^2;
end
rightSplit = 1-rightSplit;

average = exLeft/examples * leftSplit + exRight/examples * rightSplit;

giniIndex = double(beforeSplit - average);

end
