
%======================================
% [] = test2b()
%--------------------------------------
% Intro et outro du film "aquarium" 
%--------------------------------------
% Laman - 29/07/2022 - 02:18
%======================================

function [] = test2b()

tic;

H = 720;  % Hauteur
W = 1280; % Largeur
P = 4500; % Nombre frames

if ~exist('test2b','dir')
    mkdir('test2b');
endif

t = imread('z_illustration_1.png');
c = 0;
for k = 1:45
    c = c+1;
    n = num2str(10000+c);
    n = ['test2b/',n(2:end),'.png'];
    imwrite(t,n);
endfor

u = imread('z_illustration_2.png');
t = double(t);
u = double(u);
x = (0:(W-1))/(W-1);
x = repmat(x,[H,1,3]);
y = [16,8,4,2,1,1/2,1/4,1/8,1/16];
for k = 1:9
    c = c+1;
    v = x.^y(k);
    v = (1-v).*t+v.*u;
    n = num2str(10000+c);
    n = ['test2b/',n(2:end),'.png'];
    imwrite(uint8(v),n);
endfor

t = imread('z_illustration_3.png');
t = double(t);
for k = 1:9
    c = c+1;
    v = x.^y(10-k);
    v = (1-v).*t+v.*u;
    n = num2str(10000+c);
    n = ['test2b/',n(2:end),'.png'];
    imwrite(uint8(v),n);
endfor

f = [1;2;1]/4;
g = [1,3,3,1,0]/8;
d = [0,1,3,3,1]/8;
for k = 1:65
    c = c+1;
    n = num2str(10000+c);
    n = ['test2/',n(2:end),'.png'];
    n = double(imread(n));
    v = (k-1)/64;
    t = imfilter(t,f);
    t(:,:,1) = imfilter(t(:,:,1),g);
    t(:,:,2) = imfilter(t(:,:,2),d);
    t(:,:,3) = imfilter(t(:,:,3),d);
    t = imfilter(imfilter(t,f),f');
    v = (1-v)*t+v*n;
    n = num2str(10000+c);
    n = ['test2b/',n(2:end),'.png'];
    imwrite(uint8(v),n);
endfor

c = P-90;
for k = 1:90
    c = c+1;
    n = num2str(10000+c);
    n = ['test2/',n(2:end),'.png'];
    n = double(imread(n));
    v = (k-1)/89;
    v = (1-v)*n;
    n = num2str(10000+c);
    n = ['test2b/',n(2:end),'.png'];
    imwrite(uint8(v),n);
endfor

fprintf('\nTime : %i sec\n\n',round(toc));

endfunction
