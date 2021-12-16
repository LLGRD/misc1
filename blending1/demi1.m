
%=======================================
% [img1,det1] = demi1(img0)
%---------------------------------------
% Decomposition d'une image 2k*2k*3 
% img0 en deux images img1 et det1 :
% img1 : k*k*3 image reduite 
% det1 : 2k*2k*3 detail (img0-img1) 
%---------------------------------------
% Laman - 14/12/2021 - 17h40 
%=======================================

function [img1,det1] = demi1(img0)

img1 = (img0(1:2:end,:,:)+img0(2:2:end,:,:))/2;
img1 = (img1(:,1:2:end,:)+img1(:,2:2:end,:))/2;
det1 = img0 - double1(img1);

endfunction
