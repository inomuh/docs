Uygulamalar: SLAM Harita Oluşturma
==================================
Bu kısımda gmapping ve hector_slam kullanarak SLAM harita oluşturma anlatılmaktadır.

Sistem Tanıtımı
---------------

.. figure:: _static/evarobot_kullanim-03.png
   :align: center
   :figclass: align-centered

hector_slam Kullanarak Harita Çıkarma
-------------------------------------

SLAM yapmamız için gerekli olan düğümleri çalıştıran evarobot_slam.launch dosyasını açalım. 
evarobot_slam.launch dosyası hector_slam'in parametrelerini ayarlarak çalıştırmaktadır.

::

	> roslaunch evarobot_slam evarobot_slam.launch

İyi bir konumlandırma için SLAM yaparken evarobot'u klavye ile sürerek haritanın tamamının kaydedilmesini sağlamamız gerekmektedir. 
Bunun için aşağıdaki kod ile klavye ile kontrol düğümünü açıyoruz.

::

	> rosrun teleop_twist_keyboard teleop_twist_keyboard.py

Tüm ortamın haritasını çıkarma işlemi tamamlandıktan sonra haritayı konumlandırma düğümlerinde kullanmak için kaydetmemiz gerekmektedir. map_saver düğümü ile evarobot_navigation/map klasörü altına kaydediyoruz.

::

	> rosrun map_server map_saver -f $(rospack find evarobot_navigation)/map/map

Böylece ortamın haritasını hector_slam paketini kullanarak çıkarmış olduk.

Örnek uygulamayı videodan takip edebilirsiniz. 

.. raw:: html

	<iframe width="700" height="393" src="https://www.youtube.com/embed/F8yZC05mLHY" frameborder="0" allowfullscreen>
	</iframe>
