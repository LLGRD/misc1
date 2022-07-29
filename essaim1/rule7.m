
%======================================
% [p2,d2] = rule7(p1,d1,H,W,D)
%--------------------------------------
% Mouvement des zozios de la position 
% p1 = [x1,y1,z1] et direction d1 vers 
% position p2 et d2 qui sera le vecteur
% unitaire [x2-x1,y2-y1,z2-z1]/d12. 
%--------------------------------------
% Avancement du zozio 
% Evitement des autres zozios
% Alignement avec les voisins 
% Rapprochement des voisins
%--------------------------------------
% Laman - 29/06/2022 - 17:33
% modif - 08/07/2022 - 00:30
%======================================

function [p2,d2] = rule7(p1,d1,H,W,D)

p2 = p1+6*d1+(rand(size(p1))-0.5)/4;

M = sqrt(H^2+W^2+D^2)/4;

np = size(p1,1);
dx = repmat(p2(:,1),[1,np]);
dx = dx-dx';
dy = repmat(p2(:,2),[1,np]);
dy = dy-dy';
dz = repmat(p2(:,3),[1,np]);
dz = dz-dz';
rr = dx.^2+dy.^2+dz.^2;
rr = sqrt(rr)+(H+W+D)*eye(np);
rr = max(real(rr),0.000001); % bidouille 1
re = max(2./rr-0.1,0);
ra = max(exp(-((rr-32)/4).^2)-0.1,0)/0.9;
rr = max(exp(-((rr-128)/8).^2)-0.2,0)/0.8;
vx = (repmat(d1(:,1),[1,np]))';
vy = (repmat(d1(:,2),[1,np]))';
vz = (repmat(d1(:,3),[1,np]))';

se = max(sum(re,2),0.000001);
sa = max(sum(ra,2),0.000001);
sr = max(sum(rr,2),0.000001);
ke = 0.06;
ka = 0.4;
kr = 0.2/np;

t = p2(:,1); % -------------- x
t = t-kr*sum(rr.*dx,2)./sr;
t = t+ka*sum(ra.*vx,2)./sa;
t = t+ke*sum(re.*dx,2)./se;
t = t+max(6./abs(t-1)-0.2,0);
t = t-max(6./abs(W-t)-0.2,0);
p2(:,1) = min(max(t,1),W);
t = p2(:,2); % -------------- y
t = t-kr*sum(rr.*dy,2)./sr;
t = t+ka*sum(ra.*vy,2)./sa;
t = t+ke*sum(re.*dy,2)./se;
t = t+max(6./abs(t-1)-0.2,0);
t = t-max(6./abs(H-t)-0.2,0);
p2(:,2) = min(max(t,1),H);
t = p2(:,3); % -------------- z
t = t-kr*sum(rr.*dz,2)./sr;
t = t+ka*sum(ra.*vz,2)./sa;
t = t+ke*sum(re.*dz,2)./se;
t = t+max(6./abs(t-1)-0.2,0);
t = t-max(6./abs(D-t)-0.2,0);
p2(:,3) = min(max(t,1),D);

d2 = p2-p1;
t = sqrt(sum((d2).^2,2));
t = max(repmat(t,[1,3]),0.00001);
d2 = d2./t;
p2 = p1+d2/1.5;

endfunction
