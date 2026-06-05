
%=================================
% [] = polar1()
%---------------------------------
% Projection azimutale de 'dist1'
% centre sur le max (pt 'nemo') 
%---------------------------------
% Laman - 02/06/2026 - 12:00
%=================================

function [] = polar1()

d = 1-double(imread('mask1.png'))/255;
d = double(imread('dist1.tif')).*d;

[h,w] = size(d);
[x,y] = max(d(:));
[yc,xc] = ind2sub([h,w],y);

%------------ Lambert 95 : 
p = load('fond1.pgw');
e0 = p(5)+xc*5*p(1);
n0 = p(6)+yc*5*p(4);
dlmwrite('polar1.txt',[e0;n0],...
         'precision','%5.2f','delimiter','\t');

nr = x/100;
nt = 1800;
x = 2*pi*(0:(nt-1))/nt;
y = 1:nr;
[x,y] = meshgrid(x,y);

xx = y.*cos(x) + xc;
yy = y.*sin(x) + yc;
xx = min(max(round(xx),1),w);
yy = min(max(round(yy),1),h);
u = sub2ind([h,w],yy,xx);

imwrite(uint16(d(u)),'polar1.tif');
d = imread('dist1.png');
d = imfilter(imfilter(d,[1,2,1]/4),[1;2;1]/4);
imwrite(d(u),'polar1.png');

%imagesc(s); colorbar; axis('equal');

endfunction

