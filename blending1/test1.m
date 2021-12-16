
%=======================================
% [] = test1()
%---------------------------------------
% Test de blending faisant intervenir :
% img1.png img2.png img3.png
% double1.m 
% demi1.m 
% decompo1.m 
% recompo1.m
% poisson1.m
%---------------------------------------
% Laman - 14/12/2021 - 19h00 
%=======================================

function [] = test1()

tic;
pkg load image;
decompo1;
s = toc;
fprintf('\n -1-  Decomposition : %i sec\n',round(s));
recompo1;
s = toc - s;
fprintf('\n -1-  Recomposition : %i sec\n',round(s));
poisson1;
s = toc - s;
fprintf('\n -2-  Methode Poisson : %i sec\n\n',round(s));

endfunction
