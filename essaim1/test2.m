
%======================================
% [] = test2()
%--------------------------------------
% Deuxieme test essaim de zozios 
%--------------------------------------
% Laman - 30/06/2022 - 12:50
% modif - 06/07/2022 - 14:30 (3D)
%======================================

function [] = test2()

tic;

K = 19;   % D' = K.D
H = 720;  % Hauteur
W = 1280; % Largeur
D = 960;  % Profondeur
N = 3000; % Nombre zozios
P = 4500; % Nombre frames

p = rand(N,3);
p(:,1) = (9*W/10)*p(:,1)+W/20;
p(:,2) = (9*H/10)*p(:,2)+H/20;
p(:,3) = (9*D/10)*p(:,3)+D/20;
%p(:,1) = (1*W/10)*p(:,1)+9*W/20;
%p(:,2) = (1*H/10)*p(:,2)+9*H/20;
%p(:,3) = (1*D/10)*p(:,3)+9*D/20;
d = rand(N,3)-0.5;
d = d./repmat(sqrt(sum(d.^2,2)),[1,3]);

t = zeros(H,W,3);

if ~exist('test2','dir')
    mkdir('test2');
endif

for k = 1:P
    t = max(0.94*t-2,0);
    
    x = p(:,1);
    y = p(:,2);
    z = p(:,3);
    xg = x-x.*z./(z+K*D);
    xd = x+(W-x).*z./(z+K*D);
    xg = min(max(round(xg),1),W);
    xd = min(max(round(xd),1),W); 
    y = min(max(round(y),1),H);
    ug = sub2ind([H,W],y,xg);
    ud = sub2ind([H,W],y,xd);
    a = zeros(H,W);
    a(ud) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,2) = max(t(:,:,2),a);
    t(:,:,3) = max(t(:,:,3),a);
    a = zeros(H,W);
    a(ug) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,1) = max(t(:,:,1),a);
    [p,d] = rule6(p,d,H,W,D);
    
    x = p(:,1);
    y = p(:,2);
    z = p(:,3);
    xg = x-x.*z./(z+K*D);
    xd = x+(W-x).*z./(z+K*D);
    xg = min(max(round(xg),1),W);
    xd = min(max(round(xd),1),W); 
    y = min(max(round(y),1),H);
    ug = sub2ind([H,W],y,xg);
    ud = sub2ind([H,W],y,xd);
    a = zeros(H,W);
    a(ud) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,2) = max(t(:,:,2),a);
    t(:,:,3) = max(t(:,:,3),a);
    a = zeros(H,W);
    a(ug) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,1) = max(t(:,:,1),a);
    [p,d] = rule7(p,d,H,W,D);
    
    x = p(:,1);
    y = p(:,2);
    z = p(:,3);
    xg = x-x.*z./(z+K*D);
    xd = x+(W-x).*z./(z+K*D);
    xg = min(max(round(xg),1),W);
    xd = min(max(round(xd),1),W); 
    y = min(max(round(y),1),H);
    ug = sub2ind([H,W],y,xg);
    ud = sub2ind([H,W],y,xd);
    a = zeros(H,W);
    a(ud) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,2) = max(t(:,:,2),a);
    t(:,:,3) = max(t(:,:,3),a);
    a = zeros(H,W);
    a(ug) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,1) = max(t(:,:,1),a);
    [p,d] = rule6(p,d,H,W,D);
    
    x = p(:,1);
    y = p(:,2);
    z = p(:,3);
    xg = x-x.*z./(z+K*D);
    xd = x+(W-x).*z./(z+K*D);
    xg = min(max(round(xg),1),W);
    xd = min(max(round(xd),1),W); 
    y = min(max(round(y),1),H);
    ug = sub2ind([H,W],y,xg);
    ud = sub2ind([H,W],y,xd);
    a = zeros(H,W);
    a(ud) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,2) = max(t(:,:,2),a);
    t(:,:,3) = max(t(:,:,3),a);
    a = zeros(H,W);
    a(ug) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,1) = max(t(:,:,1),a);
    [p,d] = rule7(p,d,H,W,D);
    
    x = p(:,1);
    y = p(:,2);
    z = p(:,3);
    xg = x-x.*z./(z+K*D);
    xd = x+(W-x).*z./(z+K*D);
    xg = min(max(round(xg),1),W);
    xd = min(max(round(xd),1),W); 
    y = min(max(round(y),1),H);
    ug = sub2ind([H,W],y,xg);
    ud = sub2ind([H,W],y,xd);
    a = zeros(H,W);
    a(ud) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,2) = max(t(:,:,2),a);
    t(:,:,3) = max(t(:,:,3),a);
    a = zeros(H,W);
    a(ug) = 255-231*z/D;
    a = imfilter(a,[0.2,0.8,1,0.8,0.2]);
    a = imfilter(a,[0.2;0.8;1;0.8;0.2]);
    t(:,:,1) = max(t(:,:,1),a);
    [p,d] = rule6(p,d,H,W,D);
    
    n = num2str(10000+k);
    n = ['test2/',n(2:end),'.png'];
    imwrite(uint8(t),n);
    
    %---------------------- compteur
    sc = toc;
    hr = floor(sc/3600);
    mn = floor((sc-3600*hr)/60);
    sc = floor(sc-60*mn-3600*hr);
    fprintf('- %i / %i - (%i:%i:%i)\n',k,P,hr,mn,sc);
endfor

endfunction
