function [bootIndices] = bootstrap(bootNo, sizeBoot)
min = 1;
max = sizeBoot;
bootIndices = (max-min).*rand(sizeBoot,bootNo) + min;
bootIndices = round(bootIndices);
end