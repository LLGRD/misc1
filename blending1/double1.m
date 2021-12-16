
%=======================================
% [img1] = double1(img0)
%---------------------------------------
% Double la taille d'une image RVB
%---------------------------------------
% Laman - 14/12/2021 - 19h30 
%=======================================

function [img1] = double1(img0)

img1 = [img0,img0;img0,img0];
img1(:,:,1) = kron(img0(:,:,1),ones(2));
img1(:,:,2) = kron(img0(:,:,2),ones(2));
img1(:,:,3) = kron(img0(:,:,3),ones(2));
img1 = imfilter(img1,[1,2,1]/4,'replicate');
img1 = imfilter(img1,[1;2;1]/4,'replicate');

endfunction
