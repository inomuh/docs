Enkoder
```````
Bu kısımda enkoderlerden MATLAB'da veri okuma anlatılmaktadır.

Enkoder Sensörünü Çalıştırma
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

evarobot üzerindeki enkoder sensörleri çalıştırmadan önce evarobot'a ssh ile bağlanılır.

::

	# evarobot
	> ssh pi@evarobotDSK
	> sudo -s

Enkoder sensörleri çalıştırmak için aşağıdaki kodu terminalde çalıştırmak yeterli olacaktır. 
evarobot_odometry isimli launch dosyası enkoder sensörlerini çalıştırmakta ve robotun bağıl konumu ve hızını hesaplamaktadır. 
Launch dosyasının aldığı parametreler hakkında bilgi almak için `evarobot_odometry <http://wiki.ros.org/evarobot_odometry>`_ sayfasını kullanabilirsiniz.

::

	# evarobot
	> roslaunch evarobot_odometry evarobot_odometry.launch
	
Enkoder Verilerini Okuma
~~~~~~~~~~~~~~~~~~~~~~~~

::

	% ROS initilization
	rosinit('192.168.3.16')

	% Create an instance of the evarobotCommunicator class, 
	% which allows for easy control of the evarobot
	evarobot = evarobotCommunicator();

	% enable Encoder data
	enableOdom(evarobot);
	%enableOdom(evarobot, '/odom');

	% If you are running all the lines consecutively, 
	% you can pause the script to wait for the subscribers to set up properly.
	pause(5);

	% get subscribed data
	odom_data = evarobot.OdomData;
	odom_pose = evarobot.OdomPose;

	% It is recommended to use rosshutdown once you are done working 
	% with the ROS network. Shut down the global node and disconnect from the evarobot.
	rosshutdown

Kod bu `linten <_static/matlab_codes/matlab_enkoder.m.zip>`_ indirilebilir.
