function [params,clusterCenters]= Data_Latih (nkluster,nStates,tipe_prepro,jenis_subband,mother_wavelet,level,dataset_name) 
tic
x=1;
% nkluster = 800
% nStates = 25
% tipe_prepro = 3
% jenis_subband = 1
% mother_wavelet = 1
% level = 1
% dataset_name =2
switch mother_wavelet
        case 1
            mom_wav='haar';
        case 2
            mom_wav='db3';
        case 3
            mom_wav='db5';
        case 4 
            mom_wav='db7';
     end
for i=1:30
%% memilih dataset
    switch dataset_name
        case 1
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\A\A-train',num2str(i),'.bmp');
        case 2
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\A-Erizka\A-erizka',num2str(i),'.bmp');
    end
%% Preprocessing 
im=imread(filename);
im2 = preprocessing(im,tipe_prepro,dataset_name);
%% Proses Ekstraksi Fitur
im3=uint8(im2);
for ilevel = 1:level
    [E F G H]=dwt2(im3,mom_wav);
     switch jenis_subband
        case 1
            im3=E;
        case 2
            im3=F;
        case 3
            im3=G;
        case 4 
            im3=H;
     end
end
[pnj lb] = size(im3);
pnj_feature = pnj*lb;
feature = reshape(im3,1,pnj_feature);
data(x).filename = filename ;
data(x).label    = "huruf A";
data(x).fitur 	 = feature;	
x=x+1;
end

for i=1:30
    switch dataset_name
        case 1
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\B\B-train',num2str(i),'.bmp');
        case 2
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\B-Erizka\B-erizka',num2str(i),'.bmp');
    end
%% Preprocessing 
im=imread(filename);
im2 = preprocessing(im,tipe_prepro,dataset_name);
%% Proses Ekstraksi Fitur
im3=uint8(im2);
for ilevel = 1:level
    [E F G H]=dwt2(im3,mom_wav); 
     switch jenis_subband
        case 1
            im3=E;
        case 2
            im3=F;
        case 3
            im3=G;
        case 4 
            im3=H;
     end
end
[pnj lb] = size(im3);
pnj_feature = pnj*lb
feature = reshape(im3,1,pnj_feature);
data(x).filename = filename ;
data(x).label    = "huruf B";
data(x).fitur 	 = feature;	
x=x+1;
end

for i=1:30
    switch dataset_name
        case 1
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\C\C-train0',num2str(i),'.bmp');
        case 2
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\C-Erizka\C-erizka',num2str(i),'.bmp');
    end
%% Preprocessing 
im=imread(filename);
im2 = preprocessing(im,tipe_prepro,dataset_name);
%% Proses Ekstraksi Fitur
im3=uint8(im2);
for ilevel = 1:level
    [E F G H]=dwt2(im3,mom_wav);
     switch jenis_subband
        case 1
            im3=E;
        case 2
            im3=F;
        case 3
            im3=G;
        case 4 
            im3=H;
     end
end
[pnj lb] = size(im3);
pnj_feature = pnj*lb
feature = reshape(im3,1,pnj_feature);
data(x).filename = filename ;
data(x).label    = "huruf C";
data(x).fitur 	 = feature;	
x=x+1;
end

for i=1:30
   switch dataset_name
        case 1
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\point\Point-train',num2str(i),'.bmp');
        case 2
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\Point-Erizka\point-erizka',num2str(i),'.bmp');
    end
%% Preprocessing 
im=imread(filename);
im2 = preprocessing(im,tipe_prepro,dataset_name);
%% Proses Ekstraksi Fitur
im3=uint8(im2);
for ilevel = 1:level
    [E F G H]=dwt2(im3,mom_wav);
     switch jenis_subband
        case 1
            im3=E;
        case 2
            im3=F;
        case 3
            im3=G;
        case 4 
            im3=H;
     end
end
[pnj lb] = size(im3);
pnj_feature = pnj*lb
feature = reshape(im3,1,pnj_feature);
data(x).filename = filename ;
data(x).label    = "Pose Point";
data(x).fitur 	 = feature;	
x=x+1;
end

for i=1:30
    switch dataset_name
        case 1
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\5\Five-train',num2str(i),'.bmp');
        case 2
        filename = strcat('C:\Users\Erizka Banuwati C\Desktop\referensi TA\Referensi TA terbaru\Kodingan\SOURCE CODE TA\Five-Erizka\five-erizka',num2str(i),'.bmp');
    end
%% Preprocessing 
im=imread(filename);
im2 = preprocessing(im,tipe_prepro,dataset_name);
%% Proses Ekstraksi Fitur
im3=uint8(im2);
for ilevel = 1:level
    [E F G H]=dwt2(im3,mom_wav);
     switch jenis_subband
        case 1
            im3=E;
        case 2
            im3=F;
        case 3
            im3=G;
        case 4 
            im3=H;
     end
end
[pnj lb] = size(im3);
pnj_feature = pnj*lb
feature = reshape(im3,1,pnj_feature);
data(x).filename = filename ;
data(x).label    = "Angka 5";
data(x).fitur 	 = feature;	
x=x+1;
end

%% Parameter Awal
% nkluster = 600;
% nStates = 12;
filesPerClass = 30;
nKelas = 5;

[allMatFiles,datapointLengths]= Penggabung_ciri(data);
[idx,clusterCenters] = kmeans(allMatFiles,nkluster,'MaxIter',500);
observations = Pemisah_ciri(idx,datapointLengths);
plotHistogram(idx,datapointLengths,filesPerClass,nKelas);

% Save that file to prevent this computation again and again
save('observations.mat','observations');
%% Expectation-Maximization
load('observations.mat','observations');
[Ainit,Binit,piinit] = inisialiasi_HMM(nStates,nkluster)

for class = 1:nKelas
[A, B, pi] = forward_backward(Ainit,Binit,piinit,nStates,nkluster,observations,class,nKelas,filesPerClass);
    params(class).A = A;
    params(class).B = B;
    params(class).pi = pi;
end
save('parameters','params','clusterCenters');
waktu = toc