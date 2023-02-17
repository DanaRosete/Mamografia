%A00832064 Dana Paola Rosete Gómez
%ACTIVIDAD 2 HISTOGRAMA Y MEJORA DE CONTRASTE

clc; 
clear all; close all;

%%%Ejercicio 1
imagen = imread('imagen.jpg');
figure (1)
subplot(2,2,1);
imshow(imagen);
title ("Imagen original");
subplot(2,2,2);
imhist(imagen);
title ("Histograma de imagen original");

%% Gris Ejercicio2
gris = rgb2gray(imagen);
figure (2)
subplot(2,2,1);
imshow(gris);
title ("Imagen en escala de grises");
subplot(2,2,2);
imhist(gris);
title ("Histograma de imagen en escala de grises");

%% Crea una imagen  EJERCICIO3
R = fspecial("disk", 50);
R = R + 0.5;
figure (3)
subplot(2,3,1);
imshow(R);
title ("Imagen 0.5");
subplot(2,3,4);
imhist(R);
title ("Histograma 0.5");
D = fspecial("disk", 50);
D= D + 0.3;
subplot(2,3,2);
imshow(D);
title ("Imagen 0.3");
subplot(2,3,5);
imhist(D);
title ("Histograma 0.3");
M = fspecial("disk", 50);
M= M + 0.9;
subplot(2,3,3);
imshow(M);
title ("Imagen 0.9");
subplot(2,3,6);
imhist(M);
title ("Histograma 0.9");

%% Circulo EJERCICIO 4 
circulo = imread('Circulos.jpg');
figure (4)
subplot(2,1,1);
imshow(circulo);
title ("Imagen original");
subplot(2,1,2);
imhist(circulo);
title ("Histograma de imagen original");

figure (5)   %%EJERCICIO 5 
Gauss = imgaussfilt(circulo,20);
subplot(2,2,1);
imshow(Gauss);
title ("Sigma 20");
subplot(2,2,2);
imhist(Gauss);
title ("Histograma de la imagen");

%% ECUALIZACION   EJERCICIO 6
i1 = histeq (imagen);
i2 = histeq (gris);
i5 = histeq (Gauss);

%Imagen 1
figure(1)
subplot(2,2,3);
imshow(i1);
title ("Imagen ecualizada");
subplot(2,2,4);
imhist(i1);
title ("Histograma ecualizado");

%Imagen 2
figure(2)
subplot(2,2,3);
imshow(i2);
title ("Imagen ecualizada");
subplot(2,2,4);
imhist(i2);
title ("Histograma ecualizado");

%Imagen 5
figure(5)
subplot(2,2,3);
imshow(i5);
title ("Imagen ecualizada");
subplot(2,2,4);
imhist(i5);
title ("Histograma ecualizado");

%% Entropias 
Egris =  entropy(gris)
ER = entropy(R)
Ecirculo = entropy(circulo)
Egauss= entropy(Gauss)
Ei1= entropy(i1)
Ei2= entropy(i2)
Ei5= entropy(i5)
