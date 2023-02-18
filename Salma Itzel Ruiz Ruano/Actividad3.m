%Autor: Salma Itzel Ruiz Ruano
%Materia: Análisis de sistemas de imagenología
%Actividad: TF_conv_degradacion
%%
clc
clear all

%Punto 1
figure(1)
Fc = fspecial('disk',15);
subplot(2,2,1)
imshow(Fc,[])
title("Figura del filtro circular original")

TF = fft2(Fc);
TFC = fftshift(TF);
subplot(2,2,2)
M = abs(TFC);
imshow(M,[])
title("Figura con la transformada de Fourier en 2D")

[I_row, ~] = size(M);
I_M = M(round(I_row/2),:);
fs = -round(length(I_M)/2-1):round(length(I_M)/2-1);
x = M(16,:);
subplot(2,2,3)
plot(fs, x)
title("Vista transversal de transformada de Fourier en 2D")

subplot(2,2,4)
mesh(M)
title("Gráfico 3D de TF")

%Punto 2
figure(2)
Fg = fspecial('gaussian');
subplot(2,2,1)
imshow(Fg,[])
title("Figura del filtro gaussian original")

TF1 = fft2(Fg);
TFC1 = fftshift(TF1);
subplot(2,2,2)
M1 = abs(TFC1);
imshow(M1,[])
title("Figura con la transformada de Fourier en 2D")

[I_row1, ~] = size(M1);
I_M1 = M1(round(I_row1/2),:);
fs1 = -round(length(I_M1)/2-1):round(length(I_M1)/2-1);
x1 = M1(2,:);
subplot(2,2,3)
plot(fs1, x1)
title("Vista transversal de transformada de Fourier en 2D")

subplot(2,2,4)
mesh(M1)
title("Gráfico 3D de TF")

%Punto 3
figure(3)
chest = imread('Chest.jpg');
C1 = imfilter(chest,Fc,'conv');
C2 = imfilter(chest,Fg,'conv');

subplot(2,2,1)
imshow(chest)
title("Imagen original")

subplot(2,2,2)
imshow(C1)
title("Imagen con convolucion 'disk'")

subplot(2,2,3)
imshow(C2)
title("Imagen con convolucion 'gaussian'")

%Punto 4
chesT = fft2(chest);
[Rows Cols] = size(chesT);

PSF = fft2(Fc, 544, 483);
PSF1 = fft2(Fg, 544, 483);

Mt = abs(PSF);
Mt1 = abs(PSF1);

Mtres = Mt .* Mt1;
MtCent = fftshift(Mtres);
PSFres = ifft2(Mtres);
PSFr = fftshift(PSFres);

figure(4)
subplot(2,2,1)
imshow(PSFr)
title("Imagen original")

subplot(2,2,2)
N = abs(MtCent);
imshow(N,[])
title("Transformada de Fourier del PSF resultante")

y = N(272,:);
[I_row3,~ ] = size(N);

I_M3 = N(round(I_row3/2),:);
FS = (-round((length(I_M3)/2)-1):1:round(length(I_M3)/2)-1);
subplot(2,2,3)
plot(FS, y)
title("Vista transversal de la TF del PSF resultante")
subplot(2,2,4)
mesh(N)
title("Gráfica 3D de TF del PSF resultante")
