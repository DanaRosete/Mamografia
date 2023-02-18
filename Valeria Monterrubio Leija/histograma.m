clear all; 
close all; 
clc;
%% 1
imagen = imread('Actividad_histogramas.jpeg'); 
figure (1)
subplot(2,2,1)
imshow(imagen); 
subplot(2,2,2)
imhist(imagen)

%% 2
figure (2)
gris = rgb2gray(imagen); 
subplot(2,2,1)
imshow(gris)
subplot(2,2,2)
imhist(gris)

%% 3
figure(3)
R = fspecial('disk', 50); 
R = R + 0.1;
subplot(2,3,1)
imshow(R)
title('x = 0.1')

R2 = R + 0.98;
subplot(2,3,2)
imshow(R2)
title('x = 0.98')

R3 = R + 0.5;
subplot(2,3,3)
imshow(R3)
title('x = 0.5')

subplot(2,3,4)
imhist(R)

subplot(2,3,5)
imhist(R2)

subplot(2,3,6)
imhist(R3)

%% 4
circulos = imread('Circulos.jpg');
figure(4)
subplot(2,1,1)
imshow(circulos)
subplot(2,1,2)
imhist(circulos)

%% 5
figure(5)
imagengauss = imgaussfilt(circulos, 20);
subplot(2,2,1)
imshow(imagengauss)
title('Filtro Gauss con sigma 20')
subplot(2,2,2)
imhist(imagengauss)

%% 6
imageneq = histeq(imagen); 
griseq = histeq(gris); 
imagengausseq = histeq(imagengauss); 

figure(1)
subplot(2,2,3)
imshow(imageneq);
title('Imagen ecualizada')
subplot(2,2,4)
imhist(imageneq); 

figure(2)
subplot(2,2,3)
imshow(griseq);
title('Imagen ecualizada')
subplot(2,2,4)
imhist(griseq);

figure(5)
subplot(2,2,3)
imshow(imagengausseq);
title('Imagen ecualizada')
subplot(2,2,4)
imhist(imagengausseq);


%% 7

gris_ent = entropy(gris) 
R_ent = entropy(R)
circulos_ent = entropy(circulos)
imagengauss_ent = entropy(imagengauss)
imagen_eq_ent = entropy(imageneq) 
gris_eq_ent = entropy(griseq)
imagengauss_eq_ent = entropy(imagengausseq)


