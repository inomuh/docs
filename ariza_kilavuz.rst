Evarobot Arıza Kılavuzları
``````````````````````````
Kılavuzlar

TTL01 Modem Ayarlarını Tekrardan Yükleme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Tarayıcınızdan 192.168.10.1 ip'sine bağlanın. Kullanıcı adı "admin" şifre "" olacak şekilde modem web arayüzüne giriş yapın.
`Linkten <_static/modem_ayarlari.backup.zip>`_ gerekli modem ayarlarını içeren konfigürasyon dosyasını indirin. 
Dosyayı zipten çıkartın. Modem web arayüzünde solda yer alan Files seçeneğine tıklayın.
Choose File seçeneği ile indirilen konfigürasyon dosyasını seçin ve yükleyin.
Sol menüden New Terminal seçeneğini tıklayın.
Aşağıdaki komutu çalıştırın.

::

		system backup load name=modem_ayarlari 
		
Yeniden başlatma için sorulan soruya "y" olarak giriş yapın ve modemin yeniden başlatılmasını bekleyin.

TTL02 SD Kartı Yeniden Yazma
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Hazırlık ->evarobot kurulumu kısmında sd kartın hazırlanması anlatılmaktadır.


TTL03 Log Alma
~~~~~~~~~~~~~~


Aşağıdaki komut ile log seviyesinin belirlenmesinde kullanılan dosyayı açın.

::

	> nano $ROSCONSOLE_CONFIG_FILE
	
Log levelinin belirlendiği satır aşağıdaki gibi değiştirin.
	
:: 

	log4j.logger.ros=DEBUG
	
Loglanmak istenen paketler roslaunch komutu ile çalıştırın.
Logları içeren klasöre aşağıdaki komut ile ulaşın ve klasör içeriğini listeleyin.
Loglar log isimli klasör içerinde tutulmaktadır.

::

	> cd ~/.ros
	> ls

TTL04 Papuçları Aküye Takma
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL05 Aküleri Şarj Etme
~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL06 Batarya Kartı Giriş/Çıkış Gerililerini Ölçme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL07 IDC Kablolarını Bağlama
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL08 Sonar Kablosunun Bağlanması
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL09 Kızılötesi Kablosunun Bağlanması
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL10 Bumper Kablosunun Bağlanması
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL11 IMU Sensor Kablosunun Bağlanması
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL12 Robotun Üst Katının Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL13 Bataryanın Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL14 Kontrol Panelinin Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL15 Batarya Kartının Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL16 EKB'nin Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL17 Modemin Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL18 Sonarın Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL19 Kızılötesinin Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL20 Bumperın Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL21 IMU'nun Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.

TTL22 Motor Teker Aksamının Sökülmesi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bu kısım hazırlanmaktadır.
