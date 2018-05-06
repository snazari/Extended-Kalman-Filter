%% Sam Nazari 
% Demo of an EKF

Ts      = 1/100;

N       = 4000;

TFinal  = Ts*N;
muWx    = 0;
muWy    = 0;

wx = 0; % Normal RNG Seed x
wy = 0; % Normal RNG Seed y

% sigWx   = 2e-6;
% sigWy   = 1e-9;

sigWx   = 1e-7;
sigWy   = 1e-7;

sigR    = 1e-1;
sigB    = 1e-1;

cx      = 2;
cy      = 2;

Z = 2;
% Initial Conditions
% V0 = [-0.25;0.25];
V0 = [-0.25;0.25];
P0 = [1;1];
M0 = 0*rand(1,1)*eye(4);
X0 = 0*rand(4,1)+[P0;V0];
C0 = [cx;cy];

% Observation Parameters
% pdR = makedist('Lognormal');
% pdR.sigma = sigR;

% pdB = makedist('Normal');
% pdBT= truncate(pdB,-Z,Z);
% pdBT.sigma = sigB;

%% Run Sim
sim('EKFSim')

% Plot
set(0,'defaulttextinterpreter','latex')
plot(P(:,1),P(:,2),'-'),hold on,plot(pxhat,pyhat,'--k'),
scatter(cx,cy,250,'fill'),
title('\textbf{Trajectory Around C}'),
legend('True','Estimated'),xlabel('\textbf{px}'),ylabel('\textbf{py}')
figure,
plot(Rnhat(:,1),Rnhat(:,2),'.-'),hold on,
plot(Rnhat(:,1),Rnhat(:,3),'--r'),
plot(Rnhat(:,1),Rhat,'--k','linewidth',2),
legend('True','Observed','Estimated'),
title('\textbf{Range}'),xlabel('\textbf{Time (sec)}'),
ylabel('\textbf{Range}')
figure,
plot(Bnhat(:,1),Bnhat(:,2)*(180/pi),'.-'),hold on,
plot(Bnhat(:,1),Bnhat(:,3)*(180/pi),'--r'),
plot(Bnhat(:,1),Azhat*(180/pi),'--k','linewidth',2),
legend('True','Observed','Estimated'),
title('\textbf{Azimuth}'),xlabel('\textbf{Time (sec)}'),
ylabel('\textbf{Azimuth Angle}')

