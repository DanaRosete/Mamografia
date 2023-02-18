%Autor: Salma Itzel Ruiz Ruano
%Materia: Análisis de sistemas de imagenología
%Actividad: Histogramas 
%%
clc; 
clear all; 

%Punto 1
I = imread('imagen1.jpeg');
figure (1)
subplot(2,2,1);
imshow(I);
title ("Imagen original");
subplot(2,2,2);
imhist(I);
title ("Histograma de imagen original");

%Punto 2
rgb = rgb2gray(I);
figure (2)
subplot(2,2,1);
imshow(rgb);
title ("Imagen en escala de grises");
subplot(2,2,2);
imhist(rgb);
title ("Histograma de imagen en escala de grises");

%Punto 3
D = fspecial("disk", 50);
D = D + 0.5;
figure (3)
subplot(2,3,1);
imshow(D);
title ("Imagen 0.5");
subplot(2,3,4);
imhist(D);
title ("Histograma 0.5");
D = fspecial("disk", 50);
D= D + 0.3;
subplot(2,3,2);
imshow(D);
title ("Imagen 0.3");
subplot(2,3,5);
imhist(D);
title ("Histograma 0.3");
D2 = fspecial("disk", 50);
D2= D2 + 0.9;
subplot(2,3,3);
imshow(D2);
title ("Imagen 0.9");
subplot(2,3,6);
imhist(D2);
title ("Histograma 0.9");

%Punto 4 
C1 = imread('Circulos.jpg');
figure (4)
subplot(2,1,1);
imshow(C1);
title ("Imagen original");
subplot(2,1,2);
imhist(C1);
title ("Histograma de imagen original");

%Punto 5
figure (5)   
Gauss = imgaussfilt(C1,20);
subplot(2,2,1);
imshow(Gauss);
title ("Sigma 20");
subplot(2,2,2);
imhist(Gauss);
title ("Histograma de la imagen");

%Punto 6
h1 = histeq (I);
h2 = histeq (rgb);
h3 = histeq (Gauss);

%Imagen 1
figure(1)
subplot(2,2,3);
imshow(h1);
title ("Imagen ecualizada");
subplot(2,2,4);
imhist(h1);
title ("Histograma ecualizado");

%Imagen 2
figure(2)
subplot(2,2,3);
imshow(h2);
title ("Imagen ecualizada");
subplot(2,2,4);
imhist(h2);
title ("Histograma ecualizado");

%Imagen 5
figure(5)
subplot(2,2,3);
imshow(h3);
title ("Imagen ecualizada");
subplot(2,2,4);
imhist(h3);
title ("Histograma ecualizado");

%Punto 7 
Egris =  entropy(rgb)
ER = entropy(D)
Ecirculo = entropy(C1)
Egauss= entropy(Gauss)
Ei1= entropy(h1)
Ei2= entropy(h2)
Ei5= entropy(h3)