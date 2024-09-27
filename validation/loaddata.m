T = readtable('u_data.csv');
u = T.u;
n = sqrt(numel(u));
u = reshape(u, n, n);

domain = [0, 1];
dim = 1;
BC = 'D';
L = otp.utils.pde.laplacian(n, domain, 1, BC);

y = zeros(n, 1);

ui = @(t) interp1(linspace(0, 1, n), u.', t, "cubic").';
f = @(t, x) L*x + ui(t);

sol = ode15s(f, [0, 1], y, odeset('RelTol',1e-7, 'Jacobian', L));

xs = linspace(0, 1, n+2);
xs = xs(2:end-1);

clf;
plot(xs, sol.y(:, end));
hold on;

solanal = (2*(exp(-pi^2) + 2*pi).*sinpi(xs) )./(pi + 4*pi^3);
plot(xs, solanal);




% verify that our u is actually smaller
tsamples = linspace(0, 1, 1000);
us = ui(tsamples);
mean(us.^2, 'all')
uanal = @(t, x) sinpi(x) * sinpi(t);
xsamples = linspace(0, 1, 1000).';
mean(uanal(tsamples, xsamples).^2,'all')
