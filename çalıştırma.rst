Çalıştırma
==========

Bilgisayarı Çalıştırma
----------------------
Bu kısımda bilgisayardan evarobotunuzu kontrol etmek için yapmanız gerekenler anlatılmaktadır.
evarobot'a güç verildiğinde evarobot_wifi isminde kablosuz ağ oluşmakta ve EKB(Elektronik Kontrol Birimi) açılmaktadır. 
Bilgisayardan evarobot_wifi(Şifre: inomuh2015) ağına girilir ve ssh ile Evarobot'a bağlanılır. 
SSH bağlantısı yapmak için aşağıdaki kod çalıştırılır.

::

	> ssh root@evarobotDSK

evarobot üzerinde ROS kütüphanelerini çalıştırmak için süper kullanıcı olarak giriş yapmak gerekmektedir. 
SSH yaptıktan sonra süper kullanıcı girişi aşağıdaki kod çalıştırılarak yapılır.

::

	> sudo -s

evarobot içerisinde her yeni bir terminal açmak istenildiğinde yukarıdaki iki kod bilgisayar terminalinde çalıştırılmalıdır. 
Bilgisayar tarafında robot ile haberleşmeyi yapabilmek için aşağıdaki iki kod farklı terminalleri açmak yeterli olacaktır.

::

	> roslaunch master_discovery_fkie master_discovery.launch
	
::	
	
	> roslaunch master_sync_fkie master_sync.launch




Evarobot'u Çalıştırma
---------------------
Bu kısımda evarobot'u ayağa kaldırmak için yapılması gerekenler anlatılmaktadır.
Bu derste temel başlangıç olması adına evarobot içerisindeki bütün ROS sensör ve sürücüleri çalıştırmak 
için kullanılan kodun kullanımından bahsedilecektir. Aşağıdaki gibi start.launch dosyası çalıştırıldığında 
önceki tutorial'lar başarı ile tamamlandı ise bilgisayar tarafında sensörlerin okunması ve sürücülerin kontrolü yapılabilmektedir.

::

	> roslaunch evarobot_start start.launch 

Evarobot ROS paketlerinin bireysel olarak daha detaylı incelemesi ilerleyen kısımlarda işlenecektir.
