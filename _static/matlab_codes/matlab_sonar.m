% ROS initilization
rosinit('192.168.3.16')

% Create an instance of the evarobotCommunicator class, 
% which allows for easy control of the evarobot
evarobot = evarobotCommunicator();

% enable Sonar data
enableSonar(evarobot);
%enableSonar(evarobot, ['/sonar0'; '/sonar1'; '/sonar2'; '/sonar3']);

% you can pause the script to wait for the subscribers to set up properly.
pause(5);

% get subscribed data
sonar0 = evarobot.SonarData0;
sonar1 = evarobot.SonarData1;
sonar2 = evarobot.SonarData2;
sonar3 = evarobot.SonarData3;
sonar4 = evarobot.SonarData4;
sonar5 = evarobot.SonarData5;
sonar6 = evarobot.SonarData6;

% It is recommended to use rosshutdown once you are done working 
% with the ROS network. Shut down the global node and disconnect from the evarobot.
rosshutdown
