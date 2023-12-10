function drawcartpend(y,m,M,L)

x = y(1); % cart position
th = y(3); % theta angle

% dimensions

W = 1*sqrt(M/5);  % cart width
H = .5*sqrt(M/5); % cart height
wr = .2; % wheel radius
mr = .3*sqrt(m); % mass radius

% positions

y = wr/2+H/2; % cart vertical position
w1x = x-.9*W/2; % wheel 1 x position
w1y = 0; % wheel 1 y position
w2x = x+.9*W/2-wr; % wheel 2 x position
w2y = 0; % wheel 2 y position

px = x + L*sin(th); % pendulum bob x position
py = y - L*cos(th); % pendulum bob y position

plot([-10 10],[0 0],'k','LineWidth',2) % ground line
hold on
rectangle('Position',[x-W/2,y-H/2,W,H],'Curvature',.1,'FaceColor',[1 0.1 0.1]) % cart
rectangle('Position',[w1x,w1y,wr,wr],'Curvature',1,'FaceColor',[0 0 0]) % wheel 1
rectangle('Position',[w2x,w2y,wr,wr],'Curvature',1,'FaceColor',[0 0 0]) % wheel 2

plot([x px],[y py],'k','LineWidth',2) % pendulum rod

rectangle('Position',[px-mr/2,py-mr/2,mr,mr],'Curvature',1,'FaceColor',[.1 0.1 1]) % pendulum bob

xlim([-5 5]); % plot limit of x axis
ylim([-2 2.5]); % plot limit of y axis
set(gcf,'Position',[100 550 1000 400]) % set figure position

drawnow
hold off