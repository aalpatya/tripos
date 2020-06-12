% Script to calculate and contour streamfunction for free stream + source
% at (0,-a) + sink at (0,a).  All distances non-dimensionalised on a.

% Define source/sink strengths via the ratio m/Ua.  Edit this line to see
% the effect of varying m.
monUa = 1.5

nx = 150; Lx = 3;
ny = 100; Ly = 2;

xona = zeros(nx,ny);
yona = zeros(nx,ny);
PsionUa = zeros(nx,ny);

dx = 2*Lx/nx;
dy = 2*Ly/ny;

for ix = 1:nx
  
  x = -Lx + (ix-1)*2*Lx/(nx-1);
  
  for iy = 1:ny
	
	xona(ix,iy) = x;
	y = -Ly + (iy-1)*2*Ly/(ny-1);
	yona(ix,iy) = y;
	
	z = x + 1i*y;
	Fofz = z + (monUa/(2*pi))*(log(z+1i) - log(z-1i));
	PsionUa(ix,iy) = imag(Fofz);
	
  end
  
end

zstag = sqrt(-1 + 1i*monUa/pi);

c = linspace(-Ly,Ly,25);
contour(xona,yona,PsionUa,c)
hold on
plot(real(zstag),imag(zstag),'.',-real(zstag),-imag(zstag),'.')
hold off
xlabel('x/a')
ylabel('y/a')



