
%=======================================
% [] = poisson1()
%---------------------------------------
% Test fusion d'images par integration 
% de gradients. Les resultats sont dans
% le dossier "poisson1"
%---------------------------------------
% Laman - 15/12/2021 - 17h50 (IGN) 
%=======================================

function [] = poisson1()

img1 = double(imread('img1.png'));
img2 = double(imread('img2.png'));
m = double(imread('img3.png')(:,:,1))/255;
[gx1r,gy1r] = gradient(img1(:,:,1));
[gx1v,gy1v] = gradient(img1(:,:,2));
[gx1b,gy1b] = gradient(img1(:,:,3));
[gx2r,gy2r] = gradient(img2(:,:,1));
[gx2v,gy2v] = gradient(img2(:,:,2));
[gx2b,gy2b] = gradient(img2(:,:,3));
[h0,w0] = size(m);

gxr = (1-m).*gx1r + m.*gx2r;
gxv = (1-m).*gx1v + m.*gx2v;
gxb = (1-m).*gx1b + m.*gx2b;
gyr = (1-m).*gy1r + m.*gy2r;
gyv = (1-m).*gy1v + m.*gy2v;
gyb = (1-m).*gy1b + m.*gy2b;
imr = (1-m).*img1(:,:,1) + m.*img2(:,:,1);
imv = (1-m).*img1(:,:,2) + m.*img2(:,:,2);
imb = (1-m).*img1(:,:,3) + m.*img2(:,:,3);

clear img1 img2 m;
clear gx1r gx1v gx1b gx2r gx2v gx2b;
clear gy1r gy1v gy1b gy2r gy2v gy2b;

mr = mean(imr(:)); % a
mv = mean(imv(:)); % s
mb = mean(imb(:)); % t
sr = std(imr(:));  % u
sv = std(imv(:));  % c
sb = std(imb(:));  % e

gxr = fftshift(fft2(gxr));
gxv = fftshift(fft2(gxv));
gxb = fftshift(fft2(gxb));
gyr = fftshift(fft2(gyr));
gyv = fftshift(fft2(gyv));
gyb = fftshift(fft2(gyb));
imr = fftshift(fft2(imr));
imv = fftshift(fft2(imv));
imb = fftshift(fft2(imb));
x = (1:w0)/w0 - 0.5;
y = (1:h0)/h0 - 0.5;
[x,y] = meshgrid(x,y);
r = x.^2 + y.^2;
L = 2.^(-(0:15));

if ~exist('poisson1','dir')
	mkdir('poisson1');
endif

for k = 1:length(L)
	t = zeros(h0,w0,3);
  i = complex(0,1);
	u = L(k)*imr - 2*i*pi*(x.*gxr + y.*gyr);
	u = u./(L(k) + 4*pi*pi*r);
  u = real(ifft2(ifftshift(u)));
  mu = mean(u(:));
  su = std(u(:));
	t(:,:,1) = sr*(u - mu)/su + mr;
	u = L(k)*imv - 2*i*pi*(x.*gxv + y.*gyv);
	u = u./(L(k) + 4*pi*pi*r);
	u = real(ifft2(ifftshift(u)));
  mu = mean(u(:));
  su = std(u(:));
	t(:,:,2) = sv*(u - mu)/su + mv;
	u = L(k)*imb - 2*i*pi*(x.*gxb + y.*gyb);
	u = u./(L(k) + 4*pi*pi*r);
	u = real(ifft2(ifftshift(u)));
  mu = mean(u(:));
  su = std(u(:));
	t(:,:,3) = sb*(u - mu)/su + mb;
	n = num2str(1000+k);
	n = ['poisson1/img',n(2:end),'.png'];
	imwrite(uint8(t),n);
endfor

endfunction
