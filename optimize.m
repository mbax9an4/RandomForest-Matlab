function [] = optimize()

% errDTDHeartIG = optDTDepthCV('heart.mat',1)
% errDTDHeartIGR = optDTDepthCV('heart.mat',2)
% errDTDHeartGG = optDTDepthCV('heart.mat',3)
% 
% errRFDHeartIG = optRFDepthCV('heart.mat',1)
% errRFDHeartIGR = optRFDepthCV('heart.mat',2)
% errRFDHeartGG = optRFDepthCV('heart.mat',3)

% errRFRFHeartIG =optRFRandFCV('heart.mat',2,1,1)
% errRFRFHeartIGR =optRFRandFCV('heart.mat',2,1,2)
% errRFRFHeartGG =optRFRandFCV('heart.mat',2,1,3)

errRFTNHeartIG =optRFTreeNoCV('heart.mat',2,5,1)
errRFTNHeartIGR =optRFTreeNoCV('heart.mat',2,11,2)
errRFTNHeartGG =optRFTreeNoCV('heart.mat',2,11,3)

% errRFTNBreastIG =optRFTreeNoCV('breast.mat',10,9,1)
% errRFTNBreastIGR =optRFTreeNoCV('breast.mat',24,30,2)
% errRFTNBreastGG =optRFTreeNoCV('breast.mat',12,5,3)


end