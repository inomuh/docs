IMU
```
Bu kısımda evarobot üzerinde bulunan minimu9 v3 sensörünün MATLAB'da kullanımı anlatılmaktadır.

IMU Sensörünü Çalıştırma
~~~~~~~~~~~~~~~~~~~~~~~~

Evarobot üzerindeki imu sensörünü çalıştırmadan önce Evarobot'a ssh ile bağlanılır.

::

	# evarobot
	> ssh pi@evarobotDSK
	> sudo -s

IMU sensörünü çalıştırmak için aşağıdaki kodu terminalde çalıştırmak yeterli olacaktır. 
evarobot_minimu9 isimli launch dosyası imu sensörünü çalıştırmaktadır. 
Launch dosyasının aldığı parametreler hakkında bilgi almak için `evarobot_minimu9 <http://wiki.ros.org/evarobot_minimu9>`_ sayfasını kullanabilirsiniz.

::

	# evarobot
	> roslaunch evarobot_minimu9 evarobot_minimu9.launch

IMU Verilerinin Okunması
~~~~~~~~~~~~~~~~~~~~~~~~

::

	% ROS initilization
	rosinit('192.168.3.16')

	% Create an instance of the evarobotCommunicator class, 
	% which allows for easy control of the evarobot
	evarobot = evarobotCommunicator();

	% enable Encoder data
	enableIMU(evarobot);
	%enableIMU(evarobot, '/imu');


	% If you are running all the lines consecutively, 
	% you can pause the script to wait for the subscribers to set up properly.
	pause(5);

	% get subscribed data
	imu = evarobot.IMUData;

	% It is recommended to use rosshutdown once you are done working 
	% with the ROS network. Shut down the global node and disconnect from the evarobot.
	rosshutdown
	
Kod bu `linten <_static/matlab_codes/matlab_imu.m.zip>`_ indirilebilir.
