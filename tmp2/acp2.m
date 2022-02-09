
%===============================
% [] = acp2()
%-------------------------------
% Test ACP sur 'toto' et 'titi'
%-------------------------------
% Laman - 03/02/2022 - 19:10
%===============================

function [] = acp2()

tic;
format long;

nom = dir('toto/*.png');
N = length(nom);


fprintf('\nGrosse Matrice : ');
h1 = 577;
w1 = 377;
h1 = (h1-1)/4;
w1 = (w1-1)/4;
%M = zeros(h1*w1*3,N);
M = zeros(h1*w1,N);
fprintf('%i sec\n',floor(toc));

fprintf('\nRemplissage : ');
for k = 1:N
    ch = 'toto/';
    ch = [ch,nom(k).name];
    im = double(imread(ch));
    im = mean(im,3);
    im = (im(1:2:(end-1),:,:) + im(2:2:(end-1),:,:))/2;
    im = (im(:,1:2:(end-1),:) + im(:,2:2:(end-1),:))/2;
    im = (im(1:2:(end),:,:) + im(2:2:(end),:,:))/2;
    im = (im(:,1:2:(end),:) + im(:,2:2:(end),:))/2;
    M(:,k) = double(im(:));
endfor
%M = M./repmat(sqrt(sum(M.^2,1)),[h1*w1*3,1]);
M = M./repmat(sqrt(sum(M.^2,1)),[h1*w1,1]);
fprintf('%i sec\n',floor(toc));
fprintf('\nValeurs Propres : ');
[V,D] = eig(M'*M);
V = flip(V,2);
V = M*V;
%V = V./repmat(sqrt(sum(V.^2,1)),[h1*w1*3,1]);
V = V./repmat(sqrt(sum(V.^2,1)),[h1*w1,1]);
D = M'*V;
clear M V;
D = (D+1)/2; % entre 0 et 1
D = repmat(D,[1,1,3]);
D(:,:,1) = floor(255*D(:,:,1));
D(:,:,2) = floor(255*(255*D(:,:,2)-D(:,:,1)));
D(:,:,3) = floor(255*(255*255*D(:,:,3)-255*D(:,:,2)-D(:,:,1)));
imwrite(uint8(D),'acp2_toto.png');
clear D;
fprintf('%i sec\n',floor(toc));

fprintf('\nGrosse Matrice : ');
h1 = 577;
w1 = 377;
h1 = (h1-1)/4;
w1 = (w1-1)/4;
%M = zeros(h1*w1*3,N);
M = zeros(h1*w1,N);
fprintf('%i sec\n',floor(toc));

fprintf('\nRemplissage : ');
for k = 1:N
    ch = 'titi/';
    ch = [ch,nom(k).name];
    im = double(imread(ch));
    im = mean(im,3);
    im = max(im(1:2:(end-1),:,:),im(2:2:(end-1),:,:));
    im = max(im(:,1:2:(end-1),:),im(:,2:2:(end-1),:));
    im = max(im(1:2:(end),:,:),im(2:2:(end),:,:));
    im = max(im(:,1:2:(end),:),im(:,2:2:(end),:));
    M(:,k) = double(im(:));
endfor
%M = M./repmat(sqrt(sum(M.^2,1)),[h1*w1*3,1]);
M = M./repmat(sqrt(sum(M.^2,1)),[h1*w1,1]);
fprintf('%i sec\n',floor(toc));
fprintf('\nValeurs Propres : ');
[V,D] = eig(M'*M);
V = flip(V,2);
V = M*V;
%V = V./repmat(sqrt(sum(V.^2,1)),[h1*w1*3,1]);
V = V./repmat(sqrt(sum(V.^2,1)),[h1*w1,1]);
D = M'*V;
clear M V;
D = (D+1)/2; % entre 0 et 1
D = repmat(D,[1,1,3]);
D(:,:,1) = floor(255*D(:,:,1));
D(:,:,2) = floor(255*(255*D(:,:,2)-D(:,:,1)));
D(:,:,3) = floor(255*(255*255*D(:,:,3)-255*D(:,:,2)-D(:,:,1)));
imwrite(uint8(D),'acp2_titi.png');
clear D;
fprintf('%i sec\n',floor(toc));

fprintf('\n');

endfunction
