
%======================================
% [p2,d2] = rule6(p1,d1,H,W,D)
%--------------------------------------
% Mouvement des zozios de la position 
% p1 = [x1,y1,z1] et direction d1 vers 
% position p2 et d2 qui sera le vecteur
% unitaire [x2-x1,y2-y1,z2-z1]/d12. 
%--------------------------------------
% Avancement du zozio 
% Evitement des bords
%--------------------------------------
% Laman - 29/06/2022 - 17:33
% modif - 06/07/2022 - 14:20
%======================================

function [p2,d2] = rule6(p1,d1,H,W,D)

p2 = p1+2*d1+(rand(size(p1))-0.5)/4;

t = p2(:,1); % -------------- x
t = t+max(6./abs(t-1)-0.2,0);
t = t-max(6./abs(W-t)-0.2,0);
p2(:,1) = min(max(t,1),W);
t = p2(:,2); % -------------- y
t = t+max(6./abs(t-1)-0.2,0);
t = t-max(6./abs(H-t)-0.2,0);
p2(:,2) = min(max(t,1),H);
t = p2(:,3); % -------------- z
t = t+max(6./abs(t-1)-0.2,0);
t = t-max(6./abs(D-t)-0.2,0);
p2(:,3) = min(max(t,1),D);

d2 = p2-p1;
t = sqrt(sum((d2).^2,2));
t = max(repmat(t,[1,3]),0.00001);
d2 = d2./t;
p2 = p1+d2/1.5;

endfunction
