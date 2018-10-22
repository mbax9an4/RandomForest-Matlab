function treeNode = ID3F(tree,data,labels,depth,fChosen)

%check that the dataset provided is not empty, otherwise throw an
%exception
if(size(data,1) == 0)
    msgID = 'ID:baddata';
    msg = 'The dataset provided is empty.';
    baseException = MException(msgID,msg); 
    throw(baseException)
end

% Base case conditions
if depth==0 || all(labels == labels(1)) || size(labels,1) <= 3
    treeNode = Tree(mode(labels,1),intmax,-1,[]);
    return
end

[~, features] = size(data);

maxIG = -1;
bestFeature = 0;
bestThreshold = 0;

leftSample = [];
leftLabels = [];
lS = [];
lL = [];
rightSample = [];
rightLabels = [];
rS = [];
rL=[];

[skipF]=randomizeFeatures(features);
% skipF = [];

% Recursive case
for i = 1:features
  if any(i==skipF)==0
        [threshold,lS,rS,lL,rL] = decisionStump(i,data,labels);
        featureIG = IG(labels,lL,rL);
%         featureIG = IGRatio(labels,lL,rL)
%         featureIG = giniGain(labels,lL,rL);
        if(maxIG<featureIG)
            maxIG = featureIG;
            bestFeature = i;
            bestThreshold = threshold;
            leftSample = lS;
            leftLabels = lL;
            rightSample = rS;
            rightLabels = rL;
        end
  end
end

%set the threshold and label of each decision node making sure we find the
%correct feature index, even after features have been removed
fIndex=bestFeature;
for f=1:size(fChosen,2)
    if fIndex>=fChosen(1,f)
        fIndex=fIndex+1;
    end
end
    
tree.set(-10,bestThreshold,fIndex);
fChosen(size(fChosen,2)+1)=fIndex;

%check for the case we only have one feature left in the dataset create the
%leaf nodes corresponding to the branches
if size(leftSample,2) == 1 && bestFeature ~= 0
    node = Tree(mode(leftLabels,1),intmax,-1,[]);
    tree.add(node);
end

if size(rightSample,2) == 1 && bestFeature ~= 0
    node = Tree(mode(rightLabels,1),intmax,-1,[]);
    tree.add(node);
end

%check if one of the branches is empty, if so create a leaf node to
%represent the other class
if size(leftSample,1) == 0 && bestFeature ~= 0
    if mode(rightLabels,1) == 1
        node = Tree(0,intmax,-1,[]);
        tree.add(node);
    else
        node = Tree(1,intmax,-1,[]);
        tree.add(node);
    end
end

if size(rightSample,1) == 0 && bestFeature ~= 0
    if mode(leftLabels,1) == 1
        node = Tree(0,intmax,-1,[]);
        tree.add(node);
    else
        node = Tree(1,intmax,-1,[]);
        tree.add(node);
    end
end

%remove the feature used from the datasets and continue the recursion,
%creating more branches to the tree, increasing the depth
if size(leftSample,2) > 1 && bestFeature ~= 0
    leftSample(:,bestFeature) = [];
    fChosen=sort(fChosen);
    tree.add(ID3(Tree(-10,intmax,-1,[]),leftSample,leftLabels,depth-1,fChosen));
end

if size(rightSample,2) > 1 && bestFeature ~= 0
    rightSample(:,bestFeature) = [];
    fChosen=sort(fChosen);
    tree.add(ID3(Tree(-10,intmax,-1,[]),rightSample,rightLabels,depth-1,fChosen));
end

treeNode = tree;
end