
%=======================================
% [] = recompo1()
%---------------------------------------
% Recomposition des images de main, 
% oeil et masque en pyramides dans 
% le dossier "recompo1" (animation)
%---------------------------------------
% Laman - 14/12/2021 - 18h15 
%=======================================

function [] = recompo1()

dimg1 = double(imread('decompo1/img1.png'));
dimg2 = double(imread('decompo1/img2.png'));
dimg3 = double(imread('decompo1/img3.png'));
[h0,w0,~] = size(dimg1);
h0 = 2*h0/3;

if ~exist('recompo1','dir')
	mkdir('recompo1');
endif

% 1
i1 = dimg1((h0+1):(257*h0/256),(1+127*w0/128):(255*w0/256),:);
i2 = dimg2((h0+1):(257*h0/256),(1+127*w0/128):(255*w0/256),:);
m = dimg3((h0+1):(257*h0/256),(1+127*w0/128):(255*w0/256),:)/255;
i3a = (1-m).*i1 + m.*i2;
% 2
i1 = double1(i1);
i2 = double1(i2);
i3a = double1(i3a);
d1 = dimg1((h0+1):(129*h0/128),(1+63*w0/64):(127*w0/128),:)-128;
d2 = dimg2((h0+1):(129*h0/128),(1+63*w0/64):(127*w0/128),:)-128;
m = dimg3((h0+1):(129*h0/128),(1+63*w0/64):(127*w0/128),:)/255;
i1 = i1 + d1;
i2 = i2 + d2;
i3b = (1-m).*i1 + m.*i2;
i3a = i3a + (1-m).*d1 + m.*d2;
% 3
i1 = double1(i1);
i2 = double1(i2);
i3a = double1(i3a);
i3b = double1(i3b);
d1 = dimg1((h0+1):(65*h0/64),(1+31*w0/32):(63*w0/64),:)-128;
d2 = dimg2((h0+1):(65*h0/64),(1+31*w0/32):(63*w0/64),:)-128;
m = dimg3((h0+1):(65*h0/64),(1+31*w0/32):(63*w0/64),:)/255;
i1 = i1 + d1;
i2 = i2 + d2;
i3c = (1-m).*i1 + m.*i2;
i3b = i3b + (1-m).*d1 + m.*d2;
i3a = i3a + (1-m).*d1 + m.*d2;
% 4
i1 = double1(i1);
i2 = double1(i2);
i3a = double1(i3a);
i3b = double1(i3b);
i3c = double1(i3c);
d1 = dimg1((h0+1):(33*h0/32),(1+15*w0/16):(31*w0/32),:)-128;
d2 = dimg2((h0+1):(33*h0/32),(1+15*w0/16):(31*w0/32),:)-128;
m = dimg3((h0+1):(33*h0/32),(1+15*w0/16):(31*w0/32),:)/255;
i1 = i1 + d1;
i2 = i2 + d2;
i3d = (1-m).*i1 + m.*i2;
i3c = i3c + (1-m).*d1 + m.*d2;
i3b = i3b + (1-m).*d1 + m.*d2;
i3a = i3a + (1-m).*d1 + m.*d2;
% 5
i1 = double1(i1);
i2 = double1(i2);
i3a = double1(i3a);
i3b = double1(i3b);
i3c = double1(i3c);
i3d = double1(i3d);
d1 = dimg1((h0+1):(17*h0/16),(1+7*w0/8):(15*w0/16),:)-128;
d2 = dimg2((h0+1):(17*h0/16),(1+7*w0/8):(15*w0/16),:)-128;
m = dimg3((h0+1):(17*h0/16),(1+7*w0/8):(15*w0/16),:)/255;
i1 = i1 + d1;
i2 = i2 + d2;
i3e = (1-m).*i1 + m.*i2;
i3d = i3d + (1-m).*d1 + m.*d2;
i3c = i3c + (1-m).*d1 + m.*d2;
i3b = i3b + (1-m).*d1 + m.*d2;
i3a = i3a + (1-m).*d1 + m.*d2;
% 6
i1 = double1(i1);
i2 = double1(i2);
i3a = double1(i3a);
i3b = double1(i3b);
i3c = double1(i3c);
i3d = double1(i3d);
i3e = double1(i3e);
d1 = dimg1((h0+1):(9*h0/8),(1+3*w0/4):(7*w0/8),:)-128;
d2 = dimg2((h0+1):(9*h0/8),(1+3*w0/4):(7*w0/8),:)-128;
m = dimg3((h0+1):(9*h0/8),(1+3*w0/4):(7*w0/8),:)/255;
i1 = i1 + d1;
i2 = i2 + d2;
i3f = (1-m).*i1 + m.*i2;
i3e = i3e + (1-m).*d1 + m.*d2;
i3d = i3d + (1-m).*d1 + m.*d2;
i3c = i3c + (1-m).*d1 + m.*d2;
i3b = i3b + (1-m).*d1 + m.*d2;
i3a = i3a + (1-m).*d1 + m.*d2;
% 7
i1 = double1(i1);
i2 = double1(i2);
i3a = double1(i3a);
i3b = double1(i3b);
i3c = double1(i3c);
i3d = double1(i3d);
i3e = double1(i3e);
i3f = double1(i3f);
d1 = dimg1((h0+1):(5*h0/4),(1+w0/2):(3*w0/4),:)-128;
d2 = dimg2((h0+1):(5*h0/4),(1+w0/2):(3*w0/4),:)-128;
m = dimg3((h0+1):(5*h0/4),(1+w0/2):(3*w0/4),:)/255;
i1 = i1 + d1;
i2 = i2 + d2;
i3g = (1-m).*i1 + m.*i2;
i3f = i3f + (1-m).*d1 + m.*d2;
i3e = i3e + (1-m).*d1 + m.*d2;
i3d = i3d + (1-m).*d1 + m.*d2;
i3c = i3c + (1-m).*d1 + m.*d2;
i3b = i3b + (1-m).*d1 + m.*d2;
i3a = i3a + (1-m).*d1 + m.*d2;
% 8
i1 = double1(i1);
i2 = double1(i2);
i3a = double1(i3a);
i3b = double1(i3b);
i3c = double1(i3c);
i3d = double1(i3d);
i3e = double1(i3e);
i3f = double1(i3f);
i3g = double1(i3g);
d1 = dimg1((h0+1):end,1:w0/2,:)-128;
d2 = dimg2((h0+1):end,1:w0/2,:)-128;
m = dimg3((h0+1):end,1:w0/2,:)/255;
i1 = i1 + d1;
i2 = i2 + d2;
i3h = (1-m).*i1 + m.*i2;
i3g = i3g + (1-m).*d1 + m.*d2;
i3f = i3f + (1-m).*d1 + m.*d2;
i3e = i3e + (1-m).*d1 + m.*d2;
i3d = i3d + (1-m).*d1 + m.*d2;
i3c = i3c + (1-m).*d1 + m.*d2;
i3b = i3b + (1-m).*d1 + m.*d2;
i3a = i3a + (1-m).*d1 + m.*d2;
% 9
i1 = double1(i1);
i2 = double1(i2);
i3a = double1(i3a);
i3b = double1(i3b);
i3c = double1(i3c);
i3d = double1(i3d);
i3e = double1(i3e);
i3f = double1(i3f);
i3g = double1(i3g);
i3h = double1(i3h);
d1 = dimg1(1:h0,1:w0,:)-128;
d2 = dimg2(1:h0,1:w0,:)-128;
m = dimg3(1:h0,1:w0,:)/255;
i1 = i1 + d1;
i2 = i2 + d2;
i3i = (1-m).*i1 + m.*i2;
i3h = i3h + (1-m).*d1 + m.*d2;
i3g = i3g + (1-m).*d1 + m.*d2;
i3f = i3f + (1-m).*d1 + m.*d2;
i3e = i3e + (1-m).*d1 + m.*d2;
i3d = i3d + (1-m).*d1 + m.*d2;
i3c = i3c + (1-m).*d1 + m.*d2;
i3b = i3b + (1-m).*d1 + m.*d2;
i3a = i3a + (1-m).*d1 + m.*d2;

imwrite(uint8(i3i),'recompo1/img01.png');
imwrite(uint8(i3h),'recompo1/img02.png');
imwrite(uint8(i3g),'recompo1/img03.png');
imwrite(uint8(i3f),'recompo1/img04.png');
imwrite(uint8(i3e),'recompo1/img05.png');
imwrite(uint8(i3d),'recompo1/img06.png');
imwrite(uint8(i3c),'recompo1/img07.png');
imwrite(uint8(i3b),'recompo1/img08.png');
imwrite(uint8(i3a),'recompo1/img09.png');

endfunction
