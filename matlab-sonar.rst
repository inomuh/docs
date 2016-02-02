Sonar
`````
Bu kısımda evarobot üzerindeki sonar verilerinin MATLAB'da nasıl kullanılacağı anlatılmaktadır.

Sonar Sensörünü Çalıştırma
~~~~~~~~~~~~~~~~~~~~~~~~~~

Evarobot üzerindeki sonarları çalıştırmadan önce Evarobot'a ssh ile bağlanılır.

::

	# evarobot
	> ssh pi@evarobotDSK
	> sudo -s

Sonar sensörlerini çalıştırmak için aşağıdaki kodu terminalde çalıştırmak yeterli olacaktır. 
evarobot_sonar isimli launch dosyası sonar sensörleri çalıştırmaktadır. 
Launch dosyasının aldığı parametreler hakkında bilgi almak için `evarobot_sonar <http://wiki.ros.org/evarobot_sonar>`_ sayfasını kullanabilirsiniz.

::

	# evarobot
	> roslaunch evarobot_sonar evarobot_sonar.launch

Sonar Verilerini Okuma
~~~~~~~~~~~~~~~~~~~~~~

::

	% ROS initilization
	rosinit('192.168.3.16')

	% Create an instance of the ExampleHelperTurtleBotCommunicator class, 
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

Kod bu `linten <_static/matlab_codes/matlab_sonar.m>`_ indirilebilir.
