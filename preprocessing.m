function info = preprocessing (im,tipe_prepro,dataset_name)
switch dataset_name
    case 1
        im    = imresize(im,[76 66]);
    case 2
        im    = imresize(im,[128 128]);
end
grayc = rgb2gray(im);        %grayscale
level = graythresh(grayc);
bw    = im2bw(grayc,level);    %Binary
hsv   = rgb2hsv(im);
V    = hsv(:,:,3);
%% proses segmentasi dengan skin detection 
ycbcr =rgb2ycbcr(im);
r     =im(:,:,1); %red
g     =im(:,:,2); %green
b     =im(:,:,3); %blue
cr    =ycbcr(:,:,3); %dilihat warna Cr/cb yg terang yang ingin kita deteksi
                 % dalam kasus ini menggunakan cr
masker =zeros(size(cr));
switch dataset_name
    case 1
        idx = find(cr>=136& cr<=145); %step 5 terapkan treshold
    case 2
        idx = find(cr>=130& cr<=153); %step 5 terapkan treshhold
end
masker(idx) =1; 
%  figure;imshow(cr);

%% proses denoising
masker1=bwareaopen(masker,200); %untuk menghilangkan noise kecil2
masker2=imfill(masker1,'holes'); %menghilangkan noise di daerah putih
masker3=imdilate(masker2,strel('disk',1)); %menghilangkan daerah mata
masker4=imerode(masker3,strel('disk',2)); %untuk mengikis
%% Pengambilan informasi yang dibutuhkan
switch tipe_prepro
        case 1
            %Red
            awal_gambar = r
            im2 = uint8(masker4);
            info=r.*im2;
        case 2
            %Green
            awal_gambar = g
            im2 = uint8(masker4);
            info=g.*im2;
        case 3
            %Blue
            awal_gambar = b
            im2 = uint8(masker4);
            info=b.*im2;
        case 4
            %grayscale
            awal_gambar = grayc
            im2 = uint8(masker4);
            info=grayc.*im2;
        case 5
            %Biner
            awal_gambar = bw
            info=bw.*masker4;
            infp= uint8(info);
        case 6
            %YCbCr (cr)
            awal_gambar = cr
            im2 = uint8(masker4);
            info= cr.*im2;
        case 7
            %HSV (V)
            awal_gambar = V
            im2 = masker4;
            info= V.*im2;
end
switch dataset_name
    case 1
        info = info(15:45,:,:);
    case 2
        info = info(:,:,:); %step 5 terapkan treshhold
end

% figure; imshow (im)
%% Untuk menampilkan Proses Pre-processing
% figure;
% subplot(3,3,1); imshow(awal_gambar);   title('Gambar awal');
% subplot(3,3,2); imshow(masker1); title('Denoising');
% subplot(3,3,3); imshow(masker2); title('Fill Holes');
% subplot(3,3,4); imshow(masker3); title('dilasi');
% subplot(3,3,5); imshow(masker4); title('erosi');
% subplot(3,3,6); imshow(info);    title('Hasil segmentasi');