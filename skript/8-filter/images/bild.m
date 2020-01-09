#
# bild.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

img = imread("lena.jpg");
size(img)
w = size(img)(1);
h = size(img)(2);

# Kernel
printf("construct kernel\n");
sigma = 5;
kernel = zeros(w, h);
for x = (1:w)
	for y = (1:h)
		r = (x-w/2)*(x-w/2) + (y-h/2)*(y-h/2);
		kernel(x,y) = exp(-r/(2 * sigma^2));
	end
end

# rotate center to (0,0)
kernel = shift(kernel, w/2, 1);
kernel = shift(kernel, h/2, 2);
imwrite(kernel, "kernel.png");

# construct blurred image
G = fft2(kernel);

blurred   = real(ifft2(G .* fft2(img)));
blurred = 0.5 * (blurred + abs(blurred));

s = 1 / max(max(blurred))
blurred = s * blurred;

imwrite(blurred, "lena-blurred.png");

# add quantization noise
if 1 == 1
	for x = (1:w)
		for y = (1:h)
			blurred(x, y) = round(blurred(x, y) * 256) / 256;
		end
	end
end
imwrite(blurred, "lena-noisy.png");

# wiener kernel
K = 0.01
for i = (1:20)
	printf("K = %.2f\n", K);
	H = conj(G) ./ (abs(G).^2 + K^2);
	deblurred = ifft2(fft2(blurred) .* H);
	deblurred = abs(deblurred);
	s = 1 / max(max(deblurred))
	deblurred = s * deblurred;
	#filename = sprintf("lena-deblurred-%07.2f.png", K);
	filename = sprintf("lena-deblurred-l%03d.png", i);
	imwrite(deblurred, filename);
	K = K * 2;
end



