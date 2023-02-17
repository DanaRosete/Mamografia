%A00832064 Dana Paola Rosete Gómez
%ACTIVIDAD 1 ESCALA DE GRISES, FILTROS Y RUIDOS

clc; 
clear all; close all;

imagen = imread('rgb.png');

figure (1)
imshow(imagen);
title ("Imagen RGB original");

figure(2)
gris = rgb2gray(imagen);
imshow(gris);
title ("Imagen RGB en escala de grises");

figure(3)
subplot(1,3,1);
Gauss1 = imgaussfilt(gris);
imshow(Gauss1);
title ("Sigma normal");
subplot(1,3,2);
Gauss2 = imgaussfilt(gris,0.7);
imshow(Gauss2);
title ("Sigma 10");
subplot(1,3,3);
Gauss3 = imgaussfilt(gris,15);
imshow(Gauss3);
title ("Sigma 20");

figure(4)
wiener1 = wiener2(gris,[10 10]);
imshow(wiener1);
title ("Imagen con filtro wiener 5 5");

figure(5)
subplot(1,2,1);
imshow(gris);
title ("Escala de Grises");
subplot(1,2,2);
mediano = medfilt2(gris);
imshow(mediano);
title ("Filtro mediano");

%%%EJERCICIO 6
figure(6)
subplot(2,3,1);
imshow(gris);
title ("Escala de Grises");
subplot(2,3,2);
RG = imnoise(gris,'gaussian');
imshow(RG);
title ("Ruido Gaussiano");
subplot(2,3,3);
RP = imnoise(gris,'poisson');
imshow(RP);
title ("Ruido Poisson");
subplot(2,3,4);
RSP = imnoise(gris,'salt & pepper');
imshow(RSP);
title ("Ruido Salt and Pepper"); %%mediano
subplot(2,3,5);
RS = imnoise(gris,'speckle');
imshow(RS);
title ("Ruido Speckle");

%%  Ejercicio 7

%%Gaussiano
figure(7)
subplot(1,3,1);
imshow(gris);
title ("Imagen original");
subplot(1,3,2);
imshow(RG);
title ("Ruido Gaussiano");
subplot(1,3,3);
wP = wiener2(RP,[5 5]);
imshow(wP);
title ("Imagen con filtro Wiener");

%% RUIDO POISSON

figure(8)
subplot(1,3,1);
imshow(gris);
title ("Imagen original");
subplot(1,3,2);
imshow(RP);
title ("Ruido Poisson");
subplot(1,3,3);
wP = wiener2(RP,[10 10]);
imshow(wP);
title ("Imagen con filtro Wiener");

%% RUIDO SALT AND PEPPER
figure(9)
subplot(1,3,1);
imshow(gris);
title ("Imagen original");
subplot(1,3,2);
imshow(RSP);
title ("Ruido Salt and pepper");
subplot(1,3,3);
mRSP = medfilt2(gris);
imshow(mRSP);
title ("Imagen con filtro mediano");

%% RUIDO SPECKLE
figure (10)
subplot(1,3,1);
imshow(gris);
title ("Imagen original");
subplot(1,3,2);
imshow(RS);
title ("Ruido Speckle");
subplot(1,3,3);
mRS = medfilt2(RS);
imshow(mRS);
title ("Imagen con filtro mediano");
