T = readtable('~/Downloads/u_data.csv');
u = T.u;

u = reshape(u, 1000, 1000);

timespan = linspace(0,1,1000);

dt = diff(timespan);

domain = [0, 1];
n = 1000;
dim = 1;
BC = 'D';
L = otp.utils.pde.laplacian(n, domain, 1, BC);

y = zeros(n, 1);

ui = @(t) interp1(linspace(0, 1, 1000), u.', t).';
f = @(t, x) L*x + ui(t);

sol = ode15s(f, [0, 1], y, odeset('RelTol',1e-6));

xs = linspace(0, 1, 1000);

%xs = xs(2:end-1);



solanal = (2*(exp(-pi^2) + 2*pi).*sinpi(xs) )./(pi + 4*pi^3);

exactsol =  @(x,t) ... 
(2.0*(exp (-(pi*pi*t)) - cos(pi/2*t) + ...
      2.0*pi*sin(pi/2*t))*sin(pi*x))/(pi + 4.0*pi^3);


%%
f = VideoWriter('heat-pinn-valid.mp4','MPEG-4');
open(f);
for idx=1:length(timespan)

    clf;
    t = timespan(idx);
    plot(xs', deval(sol,t), 'r--');
    hold on;
    plot(xs', exactsol(xs,t), 'b');
    title(['t = ',num2str(t)])
    ylim([0,0.18])
    legend({'Numerical','Exact'})
    drawnow
    frame = getframe(1);
    writeVideo(f,frame);
end
close(f)
%%
errT = [];
i=0;
for t =  linspace(0,1,11)
    errT(end+1) = norm(deval(sol,t) - transpose(exactsol(xs,t)))/ norm(exactsol(xs,t));
    subplot(2,5,i+1)
    plot(xs', deval(sol,t), 'r--');
    hold on;
    plot(xs', exactsol(xs,t), 'b');
    title(['t = ',num2str(t)])
    ylim([0,0.18])
    legend({'Numerical','Exact'})
end