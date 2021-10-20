# -*- coding: utf-8 -*-
"""
----------------------------------------
Test de transfert d'histogramme
----------------------------------------
@auth : Lâmân Lelégard
@date : 20-01-2016
----------------------------------------
"""

import numpy as np
import matplotlib.pyplot as plt
from skimage import io

img1 = io.imread('image1.png')
img2 = io.imread('image2.png')
img1 = img1[:,:,0]
img2 = img2[:,:,0]

plt.figure(1)
plt.imshow(img1)
plt.title('Image 1')
plt.figure(2)
plt.imshow(img2)
plt.title('Image 2')

plt.figure(3)
hist1 = np.histogram(img1.ravel(),bins=256)
plt.plot(np.arange(256),hist1[0])
plt.title('Histogramme 1')

plt.figure(4)
hist2 = np.histogram(img2.ravel(),bins=256)
plt.plot(np.arange(256),hist2[0])
plt.title('Histogramme 2')

histcum1 = hist1[0]
histcum2 = hist2[0]
for k in range(1,256):
    histcum1[k] = histcum1[k-1] + histcum1[k]
    histcum2[k] = histcum2[k-1] + histcum2[k]
histcum1 = 255*histcum1/histcum1[-1]
histcum2 = 255*histcum2/histcum2[-1]

plt.figure(5)
plt.plot(np.arange(256),histcum1)
plt.title('Histogramme cumulé 1')
plt.figure(6)
plt.plot(np.arange(256),histcum2)
plt.title('Histogramme cumulé 2')

symhistcum1 = 255*np.ones((256))
for k in range(1,256):
    val = int(histcum1[-k])
    symhistcum1[0:val] = (256-k)*np.ones((val))
transf2v1 = np.zeros((256))
for k in range(1,256):
    transf2v1[k] = symhistcum1[int(histcum2[k])]

plt.figure(7)
plt.plot(np.arange(256),transf2v1)
plt.title('Courbe de transfert 2 vers 1')

img3 = transf2v1[img2]
img_diff = img1-img3
plt.figure(8)
plt.imshow(img_diff)
plt.colorbar()
plt.title('Carte de différence')

#------------ THAT'S ALL FOLKS ! -------------
