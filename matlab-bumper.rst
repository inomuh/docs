Bumper
``````
Bu kısımda evarobot üzerindeki bumper verilerinin MATLAB'da nasıl okunacağı anlatılmaktadır.

Bumper'ı Çalıştırma
~~~~~~~~~~~~~~~~~~~

evarobot içerisindeki sürücüler sayesinde robot üzerindeki bumper sensörleri okunabilmektedir. 
Sensörlerin okuma bilgisi, çarpışma var ya da yok şeklinde bir değere sahiptir. 
evarobot üzerindeki bumper'ı çalıştırmadan önce Evarobot'a ssh ile bağlanılır.

::

	# evarobot
	> ssh pi@evarobotDSK
	> sudo -s

Bumper sensörlerini çalıştırmak için aşağıdaki kodu terminalde çalıştırmak yeterli olacaktır. 
evarobot_bumper isimli launch dosyası bumper sensörleri çalıştırmaktadır. 
Launch dosyasının aldığı parametreler hakkında bilgi almak için `evarobot_bumper <http://wiki.ros.org/evarobot_bumper>`_ sayfasını kullanabilirsiniz.

::

	# evarobot
	> roslaunch evarobot_bumper evarobot_bumper.launch
	
Bumper Verilerini Okuma
~~~~~~~~~~~~~~~~~~~~~~~

::
	
	% ROS initilization
	rosinit('192.168.3.16')

	% Create an instance of the ExampleHelperTurtleBotCommunicator class, 
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

Kod bu `linten <_static/matlab_codes/matlab_bumper.m>`_ indirilebilir.
