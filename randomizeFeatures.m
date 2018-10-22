function [fSkip] = randomizeFeatures(features,fNo)
%fsize = floor(sqrt(fNo));
% fsize=floor(fNo/4);

fsize = features-fNo;
if fsize > 0
    fSkip = randperm(fsize);
else
    fSkip=0;
end
end