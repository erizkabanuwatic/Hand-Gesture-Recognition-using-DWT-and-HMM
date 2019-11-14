function accuracy = Data_uji(level,tipe_prepro,jenis_subband,mother_wavelet,dataset_name) 
load parameters.mat
% tipe_prepro = 4
% jenis_subband = 1
% mother_wavelet = 1
% level = 1
x=1;
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
for i=31:50
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
pnj_feature = pnj*lb
feature_test = reshape(im3,pnj_feature,1);
obs = knnsearch(clusterCenters,feature_test);
[prediction,classProb] = uji_hmm(obs,params);
data(x).filename = filename ;
data(x).label    = 1;
data(x).fitur 	 = feature_test;
data(x).kelas    = prediction;
x=x+1;
end

for i=31:50
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
feature_test = reshape(im3,pnj_feature,1);
obs = knnsearch(clusterCenters,feature_test);
[prediction,classProb] = uji_hmm(obs,params);
data(x).filename = filename ;
data(x).label    = 2;
data(x).fitur 	 = feature_test;	
data(x).kelas    = prediction;
x=x+1;
end

for i=31:50
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
feature_test = reshape(im3,pnj_feature,1);
obs = knnsearch(clusterCenters,feature_test);
[prediction,classProb] = uji_hmm(obs,params);
data(x).filename = filename ;
data(x).label    = 3;
data(x).fitur 	 = feature_test;	
data(x).kelas    = prediction;
x=x+1;
end

for i=31:50
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
    [E F G H]=dwt2(im3,mom_wav);%1st level decomposition 
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
feature_test = reshape(im3,pnj_feature,1);
obs = knnsearch(clusterCenters,feature_test);
[prediction,classProb] = uji_hmm(obs,params);
data(x).filename = filename ;
data(x).label    = 4;
data(x).fitur 	 = feature_test;	
data(x).kelas    = prediction;
x=x+1;
end

for i=31:50
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
    [E F G H]=dwt2(im3,mom_wav);%1st level decomposition 
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
feature_test = reshape(im3,pnj_feature,1);
obs = knnsearch(clusterCenters,feature_test);
[prediction,classProb] = uji_hmm(obs,params);
data(x).filename = filename ;
data(x).label    = 5;
data(x).fitur 	 = feature_test;	
data(x).kelas    = prediction;
x=x+1;
end
[p l]=size(data);
akurasi=[];
for z=1:l
   if data(z).label==data(z).kelas
       benar=1;
       akurasi=[akurasi benar];
   else 
       benar=0;
       akurasi=[akurasi benar];
   end
end
accuracy= (sum(akurasi)/l)*100



