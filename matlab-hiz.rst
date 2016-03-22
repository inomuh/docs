Motor Sürme
```````````

Bu kısımda evarobot üzerindeki motorların MATLAB üzerinden kontrolü anlatılmaktadır.

Motorlara Hız Verme
~~~~~~~~~~~~~~~~~~~

::
	
	% ROS initilization
	rosinit('192.168.3.16')

	% Create an instance of the evarobotCommunicator class, 
	% which allows for easy control of the evarobot
	evarobot = evarobotCommunicator();

	% set linear and angular velocities
	setVelocity(evarobot, 0.7, 0.2);

	% It is recommended to use rosshutdown once you are done working 
	% with the ROS network. Shut down the global node and disconnect from the evarobot.
	rosshutdown

Kod bu `linten <_static/matlab_codes/matlab_hiz.m.zip>`_ indirilebilir.
