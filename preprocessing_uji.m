function info = preprocessing (im)
im = imresize(im,[76 66]);
grayc =rgb2gray(im);
level = graythresh(grayc);
bw = im2bw(grayc,level);
%% proses segmentasi dengan skin detection 
ycbcr =rgb2ycbcr(im);
r=im(:,:,1);
b=im(:,:,3);
cr=ycbcr(:,:,3);
cb=ycbcr(:,:,2); %dilihat warna Cr/cb yg terang yang ingin kita deteksi
                 % dalam kasus ini menggunakan cr
masker=zeros(size(cr));
idx=find(cr>=136& cr<=145); %step 5 terapkan trheshold
masker(idx)=1; 
% imshow(cr); figure;

%% proses denoising
masker1=bwareaopen(masker,200); %untuk menghilangkan noise kecil2
masker2=imfill(masker1,'holes'); %menghilangkan noise di daerah putih
masker3=imdilate(masker2,strel('disk',1)); %menghilangkan daerah mata
masker4=imerode(masker3,strel('disk',2)); %untuk mengikis

masker3layer=uint8 (cat(3,masker4,masker4,masker4));
info=im.*masker3layer;
% Pengambilan informasi yang dibutuhkan 
info = info(15:45,:,:);
%% Untuk menampilkan Proses Pre-processing
% imshow([im info]);%untuk menampilkan 2 buah gambar berdampingan
% subplot(3,3,1); imshow(grayc);      title('Gambar awal');
% subplot(3,3,2); imshow(masker1); title('Denoising');
% subplot(3,3,3); imshow(masker2); title('Fill Holes');
% subplot(3,3,4); imshow(masker3); title('dilasi');
% subplot(3,3,5); imshow(masker4); title('erosi');
% subplot(3,3,6); imshow(info);     title('Hasil segmentasi');