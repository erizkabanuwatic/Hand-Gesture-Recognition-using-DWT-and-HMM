function [allMatFiles,datapointLengths] = Penggabung_ciri(data)

% Concatenate matfiles in the given location
allMatFiles = [];
allMatFiles1 = [];
allMatFiles2 = [];
A=[];
panjang_data = size(data,2);
% Start concatenation
j=6
for i = 1:panjang_data
    curFile = data(i).fitur;
    curFile = curFile(:)
    datapointLengths(i) = size(curFile,1);
    allMatFiles = [allMatFiles;curFile];
end
