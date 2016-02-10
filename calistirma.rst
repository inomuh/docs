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


Evarobot'u Çalıştırma
---------------------
Evarobot'a açma butonuna bastığınızda ortamda evarobot_wifi isimli kablosuz ağ oluşacaktır.
Bilgisayarınız ile bu ağa bağlandıktan kısa süre sonra evarobot açılışını tamamlayarak çalışmaya
tam performans çalışmaya başlayacaktır.

Evarobot Servisi
----------------
Evarobot'un üzerindeki bütün sürücüleri ve ros paketlerini kontrol eden bir servis bulunmaktadır.
Bu servis robota güç verdiğinizde otomatik olarak çalışmaktadır.
Bu servisi kontrol etmek için aşağıdaki komutları kullanabilirsiniz.

Başlatmak için
::

	> sudo service evarobot start

Durdurmak için
::

	> sudo service evarobot status
	
Tekrardan başlatmak için
::

	> sudo service evarobot restart
	
Servisin durumu hakkında bilgi almak için
::

	> sudo service evarobot status


Evarobot Kalibrasyon
--------------------
Evarobot'un kendi yönelimini daha iyi hesaplaması için IMU sensörün kalibrasyonunu yapmanız gerekmektedir.

Kalibrasyonu başlatmadan önce evarobot servisinin kapalı olduğundan emin olun.
::
> sudo service evarobot status

Eğer servis durumu sorgulandığında çalışıyor ise, servisi durdurmak için,
::
> sudo service evarobot stop

Kalibrasyonu başlattığınızda robot kendi etrafında belirli bir süre dönecektir.
Bu sebepten dolayı robotun bu hareketi düzgün gerçekleştirebileceği ortama koyduğunuzdan emin olun.

Etrafı nesnelerden arındırılmış ve düz bir zemine robotu koyduktan sonra kalibrasyonu çalıştırmak için,
::
> sudo -s
> roslaunch evarobot_start imu_calibration.launch

Ekranda işlemin başarı ile tamamladığını belirten yazı çıktıktan sonra Ctrl+C yaparak işlemi sonlardırabilirsiniz.
