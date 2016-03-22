Lidar
`````

Bu kısımda evarobot üzerindeki RPLidar sensörünün MATLAB'da  nasıl kullanılacağı anlatılmaktadır.

RPLidar Sensörünü Çalıştırma
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Evarobot üzerindeki lidar sensör hakkında daha detaylı bilgi için `rplidar <http://wiki.ros.org/rplidar>`_ ros paketi incelenebilir. 
Ders kapsamında Türkçe kaynak oluşturması adına yüklemek ve çalıştırmak için yapılması gerekenlerden kısaca bahsedilecektir.

Paketin kaynak kodu indirilir ve derlenir.

::

	> cd ~/catkin_ws/src
	> git clone https://github.com/robopeak/rplidar_ros.git -b slam
	> cd ~/catkin_ws
	> catkin_make

Rplidar'ı çalıştırmak için usb sürücüsüne izin vermek gerekmektedir.

::

	> sudo chmod 777 /dev/ttyUSB0

Sadece rplidar'ı çalıştırmak için,

::

	> roslaunch rplidar_ros rplidar.launch
	

RPLidar Verilerini Okuma
~~~~~~~~~~~~~~~~~~~~~~~~

::

	% ROS initilization
	rosinit('192.168.3.16')

	% Create an instance of the evarobotCommunicator class, 
	% which allows for easy control of the evarobot
	evarobot = evarobotCommunicator();

	% enable Lidar data
	enableLidar(evarobot);
	%enableLidar(evarobot, '/lidar');

	% If you are running all the lines consecutively, 
	% you can pause the script to wait for the subscribers to set up properly.
	pause(5);

	% get subscribed data
	lidar = evarobot.LidarData;

	% plot lidar data
	lidar.plot

	% It is recommended to use rosshutdown once you are done working 
	% with the ROS network. Shut down the global node and disconnect from the evarobot.
	rosshutdown

Kod bu `linten <_static/matlab_codes/matlab_lidar.m.zip>`_ indirilebilir.
