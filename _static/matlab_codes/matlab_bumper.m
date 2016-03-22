% ROS initilization
rosinit('192.168.3.16')

% Create an instance of the evarobotCommunicator class, 
% which allows for easy control of the evarobot
evarobot = evarobotCommunicator();

% enable bumper data
enableBumper(evarobot);
%enableBumper(evarobot, ['/bumper0'; '/bumper1']);

% you can pause the script to wait for the subscribers to set up properly.
pause(5);

% get subscribed data
bumper0 = evarobot.BumperData0;
bumper1 = evarobot.BumperData1;
bumper2 = evarobot.BumperData2;

% It is recommended to use rosshutdown once you are done working 
% with the ROS network. Shut down the global node and disconnect from the evarobot.
rosshutdown
