%Autor: Salma Itzel Ruiz Ruano
%Materia: Análisis de sistemas de imagenología
%Actividad: Intro Matlab Noise and Filters
%%
%Punto 1
imagen_rgb = imread('imagenRGB.jpeg');
figure(1)
imshow(imagen_rgb)
title("Imagen original")

%Punto 2
I = rgb2gray(imagen_rgb);
figure(2)
imshow(I)
title("Imagen en escala de grises")

%Punto 3
figure(3)

Gauss = imgaussfilt(I); %Gaussian filter normal
subplot(2,2,1)
imshow(Gauss)
title("Sigma normal value")

Gauss1 = imgaussfilt(I,3); %Gaussian filter de 3
subplot(2,2,2)
imshow(Gauss1)
title("Sigma value of 3")

Gauss2 = imgaussfilt(I,10); %Gaussian filter de 10
subplot(2,2,3)
imshow(Gauss2)
title("Sigma value of 10")

%Punto 4
figure(4)
Wiener = wiener2(I, [10 10]);
subplot(2,2,1)
imshow(Wiener)
title("Neighborhood normal size")

Wiener1 = wiener2(I, [50 50]);
subplot(2,2,2)
imshow(Wiener1)
title("Neighborhood size of 50")

Wiener2 = wiener2(I, [100 100]);
subplot(2,2,3)
imshow(Wiener2)
title("Neighborhood size of 100")

%Punto 5
figure(5)
Mediano = medfilt2(I);
montage({I, Mediano})
title("Imagen original y filtro mediano")

%Punto 6
figure(6)

subplot(2,3,1)
imshow(I)
title("Imagen en escala de grises normal")

GN = imnoise(I,"gaussian");
subplot(2,3,2)
imshow(GN)
title("Imagen con ruido 'Gaussian'")

PN = imnoise(I,"poisson");
subplot(2,3,3)
imshow(PN)
title("Imagen con ruido 'Poisson'")

SPN = imnoise(I,"salt & pepper");
subplot(2,3,4)
imshow(SPN)
title("Imagen con ruido 'Salt & pepper'")

SN = imnoise(I, "speckle");
subplot(2,3,5)
imshow(SN)
title("Imagen con ruido 'Speckle'")

%Punto 7
figure(7)
WienerN = wiener2(GN, [5 5]);
subplot(1,3,1)
imshow(I)
title("Imagen en escala de grises normal")

subplot(1,3,2)
imshow(GN)
title("Imagen con ruido 'Gaussian'")

subplot(1,3,3)
imshow(WienerN)
title("Imagen filtrada")

figure(8) 
WienerN1 = wiener2(PN, [10 10]);
subplot(1,3,1)
imshow(I)
title("Imagen en escala de grises normal")

subplot(1,3,2)
imshow(PN)
title("Imagen con ruido 'Poisson'")

subplot(1,3,3)
imshow(WienerN1)
title("Imagen filtrada")

figure(9) 
Mediano1 = medfilt2(SPN);
subplot(1,3,1)
imshow(I)
title("Imagen en escala de grises normal")

subplot(1,3,2)
imshow(SPN)
title("Imagen con ruido 'Salt & pepper'")

subplot(1,3,3)
imshow(Mediano1)
title("Imagen filtrada")

figure(10)
WienerN2 = wiener2(SN, [5 5]);
subplot(1,3,1)
imshow(I)
title("Imagen en escala de grises normal")

subplot(1,3,2)
imshow(SN)
title("Imagen con ruido 'Speckle'")

subplot(1,3,3)
imshow(WienerN2)
title("Imagen filtrada")

