function [dataSample,labelsSample] = bootstrapData(indices,dataset)
examples = size(indices,1);

dataSample = zeros(examples,size(dataset.data,2));
labelsSample = zeros(examples,1);

for i = 1:examples
    dataSample(i,:) = dataset.data(indices(i),:);
    labelsSample(i,1) = dataset.labels(indices(i),1);
end

end