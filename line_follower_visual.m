clc;
clear;
close all;

%% ================= TRACK =================
x_track = 1:600;
y_track = 200 + 80*sin(0.01*x_track);

figure('Color','white');

ax = gca;
ax.Color = 'white';
ax.GridColor = [0.8 0.8 0.8];
ax.XColor = 'black';
ax.YColor = 'black';


plot(x_track, y_track, 'k', 'LineWidth', 6);
hold on;
set(gca,'YDir','reverse');
xlim([0 600]);
ylim([0 400]);
title('Robust Curve Following Robot');
grid on;

%% ================= ROBOT INIT =================
x = 50;
y = 150;
theta = 0;
v = 2;

Kp = 0.02;     % steering gain
look_ahead = 20;

robot_plot = plot(x,y,'ro','MarkerFaceColor','r');

x_traj = [];
y_traj = [];
error_log = [];

%% ================= LOOP =================
for i = 1:500
    
    % Find nearest point on curve
    [~, idx] = min((x_track - x).^2 + (y_track - y).^2);
    
    % Look ahead on curve
    idx = min(idx + look_ahead, length(x_track));
    
    target_x = x_track(idx);
    target_y = y_track(idx);
    
    % Desired angle to target
    desired_theta = atan2(target_y - y, target_x - x);
    
    % Heading error
    error = wrapToPi(desired_theta - theta);
    
    % Steering
    theta = theta + Kp * error;
    
    % Move robot
    x = x + v*cos(theta);
    y = y + v*sin(theta);
    
    % Log
    x_traj(end+1) = x;
    y_traj(end+1) = y;
    error_log(end+1) = error;
    
    set(robot_plot,'XData',x,'YData',y);
    drawnow;
end

%% ================= TRAJECTORY =================
figure('Color','white');

ax = gca;
ax.Color = 'white';
ax.GridColor = [0.8 0.8 0.8];
ax.XColor = 'black';
ax.YColor = 'black';

plot(x_track, y_track, 'k', 'LineWidth', 6);
hold on;
plot(x_traj, y_traj, 'b', 'LineWidth', 2);
set(gca,'YDir','reverse');
xlim([0 600]);
ylim([0 400]);
title('Robot Trajectory vs Reference Path');
grid on;

%% ================= ERROR =================
figure('Color','white');

ax = gca;
ax.Color = 'white';
ax.GridColor = [0.8 0.8 0.8];
ax.XColor = 'black';
ax.YColor = 'black';


plot(error_log,'LineWidth',1.5);
title('Heading Error vs Time');
xlabel('Iteration');
ylabel('Heading Error (rad)');
grid off;