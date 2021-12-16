
%=======================================
% [] = decompo1()
%---------------------------------------
% Decomposition des images de main, 
% oeil et masque en pyramides dans 
% le dossier "decompo1"
%---------------------------------------
% Laman - 14/12/2021 - 17h28 
%=======================================

function [] = decompo1()

img1 = double(imread('img1.png'));
img2 = double(imread('img2.png'));
img3 = double(imread('img3.png'));
[h0,w0,~] = size(img1); % 3*512 pxls
dimg1 = zeros(h0+h0/2,w0,3,'uint8');
dimg2 = zeros(h0+h0/2,w0,3,'uint8');
dimg3 = zeros(h0+h0/2,w0,3,'uint8');

if ~exist('decompo1','dir')
	mkdir('decompo1');
endif

%----------------------------- img1
[i1,d1] = demi1(img1);
[i2,d2] = demi1(i1);
[i3,d3] = demi1(i2);
[i4,d4] = demi1(i3);
[i5,d5] = demi1(i4);
[i6,d6] = demi1(i5);
[i7,d7] = demi1(i6);
[i8,d8] = demi1(i7);
dimg1(1:h0,1:w0,:) = uint8(d1+128);
dimg1((h0+1):end,1:w0/2,:) = uint8(d2+128);
dimg1((h0+1):(5*h0/4),(1+w0/2):(3*w0/4),:) = uint8(d3+128);
dimg1((h0+1):(9*h0/8),(1+3*w0/4):(7*w0/8),:) = uint8(d4+128);
dimg1((h0+1):(17*h0/16),(1+7*w0/8):(15*w0/16),:) = uint8(d5+128);
dimg1((h0+1):(33*h0/32),(1+15*w0/16):(31*w0/32),:) = uint8(d6+128);
dimg1((h0+1):(65*h0/64),(1+31*w0/32):(63*w0/64),:) = uint8(d7+128);
dimg1((h0+1):(129*h0/128),(1+63*w0/64):(127*w0/128),:) = uint8(d8+128);
dimg1((h0+1):(257*h0/256),(1+127*w0/128):(255*w0/256),:) = uint8(i8);
imwrite(dimg1,'decompo1/img1.png');

%----------------------------- img2
[i1,d1] = demi1(img2);
[i2,d2] = demi1(i1);
[i3,d3] = demi1(i2);
[i4,d4] = demi1(i3);
[i5,d5] = demi1(i4);
[i6,d6] = demi1(i5);
[i7,d7] = demi1(i6);
[i8,d8] = demi1(i7);
dimg2(1:h0,1:w0,:) = uint8(d1+128);
dimg2((h0+1):end,1:w0/2,:) = uint8(d2+128);
dimg2((h0+1):(5*h0/4),(1+w0/2):(3*w0/4),:) = uint8(d3+128);
dimg2((h0+1):(9*h0/8),(1+3*w0/4):(7*w0/8),:) = uint8(d4+128);
dimg2((h0+1):(17*h0/16),(1+7*w0/8):(15*w0/16),:) = uint8(d5+128);
dimg2((h0+1):(33*h0/32),(1+15*w0/16):(31*w0/32),:) = uint8(d6+128);
dimg2((h0+1):(65*h0/64),(1+31*w0/32):(63*w0/64),:) = uint8(d7+128);
dimg2((h0+1):(129*h0/128),(1+63*w0/64):(127*w0/128),:) = uint8(d8+128);
dimg2((h0+1):(257*h0/256),(1+127*w0/128):(255*w0/256),:) = uint8(i8);
imwrite(dimg2,'decompo1/img2.png');

%----------------------------- img3 = masque !
[i1,d1] = demi1(img3);
[i2,d2] = demi1(i1);
[i3,d3] = demi1(i2);
[i4,d4] = demi1(i3);
[i5,d5] = demi1(i4);
[i6,d6] = demi1(i5);
[i7,d7] = demi1(i6);
[i8,d8] = demi1(i7);
dimg3(1:h0,1:w0,:) = uint8(img3);
dimg3((h0+1):end,1:w0/2,:) = uint8(i1);
dimg3((h0+1):(5*h0/4),(1+w0/2):(3*w0/4),:) = uint8(i2);
dimg3((h0+1):(9*h0/8),(1+3*w0/4):(7*w0/8),:) = uint8(i3);
dimg3((h0+1):(17*h0/16),(1+7*w0/8):(15*w0/16),:) = uint8(i4);
dimg3((h0+1):(33*h0/32),(1+15*w0/16):(31*w0/32),:) = uint8(i5);
dimg3((h0+1):(65*h0/64),(1+31*w0/32):(63*w0/64),:) = uint8(i6);
dimg3((h0+1):(129*h0/128),(1+63*w0/64):(127*w0/128),:) = uint8(i7);
dimg3((h0+1):(257*h0/256),(1+127*w0/128):(255*w0/256),:) = uint8(i8);
imwrite(dimg3,'decompo1/img3.png');

endfunction
