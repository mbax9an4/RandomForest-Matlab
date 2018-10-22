function [splitIG] = IG(labels,leftLabels,rightLabels)
classes = unique(labels);
occurences = histc(labels(:),classes);

%number of classes 
[noc,~] = size(classes);
[examples,~] = size(labels);
beforeSplit=0.0;

for c = 1:noc
    beforeSplit = beforeSplit + (occurences(c)/examples)*log2(occurences(c)/examples);
end
beforeSplit = beforeSplit * -1;

[lnoc,~] = size(unique(leftLabels));
locc = histc(leftLabels(:),unique(leftLabels));
[exLeft,~] = size(leftLabels);
leftSplit=0.0;
for c = 1:lnoc
    leftSplit = leftSplit + (locc(c)/exLeft)*log2(locc(c)/exLeft);
end
leftSplit = leftSplit * -1;

[rnoc,~] = size(unique(rightLabels));
rocc = histc(rightLabels(:),unique(rightLabels));
[exRight,~] = size(rightLabels);
rightSplit=0.0;
for c = 1:rnoc
    rightSplit = rightSplit + (rocc(c)/exRight)*log2(rocc(c)/exRight);
end
rightSplit = rightSplit * -1;

average = exLeft/examples * leftSplit + exRight/examples * rightSplit;

splitIG = double(beforeSplit - average);
end
