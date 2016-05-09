classdef evarobotCommunicator < handle
    %	evarobotCommunicator - Class for communicating with evarobot
    %   evabot = evarobotCommunicator() creates an object that allows for easy
    %   control and interaction with the evarobot platform. The
    %   constructor takes no arguments and subscribes to additional topics
    %   when the 'enable' functions are used
    %
    %   evarobotCommunicator methods:
    %       enableSonar        - Enable sonar sensors subscriber
    %       disableSonar       - Disable sonar sensors subscriber
    %       enableIR           - Enable IR sensors subscriber
    %       disableIR          - Disable IR sensors subscriber
    %       enableBumper       - Enable Bumper sensors subscriber
    %       disableBumper      - Disable Bumper sensors subscriber
    %       enableIMU          - Enable IMU sensor subscriber
    %       disableIMU         - Disable IMU sensor subscriber
    %       enableOdom         - Enable odometry subscriber
    %       disableOdom        - Disable odometry subscriber
    %       enableLaser        - Enable laser sensor subscriber
    %       disableLaser       - Disable laser sensor subscriber
    %       enableLidar        - Enable lidar sensor subscriber
    %       disableLidar       - Disable lidar sensor subscriber
	%		enableCameraDepthImage	- Enable camera depth image subscriber
	%		disableCameraDepthImage	- Disable camera depth image subscriber
	%		enableCameraDepthPoints	- Enable camera depth points subscriber
	%		disableCameraDepthPoints- Disable camera depth points subscriber
	%		enableCameraIrImage		- Enable camera ir image subscriber
	%		disableCameraIrImage	- Disable camera ir image subscriber
	%		enableCameraRgbImageRaw - Enable camera rgb image subscriber
	%		disableCameraRgbImageRaw- Disable camera rgb image subscriber
    %       setVelocity        - Set and publish velocity commands to evarobot
    %       
    %
    %   evarobotCommunicator properties:
    %       SonarData          - Data from sonar sensors
    %       IRData             - Data from IR sensors
    %       BumperData         - Data from Bumper sensors
    %       IMUData            - Data from IMU sensor
    %       OdomData           - Data from Encoder sensors
    %       OdomPose           - Pose from Encoder sensors
    %       LaserData          - Data from laser sensor, occupied points
    %       LidarData          - Data from lidar sensor, occupied points
    %       CameraDepthImageData    - Depth image data from camera (Kinect, Asus xtion pro) 
    %       CameraDepthPointsData   - Depth points data from camera (Kinect, Asus xtion pro)
    %       CameraIrImageData       - Ir image data from camera (Kinect, Asus xtion pro)
    %       CameraRgbImageRawData   - Rgb image raw data from camera (Kinect, Asus xtion pro)
    %
    %
    %   Copyright ˜novasyon Muhendislik Ltd. žti.
    
    properties (Access = public)
        SonarData0 = [];                % Range data from sonar sensor
        SonarData1 = [];                % Range data from sonar sensor
        SonarData2 = [];                % Range data from sonar sensor
        SonarData3 = [];                % Range data from sonar sensor
        SonarData4 = [];                % Range data from sonar sensor
        SonarData5 = [];                % Range data from sonar sensor
        SonarData6 = [];                % Range data from sonar sensor
        IRData0 = [];                   % Range data from IR sensor
        IRData1 = [];                   % Range data from IR sensor
        IRData2 = [];                   % Range data from IR sensor
        IRData3 = [];                   % Range data from IR sensor
        IRData4 = [];                   % Range data from IR sensor
        IRData5 = [];                   % Range data from IR sensor
        IRData6 = [];                   % Range data from IR sensor
        IRData7 = [];                   % Range data from IR sensor
        BumperData0 = [];               % Bumper data from bumper sensor
        BumperData1 = [];               % Bumper data from bumper sensor
        BumperData2 = [];               % Bumper data from bumper sensor
        IMUData = [];                   % IMU data from IMU sensor 
        OdomData = [];                  % Odom data from Encoder sensor 
        OdomPose = [];                  % Odom pose data from Odometry 
        LaserData = [];                 % Laser data from laser scan
        LidarData = [];                 % Lidar laser data from lidar scan
        CameraDepthImageData = [];      % Depth image data from camera (Kinect, Asus xtion pro)
        CameraDepthPointsData = [];     % Depth points data from camera (Kinect, Asus xtion pro)
        CameraIrImageData = [];         % Ir image data from camera (Kinect, Asus xtion pro)
        CameraRgbImageRawData = [];     % Rgb image raw data from camera (Kinect, Asus xtion pro)
    end
    
    properties (Access = protected)
        SonarSub = [];                  % ROS subscriber for Sonar sensors
        IRSub = [];                     % ROS subscriber for IR sensors
        BumperSub = [];                 % ROS subscriber for Bumper sensor
        IMUSub = [];                    % ROS subscriber for IMU sensor
        OdomSub = [];                   % ROS subscriber for Encoder sensor
        LaserSub = [];                  % ROS subscriber for Laser sensor                  
        LidarSub = [];                  % ROS subscriber for Lidar sensor
        CameraDepthImageSub = [];       % ROS subscriber for Camera sensor Depth Image
        CameraDepthPointsSub = [];      % ROS subscriber for Camera sensor DepthPoints
        CameraIrImageSub = [];          % ROS subscriber for Camera sensor IR Image 
        CameraRgbImageRawSub = [];      % ROS subscriber for Camera sensor RgbImageRaw
        VelPub = [];                    % ROS publisher for velocity
        VelMsg = [];                    % ROS message for velocities
    end
    
    methods (Access = public)
        
        function h = evarobotCommunicator()
            %evarobotCommunicator Constructor            
            try
                % Set publishers
                h.VelPub = rospublisher('/cmd_vel');
                % Create messages
                h.VelMsg = rosmessage(rostype.geometry_msgs_Twist);
            catch exception
                display(exception);
            end
        end
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% SONAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function enableSonar(h, topicName)
            %ENABLESONAR - Subscribes to the sonar sensors topic and indicates callback function
            if nargin==1
                topicName = ['/sonar0';'/sonar1';'/sonar2';'/sonar3';'/sonar4';'/sonar5';'/sonar6'];
            end
            
            for i = 1:size(topicName, 1)
                h.SonarSub = [h.SonarSub; rossubscriber(topicName(i,:), 'BufferSize', 5)];
            end
            disp('Successfully Enabled Sonar');
            try
                h.SonarSub(1).NewMessageFcn = @h.sonarCallback0;
                h.SonarSub(2).NewMessageFcn = @h.sonarCallback1;
                h.SonarSub(3).NewMessageFcn = @h.sonarCallback2;
                h.SonarSub(4).NewMessageFcn = @h.sonarCallback3;
                h.SonarSub(5).NewMessageFcn = @h.sonarCallback4;
                h.SonarSub(6).NewMessageFcn = @h.sonarCallback5;
                h.SonarSub(7).NewMessageFcn = @h.sonarCallback6;
            catch exception
            end
        end
        
        function disableSonar(h)
            %DISABLESONAR - Unsubscribes from sonar sensors topic
            
            if isempty(h.SonarSub)
                disp('Sonar not enabled: No action taken');
            else
                h.SonarSub = [];
                disp('Disabled Sonar Sensors Subscriber');
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% SONAR END %%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
        
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% INFRARED %%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function enableIR(h, topicName)
            %ENABLEIR - Subscribes to the IR sensors topic and indicates callback function
            if nargin==1
                topicName = ['/ir0';'/ir1';'/ir2';'/ir3';'/ir4';'/ir5';'/ir6';'/ir7'];
            end
                        
            for i = 1:size(topicName, 1)
                h.IRSub = [h.IRSub; rossubscriber(topicName(i,:), 'BufferSize', 5)];
            end
            disp('Successfully Enabled IR');   
            
            try
                h.IRSub(1).NewMessageFcn = @h.IRCallback0;
                h.IRSub(2).NewMessageFcn = @h.IRCallback1;
                h.IRSub(3).NewMessageFcn = @h.IRCallback2;
                h.IRSub(4).NewMessageFcn = @h.IRCallback3;
                h.IRSub(5).NewMessageFcn = @h.IRCallback4;
                h.IRSub(6).NewMessageFcn = @h.IRCallback5;
                h.IRSub(7).NewMessageFcn = @h.IRCallback6;
                h.IRSub(8).NewMessageFcn = @h.IRCallback7;
            catch exception
            end
        end
        
        function disableIR(h)
            %DISABLEIR - Unsubscribes from IR sensors topic
            
            if isempty(h.IRSub)
                disp('IR not enabled: No action taken');
            else
                h.IRSub = [];
                disp('Disabled IR Sensors Subscriber');
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% INFRARED END %%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% BUMPER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function enableBumper(h, topicName)
            %ENABLEBUMPER - Subscribes to the bumper sensors topic and indicates callback function
            if nargin==1
                topicName = ['/bumper0';'/bumper1';'/bumper2'];
            end
            
            for i = 1:size(topicName, 1)
                h.BumperSub = [h.BumperSub; rossubscriber(topicName(i,:), 'BufferSize', 5)];
            end
            disp('Successfully Enabled Bumper');          
            
            try
                h.BumperSub(1).NewMessageFcn = @h.bumperCallback0;
                h.BumperSub(2).NewMessageFcn = @h.bumperCallback1;
                h.BumperSub(3).NewMessageFcn = @h.bumperCallback2;
            catch exception
            end
        end
        
        function disableBumper(h)
            %DISABLEBUMPER - Unsubscribes from bumper sensors topic
            
            if isempty(h.BumperSub)
                disp('Bumper not enabled: No action taken');
            else
                h.BumperSub = [];
                disp('Disabled Bumper Sensors Subscriber');
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% BUMPER END %%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
        
        
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% IMU %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function enableIMU(h, topicName)
            %ENABLEIMU - Subscribes to the imu sensor topic and indicates callback function
            if nargin==1
                topicName = '/imu';
            end
            
            h.IMUSub = [h.IMUSub; rossubscriber(topicName, 'BufferSize', 5)];
            disp('Successfully Enabled IMU');
            h.IMUSub.NewMessageFcn = @h.imuCallback;
        end
        
        function disableIMU(h)
            %DISABLEIMU - Unsubscribes from imu sensor topic
            
            if isempty(h.IMUSub)
                disp('IMU not enabled: No action taken');
            else
                h.IMUSub = [];
                disp('Disabled IMU Sensors Subscriber');
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% IMU END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
        
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% ENCODER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function enableOdom(h, topicName)
            %ENABLEODOM - Subscribes to the odometry topic and indicates
            if nargin==1
                topicName = '/odom';
            end
            
            h.OdomSub = rossubscriber(topicName, 'BufferSize', 25);
            receive(h.OdomSub,3);
            disp('Successfully Enabled Odometry');
            h.OdomSub.NewMessageFcn = @h.odomCallback;
        end
 
        function disableOdom(h)
            %DISABLEODOM - Unsubscribes from odometry topic
            
            if isempty(h.OdomSub)
                disp('Odometry not enabled: No action taken');
            else
                h.OdomSub = [];
                disp('Disabled Odometry Subscriber');
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% ENCODER END %%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
        

        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% LASER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function enableLaser(h, topicName)
            %ENABLELASER - Subscribes to the laser topic and indicates callback function
            if nargin==1
                topicName = '/laser';
            end
            
            h.LaserSub = rossubscriber(topicName, 'BufferSize', 5);
            scan = receive(h.LaserSub,3);
            h.LaserData = readCartesian(scan);
            disp('Successfully Enabled Laser');
            h.LaserSub.NewMessageFcn = @h.laserCallback;
        end

        function disableLaser(h)
            %DISABLELASER - Unsubscribes from laser scan topic
            
            if isempty(h.LaserSub)
                disp('Laser not enabled: No action taken');
            else
                h.LaserSub = [];
                disp('Disabled Laser Scan Subscriber');
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% LASER END %%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
        
        
        
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% LIDAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function enableLidar(h, topicName)
            %ENABLELIDAR - Subscribes to the lidar topic and indicates callback function
            if nargin==1
                topicName = '/lidar';
            end
            
            h.LidarSub = rossubscriber(topicName, 'BufferSize', 5);
            scan = receive(h.LidarSub,3);
            h.LidarData = readCartesian(scan);
            disp('Successfully Enabled Lidar');
            h.LidarSub.NewMessageFcn = @h.lidarCallback;
        end
        
        function disableLidar(h)
            %DISABLELIDAR - Unsubscribes from lidar topic
            
            if isempty(h.LidarSub)
                disp('Lidar not enabled: No action taken');
            else
                h.LidarSub = [];
                disp('Disabled Lidar Subscriber');
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% LIDAR END %%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
        
        
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% CAMERA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function enableCameraDepthImage(h, topicName)
            %ENABLECAMERADepthImage - Subscribes to the camera depth image topic and indicates callback function
            if nargin==1
                topicName = '/camera/depth/image';
            end
            
            h.CameraDepthImageSub = [h.CameraDepthImageSub; rossubscriber(topicName, 'BufferSize', 5)];
            disp('Successfully Enabled Camera Depth Image');          
            h.CameraDepthImageSub.NewMessageFcn = @h.cameraCallback0;
        end
        
        function disableCameraDepthImage(h)
            %DISABLECAMERADepthImage - Unsubscribes from camera depth image topic
            
            if isempty(h.CameraDepthImageSub)
                disp('Camera Depth Image not enabled: No action taken');
            else
                h.CameraDepthImageSub = [];
                disp('Disabled Camera Depth Image Subscriber');
            end
        end
        
        function enableCameraDepthPoints(h, topicName)
            %ENABLECAMERADepthPoints - Subscribes to the camera depth points topic and indicates callback function
            if nargin==1
                topicName = '/camera/depth/points';
            end
            
            h.CameraDepthPointsSub = [h.CameraDepthPointsSub; rossubscriber(topicName, 'BufferSize', 5)];
            disp('Successfully Enabled Camera Depth Points');          
            h.CameraDepthPointsSub.NewMessageFcn = @h.cameraCallback1;
        end
        
        function disableCameraDepthPoints(h)
            %DISABLECAMERADepthPoints - Unsubscribes from camera depth points topic
            
            if isempty(h.CameraDepthPointsSub)
                disp('Camera Depth Points not enabled: No action taken');
            else
                h.CameraDepthPointsSub = [];
                disp('Disabled Camera Depth Points Subscriber');
            end
        end
        
        function enableCameraIrImage(h, topicName)
            %ENABLECAMERAIrImage - Subscribes to the camera ir image topic and indicates callback function
            if nargin==1
                topicName = '/camera/ir/image';
            end
            
            h.CameraIrImageSub = [h.CameraIrImageSub; rossubscriber(topicName, 'BufferSize', 5)];
            disp('Successfully Enabled Camera Ir Image');          
            h.CameraIrImageSub.NewMessageFcn = @h.cameraCallback2;
        end
        
        function disableCameraIrImage(h)
            %DISABLECAMERAIrImage - Unsubscribes from camera ir image topic
            
            if isempty(h.CameraIrImageSub)
                disp('Camera Ir Image not enabled: No action taken');
            else
                h.CameraIrImageSub = [];
                disp('Disabled Camera Ir Image Subscriber');
            end
        end
        
        function enableCameraRgbImageRaw(h, topicName)
            %ENABLECAMERARgbImageRaw - Subscribes to the camera rgb image raw topic and indicates callback function
            if nargin==1
                topicName = '/camera/rgb/image_raw';
            end
            
            h.CameraRgbImageRawSub = [h.CameraRgbImageRawSub; rossubscriber(topicName, 'BufferSize', 5)];
            disp('Successfully Enabled Camera Rgb Image Raw');          
            h.CameraRgbImageRawSub.NewMessageFcn = @h.cameraCallback3;
        end
        
        function disableCameraRgbImageRaw(h)
            %DISABLECAMERARgbImageRaw - Unsubscribes from camera rgb image raw topic
            
            if isempty(h.CameraRgbImageRawSub)
                disp('Camera Rgb Image Raw not enabled: No action taken');
            else
                h.CameraRgbImageRawSub = [];
                disp('Disabled Camera Rgb Image Raw Subscriber');
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% CAMERA END %%%%%%%%%%%%%%%%%%%%%%%%%%
        
     
        

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% VELOCITY %%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function setVelocity(h, vLin, vAng)
            %SETVELOCITY(h, vLin,vAng) - Set linear and angular velocities for the evarobot
            
            h.VelMsg.Linear.X = vLin;
            h.VelMsg.Angular.Z = vAng;
            send(h.VelPub,h.VelMsg);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%% VELOCITY END %%%%%%%%%%%%%%%%%%%%%%%%
    end
    
     
    
    
    
    methods (Access = protected)
        
        function delete(h)
            %DELETE - Private method to delete the object
            
            % Kill subscribers
            disp('Shutting down evarobot subscribers');
            disableSonar(h);
            disableIR(h);
            disableBumper(h);
            disableIMU(h);
            disableOdom(h);
            disableLaser(h);
            disableLidar(h);
            disableCameraDepthImage(h);
            disableCameraDepthPoints(h);
            disableCameraIrImage(h);
            disableCameraRgbImageRaw(h);
            drawnow;
        end

        function sonarCallback0(h, ~, message)
            %SONARCALLBACK - Collect sonar sensors data and fill it into a 
            %   class variable
            h.SonarData0 = message;
        end
        
        function sonarCallback1(h, ~, message)
            %SONARCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.SonarData1 = message;
        end
        
        function sonarCallback2(h, ~, message)
            %SONARCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.SonarData2 = message;       
        end
        
        function sonarCallback3(h, ~, message)
            %SONARCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.SonarData3 = message;
        end
        
        function sonarCallback4(h, ~, message)
            %SONARCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.SonarData4 = message;
        end
        
        function sonarCallback5(h, ~, message)
            %SONARCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.SonarData5 = message;
        end
        
        function sonarCallback6(h, ~, message)
            %SONARCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.SonarData6 = message;
        end
        
        function IRCallback0(h, ~, message)
            % IRCALLBACK - Collect IR sensors data and fill it into a
            %   class variable
            h.IRData0 = message;
        end
        
        function IRCallback1(h, ~, message)
            % IRCALLBACK - Collect IR sensors data and fill it into a
            %   class variable
            h.IRData1 = message;    
        end
        
        function IRCallback2(h, ~, message)
            % IRCALLBACK - Collect IR sensors data and fill it into a
            %   class variable
            h.IRData2 = message;   
        end
        
        function IRCallback3(h, ~, message)
            % IRCALLBACK - Collect IR sensors data and fill it into a
            %   class variable
            h.IRData3 = message;     
        end
        
        function IRCallback4(h, ~, message)
            % IRCALLBACK - Collect IR sensors data and fill it into a
            %   class variable
            h.IRData4 = message;     
        end
        
        function IRCallback5(h, ~, message)
            % IRCALLBACK - Collect IR sensors data and fill it into a
            %   class variable
            h.IRData5 = message;     
        end
        
        function IRCallback6(h, ~, message)
            % IRCALLBACK - Collect IR sensors data and fill it into a
            %   class variable
            h.IRData6 = message;     
        end
        
        function IRCallback7(h, ~, message)
            % IRCALLBACK - Collect IR sensors data and fill it into a
            %   class variable
            h.IRData7 = message;     
        end
        
        function bumperCallback0(h, ~, message)
            %BUMPERCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.BumperData0 = message;
        end
        
        function bumperCallback1(h, ~, message)
            %BUMPERCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.BumperData1 = message;
        end
        
        function bumperCallback2(h, ~, message)
            %BUMPERCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.BumperData2 = message;
        end
        
        function imuCallback(h, ~, message)
            %IMUCALLBACK - Collect sonar sensors data and fill it into a
            %   class variable
            h.IMUData = message;
        end
        
        function odomCallback(h, ~, message)
            %ODOMCALLBACK - Collect odometry data and fill it into a class
            % variable
          
            h.OdomData = message;
            
            % Extract the x, y, and theta coordinates
            xpos = message.Pose.Pose.Position.X;
            ypos = message.Pose.Pose.Position.Y;
            quat = message.Pose.Pose.Orientation;
            angles = quat2eul([quat.W quat.X quat.Y quat.Z]);
            theta = angles(1);
            h.OdomPose = [xpos, ypos, theta];
        end
        
        function laserCallback(h, ~, message)
            %LASERCALLBACK - Collect laser scan data and fill it into a
            %   class variable
            h.LaserData = message;
        end
        
        
        function lidarCallback(h, ~, message)
            %LIDARCALLBACK - Collect lidar scan data and fill it into a
            %   class variable
            h.LidarData = message;
        end
        
        function cameraCallback0(h, ~, message)
            %IMAGECALLBACK - Retrieve a color image and fill it into a
            % class variable
            
            h.CameraDepthImageData =  readImage(message);
        end
        
        
        function cameraCallback1(h, ~, message)
            %IMAGECALLBACK - Retrieve a color image and fill it into a
            % class variable
            CameraDepthPointsDataDummy = message;
            h.CameraDepthPointsData =  CameraDepthPointsDataDummy;
        end
        
        function cameraCallback2(h, ~, message)
            %IMAGECALLBACK - Retrieve a color image and fill it into a class variable
            
            h.CameraIrImageData =  readImage(message);
        end
        
        function cameraCallback3(h, ~, message)
            %IMAGECALLBACK - Retrieve a color image and fill it into a class variable
            
            h.CameraRgbImageRawData =  readImage(message);
        end
        
    end
    
end
