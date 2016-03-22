% ROS initilization
rosinit('192.168.3.16')

% Create an instance of the evarobotCommunicator class, 
% which allows for easy control of the evarobot
evarobot = evarobotCommunicator();

% enable IR data
enableIR(evarobot);
%enableIR(evarobot, ['/ir0'; '/ir1']);

% you can pause the script to wait for the subscribers to set up properly.
pause(5);

% get subscribed data
ir0 = evarobot.IRData0;
ir1 = evarobot.IRData1;
ir2 = evarobot.IRData2;
ir3 = evarobot.IRData3;
ir4 = evarobot.IRData4;
ir5 = evarobot.IRData5;
ir6 = evarobot.IRData6;
ir7 = evarobot.IRData7;

% It is recommended to use rosshutdown once you are done working 
% with the ROS network. Shut down the global node and disconnect from the evarobot.
rosshutdown
