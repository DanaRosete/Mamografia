clear all; 
close all; 
clc; 

%% 1
figure(1)
subplot(2,2,1)
filt_circ = fspecial('disk', 15); 
imshow(filt_circ, [])
title('Filtro original')

subplot(2,2,2)
TF = fft2(filt_circ);
TF_centered = fftshift(TF); 

M = abs(TF_centered);
imshow(M,[])
title('Transformada de Fourier')

x = M(16,:);
[I_row,~ ] = size(M);
I_M = M(round(I_row/2), : ); 
fs = (-round((length(I_M)/2)-1):1:round(length(I_M)/2)-1);

subplot(2,2,3)
plot(fs,x)
title('Vista transversal FT')

subplot(2,2,4)
mesh(M)
title('Vista 3D FT')

%% 2

figure(2)
subplot(2,2,1)
filt_gauss = fspecial('gaussian'); 
imshow(filt_gauss, [])
title('Filtro original')

subplot(2,2,2)
TF2 = fft2(filt_gauss);
TF_centered2 = fftshift(TF2); 
m = abs(TF_centered2);
imshow(m,[])
title('Transformada de Fourier')

x = m(2,:);
[I_row2,~ ] = size(m);
I_M2 = m(round(I_row2/2), : ); 
fs2 = (-round((length(I_M2)/2)-1):1:round(length(I_M2)/2)-1);

subplot(2,2,3)
plot(fs2,x)
title('Vista transversal FT')

subplot(2,2,4)
mesh(m)
title('Vista 3D FT')

%% 3

figure(3)
chest = imread('Chest.jpg');
conv_FC = imfilter(chest, filt_circ, 'conv');
subplot(2,2,1)
imshow(chest)
title('Imagen original')
subplot(2,2,2)
imshow(conv_FC)
title('Convolución imagen/filtro circular');

conv_FG = imfilter(chest,filt_gauss, 'conv');
subplot(2,2,3)
imshow(conv_FG)
title('Convolución imagen/filtro gaussiano');


%% 4

chest_TF = fft2(chest); 
[Rows Cols] = size(chest_TF)

PSF1 = fft2(filt_circ, 544, 483);
PSF2 = fft2(filt_gauss, 544,483);

MTF1 = abs(PSF1);
MTF2 = abs(PSF2); 

MTFres = MTF1 .* MTF2;
MTF_centered = fftshift(MTFres);
PSFres = ifft2(MTFres); 
PSFr = fftshift(PSFres);


figure(4) 
subplot(2,2,1) 
imshow(PSFr) 
title('Imagen original')

subplot(2,2,2)
N = abs(MTF_centered);
imshow(N,[])
title('Transformada de Fourier')

y = N(272,:);
[I_row3,~ ] = size(N);
I_M3 = N(round(I_row3/2), : ); 
FS = (-round((length(I_M3)/2)-1):1:round(length(I_M3)/2)-1);

subplot(2,2,3)
plot(FS,y)
title('Vista transversal FT')

subplot(2,2,4)
mesh(N)
title('Vista 3D FT')




