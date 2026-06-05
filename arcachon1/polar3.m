
%=================================
% [] = polar3()
%---------------------------------
% Film Polar-Log + rayon... 
%---------------------------------
% Laman - 02/06/2026 - 15:30
% modif - 05/06/2026 - 00:10
%=================================

function [] = polar3()

if ~exist('polar3','dir')
  mkdir('polar3');
endif

%------------- Point "Nemo" :
c = load('polar1.txt');
p = load('fond1.pgw');
xc = (c(1)-p(5))/(5*p(1));
yc = (c(2)-p(6))/(5*p(4));

d = double(imread('dist1.png'));
d = imfilter(d,ones(3)/9);
%d = imfilter(d,ones(3)/9);
d(1,:) = 0;
d(end,:) = 0;
d(:,1) = 0;
d(:,end) = 0;

r0 = double(imread('polar1.tif'));
r0 = r0/500; % BIDOUILLE 1 !

F = zeros(1080,1920); % video frame

[h,w] = size(d);
[nr,nt] = size(r0);
x = 2*pi*(0:(nt-1))/nt;
y = 1:nr;
[x,y] = meshgrid(x,y);

% WARNING - THIS IS "DARK MAGIC"
r1 = repmat((1:400)',[1,nt]);
r1 = max(r1.*double(r0(1:400,:)>30));
r2 = mean(r0(1,:),2);
r1 = r1-mean(r1(:))+1.6*r2;
r1 = (r1+r0(1,:))/2;
r1 = [r1(667:end),r1(1:666)];
for k = 1:5
  r1 = imfilter(r1,ones(1,55)/55,'replicate');
endfor
r1 = [r1((end-666):end),r1(1:(end-667))];

N = 200;
for k = 1:(N/4)
  fprintf('_');
endfor
fprintf('\n');

for k = 1:N
  %---------------------------- METHODE 1 :
  yk = repmat(r0(k,:),[nr,1]);
  yk = exp(2*y./nr).*(yk+k/2); % BIDOUILLE 2 ! 
  xx = yk.*cos(x) + xc;
  yy = yk.*sin(x) + yc;
  xx = min(max(round(xx),1),w);
  yy = min(max(round(yy),1),h);
  u = sub2ind([h,w],yy,xx);
  u = d(u);
  u(1:140,:) = u(1:140,:)/4;
  F(551:(end-50),61:(end-60)) = u;
  %---------------------------- METHODE 2 :
  yk = ((N-k)*r2+k*r1)/N;
  yk = repmat(yk,[nr,1]);
  yk = exp(2*y./nr).*yk;
  xx = yk.*cos(x) + xc;
  yy = yk.*sin(x) + yc;
  xx = min(max(round(xx),1),w);
  yy = min(max(round(yy),1),h);
  u = sub2ind([h,w],yy,xx);
  u = d(u);
  u(1:140,:) = u(1:140,:)/4;
  F(51:530,61:(end-60)) = u;
  u = num2str(1000+k);
  u = ['polar3/',u(2:end),'.png'];;
  %imwrite(flip(uint8(F(1:2:end,1:2:end)),1),u);
  imwrite(flip(uint8(F),1),u);
  if mod(k,4)==0
    fprintf('*');
  endif
end
fprintf('\n');

endfunction

