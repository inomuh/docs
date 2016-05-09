% ROS initilization
rosinit('192.168.3.51');

% Create an instance of the evarobotCommunicator class, 
% which allows for easy control of the evarobot
evarobot = evarobotCommunicator();

% you can pause the script to wait for the connection to set up properly.
pause(5);

% call service with required data
testclient = rossvcclient('/evarobot_competition/CheckObject');
testreq = rosmessage(testclient);
testreq.ObjectPose.X = 2.34;
testreq.ObjectPose.Y = 7.89;
testreq.ObjectPose.Z = 0.12;
testreq.Color = 1;
testresp = call(testclient,testreq,'Timeout',3);

% It is recommended to use rosshutdown once you are done working 
% with the ROS network. Shut down the global node and disconnect from the evarobot.
rosshutdown;
