Matlab Kütüphanesi
==================
Bu kısımda evarobot üzerindeki sensör verilerinin MATLAB'da görüntülenebilmesi ve 
MATLAB'dan evarobot'a veri gönderilmesi için geliştirilen evarobotCommunicator kütüphanesi anlatılmaktadır.

* **Fonksiyonlar**

Bu fonksiyonlar kütüphane sınıfından public olarak erişilebilir durumdadır. Sensörlerden veri okuma ve hız gönderme işlemlerini gerçekleştirir.

 - enableSonar        - Sonar sensörlerine abone olur
 - disableSonar       - Sonar sensörlerinden aboneliği kaldırır
 - enableIR           - Kızılötesi sensörlerine abone olur
 - disableIR          - Kızılötesi sensörlerinden aboneliği kaldırır
 - enableBumper       - Bumper sensörlerine abone olur
 - disableBumper      - Bumper sensörlerinden aboneliği kaldırır
 - enableIMU          - IMU sensörüne abone olur
 - disableIMU         - IMU sensöründne aboneliği kaldırır
 - enableOdom         - Enkoder sensörüne abone olur
 - disableOdom        - Enkoder sensöründen aboneliği kaldırır
 - enableLaser        - Lazer sensörüne abone olur
 - disableLaser       - Lazer sensöründen aboneliği kaldırır
 - enableLidar        - Lidar sensörüne abone olur
 - disableLidar       - Lidar sensöründen aboneliği kaldırır
 - enableCamera       - Kamera (Kinect ya da Asus xtion pro) sensörüne abone olur
 - disableCamera      - Kamera sensöründen aboneliği kaldırır
 - setVelocity        - Paraemtre olarak girilen açısal ve doğrusal hız değerlerini robota uygular
 

* **Değerler**

Bu değerler kütüphane sınıfından public olarak erişilebilir durumda olan sensörlerden okunan verileri tutan değişkenlerdir.

 - SonarData0                % Sonar0'dan okunan değer
 - SonarData1                % Sonar1'den okunan değer
 - SonarData2                % Sonar2'den okunan0 değer
 - SonarData3                % Sonar3'ten okunan değer
 - SonarData4                % Sonar4'ten okunan değer
 - SonarData5                % Sonar5'ten okunan değer
 - SonarData6                % Sonar6'dan okunan değer
 - IRData0                   % Kızılötesi0'dan okunan değer
 - IRData1                   % Kızılötesi1'den okunan değer
 - IRData2                   % Kızılötesi2'den okunan değer
 - IRData3                   % Kızılötesi3'ten okunan değer
 - IRData4                   % Kızılötesi4'ten okunan değer
 - IRData5                   % Kızılötesi5'ten okunan değer
 - IRData6                   % Kızılötesi6'dan okunan değer
 - IRData7                   % Kızılötesi7'den okunan değer
 - BumperData0               % Bumper0'dan okunan değer
 - BumperData1               % Bumper1'den okunan değer
 - BumperData2               % Bumper2'den okunan değer
 - IMUData                   % IMU'dan okunan değer 
 - OdomData                  % Enkoder'den okunan değer 
 - OdomPose                  % Enkoder'den okunan değer kullanılarak hesaplanan konum
 - LaserData                 % Lazer'den okunan değer
 - LidarData                 % Lidar'dan okunan değer
 - CameraDepthImageData      % Kameradan (Kinect, Asus xtion pro) okunan derinlik resim verisi 
 - CameraDepthPointsData     % Kameradan okunan derinlik noktaları verisi
 - CameraIrImageData         % Kameradan okunan kızılötesi resim verisi
 - CameraRgbImageRawData     % Kameradan okunan renkli ham veri


* **Kullanım**

::

	% ip adresi girilerek robota bağlanılıyor
	rosinit('192.168.3.16')

	% robottan sensör verilerini almak ve hız verilerini göndermek için kullanılabilen sınıftan nesne oluşturuluyor.
	evarobot = evarobotCommunicator();

	% sonar, kızılötesi, bumper, imu, enkoder, lazer, lidar, kinect ya da asus xtion pro sensörlerine varsayılan topik isimleri ya da istenilen topik isimleri ile abone olunuyor.
	%enableSonar(evarobot);
	%enableSonar(evarobot, ['/sonar0'; '/sonar1'; '/sonar2'; '/sonar3']);
	%enableIR(evarobot);
	%enableIR(evarobot, ['/ir0'; '/ir1']);
	%enableBumper(evarobot);
	%enableBumper(evarobot, ['/bumper0'; '/bumper1']);
	%enableIMU(evarobot);
	%enableIMU(evarobot, '/imu');
	%enableOdom(evarobot);
	%enableOdom(evarobot, '/odom');
	%enableLaser(evarobot);
	%enableLaser(evarobot, '/laser');
	%enableLidar(evarobot);
	%enableLidar(evarobot, '/lidar');
	%enableCameraDepthImage(evarobot);
	%enableCameraDepthImage(evarobot, '/camera/depth/image');
	%enableCameraDepthPoints(evarobot);
	%enableCameraDepthPoints(evarobot, '/camera/depth/points');
	%enableCameraIrImage(evarobot);
	%enableCameraIrImage(evarobot, '/camera/ir/image');
	%enableCameraRgbImageRaw(evarobot);
	%enableCameraRgbImageRaw(evarobot, '/camera/rgb/image_raw');

	% Abone olma işleminin tamamlanması için 5 saniye bekleniyor.
	pause(5);

	% sonar sensörleri, kızılötesi sensörleri, bumper sensörleri, imu sensörü, enkoder, lazer, lidar, kinect ya da asus xtion pro'dan abone olunun topik verileri alınıyor.
	%sonar0 = evarobot.SonarData0;
	%sonar1 = evarobot.SonarData1;
	%sonar2 = evarobot.SonarData2;
	%sonar3 = evarobot.SonarData3;
	%sonar4 = evarobot.SonarData4;
	%sonar5 = evarobot.SonarData5;
	%sonar6 = evarobot.SonarData6;
	%ir0 = evarobot.IRData0;
	%ir1 = evarobot.IRData1;
	%ir2 = evarobot.IRData2;
	%ir3 = evarobot.IRData3;
	%ir4 = evarobot.IRData4;
	%ir5 = evarobot.IRData5;
	%ir6 = evarobot.IRData6;
	%ir7 = evarobot.IRData7;
	%bumper0 = evarobot.BumperData0;
	%bumper1 = evarobot.BumperData1;
	%bumper2 = evarobot.BumperData2;
	%imu = evarobot.IMUData;
	%odom_data = evarobot.OdomData;
	%odom_pose = evarobot.OdomPose;
	%laser = evarobot.LaserData;
	%lidar = evarobot.LidarData;
	%lidar.plot
	%camera_depth_image_data = evarobot.CameraDepthImageData;
	%camera_depth_points_data = evarobot.CameraDepthPointsData;
	%camera_ir_image_data = evarobot.CameraIrImageData;
	%camera_rgb_image_raw_data = evarobot.CameraRgbImageRawData;

	% robota uygulanmak istenen doğrusal ve açısal hzılar parametre olarak veriliyor.
	%setVelocity(evarobot, 0, 0);

	% ROS sunucusuyla olan bağlantı kapatılıyor.
	rosshutdown
