function [error]=CVDT(datafile)
dataset = load(datafile);

error = zeros(5,1);
for i= 1:5
    [data,labels]=shufflerows(dataset.data,dataset.labels);
    dataset=struct('data',data,'labels',labels);

    [~,error(i)]=testID3(dataset);
end
end