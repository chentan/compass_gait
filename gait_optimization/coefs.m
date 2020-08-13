function dist = coefs(c, params,x0, tstart, tfinal);
% 0.3428    0.1714   -8.3984    6.1703 f17_17 75%
% 0.3175    0.1587   -9.8721    7.3103 f17_17 90%
% 0.3005    0.1503   -10.5238   8.0639 f17_17 100%
%           0.1849   -10.3393   7.1757 f17_53 75%
% 0.3576    0.1788  -13.6509    8.5968 f17_53 90%
% 0.5071    0.2535    6.9131    5.8250 f17_86 90%
% 0.4488    0.2244   -0.4263    0.9342 b17_17 75%
% 0.4488    0.2244   -0.4254    0.9322 b17_17 90%
%           0.2244   -0.4246    0.9306 b17_43 100%
% 0.4488    0.2244   -0.4243    0.9305 b17_43 75%
% 0.4487    0.2244   -0.4254    0.9306 b17_76 75%
% 0.4488    0.2244   -0.4238    0.9288 b17_76 large mag
% 0.4487    0.2244   -0.4279    0.9261 b17_98 100%
% 0.4488    0.2244   -0.4295    0.9262 b17_99 100%
% 0.4488    0.2244   -0.4299    0.9308 b17_99 75%

% 0.3214    0.1607  -11.7337    7.3817 f23_16 90%
% 0.3497    0.1749  -14.6920    8.2640 f23_50 90%
% 0.5024    0.2512    5.2668    4.5963 f23_85 90%

target = [0.3214    0.1607  -11.7337    7.3817];    
w1 = 1;
w2 = 1;
w3 = 1;
w4 = 1;

options = odeset('Events','twolink_events','Refine',4,'RelTol',10^-6,'AbsTol',10^-6);
params.a = c;

[t,xout,te,xe,ie] = ode45(@twolink_dynamics,[tstart tfinal],x0,options,params);

xend = xout(length(xout),:)
%dist = sqrt(w2*(xend(2) - target(1))^2 + w3*(xend(3) - target(2))^2 + w4*(xend(4) - target(3))^2);
dist = sqrt(w1*(xend(1) - target(1))^2 + w2*(xend(2) - target(2))^2 + w3*(xend(3) - target(3))^2 + w4*(xend(4) - target(4))^2);
c
dist