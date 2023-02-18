close all;
clear all; 

%% 1
figure(1)
imagen = imread('rgb.png'); 
imshow(imagen);

%% 2
figure(2)
gris = rgb2gray(imagen); 
imshow(gris);

%% 3
figure(3)
subplot(1,3,1)
gauss1 = imgaussfilt(gris);
imshow(gauss1); 
title('Sigma = 0.5');

subplot(1,3,2)
gauss2 = imgaussfilt(gris,7);
imshow(gauss2);
title('Sigma = 7');

subplot(1,3,3)
gauss3 = imgaussfilt(gris,10);
imshow(gauss3);
title('Sigma = 10');

%% 4
figure(4)
subplot(3,1,1)
wiener = wiener2(gris, [5 5]); 
imshow(wiener); 
title('Neighborhood [5 5]')

subplot(3,1,2)
wiener4 = wiener2(gris, [10 10]); 
imshow(wiener4); 
title('Neighborhood [10 10]')

subplot(3,1,3)
wiener3 = wiener2(gris, [20 20]); 
imshow(wiener3); 
title('Neighborhood [20 20]')

%% 5
figure(5)
mediano = medfilt2(gris);
montage({mediano,gris})
title('Filtro mediano e imagen original');

%% 6
figure(6) 
subplot(2,3,1)
imshow(gris); 
title('Escala de grises original');

subplot(2,3,2)
rgauss = imnoise(gris, 'gaussian');
imshow(rgauss);
title('Ruido gaussiano'); 

subplot(2,3,3)
rpoisson = imnoise(gris, 'poisson');
imshow(rpoisson);
title('Ruido Poisson');

subplot(2,3,4)
rsyp = imnoise(gris, 'salt & pepper');
imshow(rsyp);
title('Ruido Salt and pepper');

subplot(2,3,5)
rspeckle = imnoise(gris, 'speckle');
imshow(rspeckle);
title('Ruido Speckle');

%% 7
%gauss1 = imgaussfilt(gris)
%wiener = wiener2(gris, [10 10])
%mediano = medfilt2(gris)

%
figure(7)
subplot(1,3,1)
imshow(gris)
title('Imagen original') 

subplot(1,3,2)
imshow(rgauss);
title('Ruido Gaussiano')

subplot(1,3,3)
filtrada1 = wiener2(rgauss, [5 5]);
imshow(filtrada1)
title('Imagen después del filtro')

%
figure(8)
subplot(1,3,1)
imshow(gris)
title('Imagen original') 

subplot(1,3,2)
imshow(rpoisson);
title('Ruido Poisson')

subplot(1,3,3)
filtrada2 = wiener2(rpoisson, [10 10]);
imshow(filtrada2)
title('Imagen después del filtro')

%
figure(9)
subplot(1,3,1)
imshow(gris)
title('Imagen original') 

subplot(1,3,2)
imshow(rsyp);
title('Ruido Sal y pimienta')

subplot(1,3,3)
filtrada3 = medfilt2(rsyp);
imshow(filtrada3)
title('Imagen después del filtro')

%
figure(10)
subplot(1,3,1)
imshow(gris)
title('Imagen original') 

subplot(1,3,2)
imshow(rspeckle);
title('Ruido Speckle')

subplot(1,3,3)
filtrada4 = wiener2(rspeckle, [5 5]);
imshow(filtrada4)
title('Imagen después del filtro')

