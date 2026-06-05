
%=================================
% [] = dist1()
%---------------------------------
% Carte de distances 'dist1.tif'
%---------------------------------
% Laman - 22/05/2026 - 14:33
%=================================

function [] = dist1()

tic;

t = load('fond1.pgw');
h = 1040; % 5200/5
w = 1080; % 5400/5
[x,y] = meshgrid(1:w,1:h);
x = 5*t(1)*(x-1)+t(5);
y = 5*t(4)*(y-1)+t(6);
t = load('bord0.txt');
t = t(1:2:end,:);
n = length(t);
u = 5*(w+h)*ones(h,w);

for k = 1:45
  fprintf('_');
endfor
fprintf('\n');
for k = 1:n
  d = (x-t(k,1)).^2+(y-t(k,2)).^2;
  u = min(u,sqrt(d));
  if mod(k,floor(n/45))==0
    fprintf('*');
  endif
endfor
fprintf('\n');
v = uint16(min(10*u,2^16-1));
imwrite(v,'dist1.tif');

v = max(1-cos(pi*u/100).^8,0.2);
u = max(1-cos(pi*u/1000).^128,0.1);
t = double(imread('mask1.png'));
t = imerode(t/max(t(:)),ones(7));
x = max(1-cos(pi*x/1000).^512,0.9);
y = max(1-cos(pi*y/1000).^512,0.9);
t = max(min(v,u),0.96*t).*x.*y;
imwrite(uint8(255*t),'dist1.png');

fprintf('Time : %i sec\n',round(toc));

endfunction

