% ROS initilization
rosinit('192.168.3.16')

% Create an instance of the ExampleHelperTurtleBotCommunicator class, 
% which allows for easy control of the evarobot
evarobot = evarobotCommunicator();

% enable kinect data
enableCameraDepthImage(evarobot);
%enableCameraDepthImage(evarobot, '/camera/depth/image');
enableCameraDepthPoints(evarobot);
%enableCameraDepthPoints(evarobot, '/camera/depth/points');
enableCameraIrImage(evarobot);
%enableCameraIrImage(evarobot, '/camera/ir/image');
enableCameraRgbImageRaw(evarobot);
%enableCameraRgbImageRaw(evarobot, '/camera/rgb/image_raw');

% you can pause the script to wait for the subscribers to set up properly.
pause(5);

% get subscribed data
camera_depth_image_data = evarobot.CameraDepthImageData;
camera_depth_points_data = evarobot.CameraDepthPointsData;
camera_ir_image_data = evarobot.CameraIrImageData;
camera_rgb_image_raw_data = evarobot.CameraRgbImageRawData;

% It is recommended to use rosshutdown once you are done working 
% with the ROS network. Shut down the global node and disconnect from the evarobot.
rosshutdown
