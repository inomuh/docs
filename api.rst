API Gözden Geçirme
==================
Bu kısımda robottan sensör verilerinin alınması ve robota açısal, doğrusal hızların uygulanması anlatılmaktadır.
Bu işlemler sırasında kullanılan mesaj tiplerinden bahsedilmektedir.

* **Motor**

Motorlara verilecek hızlar için /cmd_vel topiğine `geometry_msgs/Twist <http://docs.ros.org/api/geometry_msgs/html/msg/Twist.html>`_ mesaj tipinde veri gönderilir.
Bu mesaj tipinde sadece linear.x ve angular.z değerleri kullanılmaktadır. Uygulanmak istenene doğrusal hız için linear.x, açısal hız için angular.z değeri ayarlanır.


* **Sonar**

Sonarlardan veri okumak için /sonar0 topiğine abone olunur. Bu topik `sensor_msgs/Range <http://docs.ros.org/api/sensor_msgs/html/msg/Range.html>`_ tipinde mesaj basmaktadır.
Alınan mesaj içerisinden range değeri sonarın okuduğu mesafe bilgisini tutmaktadır.


* **Kızılötesi**

Kızılötesi sensörlerden veri okumak için /ir0 topiğine abone olunur. Bu topik `sensor_msgs/Range <http://docs.ros.org/api/sensor_msgs/html/msg/Range.html>`_ tipinde mesaj basmaktadır.
Alınan mesaj içerisinden range değeri sensörün okuduğu mesafe bilgisini tutmaktadır.


* **Bumper**

Bumper sensörlerden veri okumak için /bumper0 topiğine abone olunur. Bu topik `std_msgs/Bool <http://docs.ros.org/api/std_msgs/html/msg/Bool.html>`_ tipinde mesaj basmaktadır.
Alınan mesaj içerisinden data değeri sensörün okuduğu değeri tutmaktadır.


* **IMU**

IMU sensöründen veri okumak için /imu topiğine abone olunur. Bu topik `sensor_msgs/Imu <http://docs.ros.org/api/sensor_msgs/html/msg/Imu.html>`_ tipinde mesaj basmaktadır.


* **Enkoder**

Enkoder sensöründen veri okumak için /odom topiğine abone olunur. Bu topik `nav_msgs/Odometry <http://docs.ros.org/api/nav_msgs/html/msg/Odometry.html>`_ tipinde mesaj basmaktadır.



* **Lidar**

Lidar sensöründen veri okumak için /lidar topiğine abone olunur. Bu topik `sensor_msgs/LaserScan <http://docs.ros.org/api/sensor_msgs/html/msg/LaserScan.html>`_ tipinde mesaj basmaktadır.



* **Lazer**

Lazer sensöründen veri okumak için /laser topiğine abone olunur. Bu topik `sensor_msgs/LaserScan <http://docs.ros.org/api/sensor_msgs/html/msg/LaserScan.html>`_ tipinde mesaj basmaktadır.



* **Kinect ya da Asus xtion pro**

Kinect ya da Asus xtion pro sensöründen veri okumak için;

 - /camera/depth/image topiğine abone olunur. Bu topic `/sensor_msgs/Image <http://docs.ros.org/api/sensor_msgs/html/msg/Image.html>`_ tipinde mesaj basmaktadır.
 
 - /camera/depth/points topiğine abone olunur. Bu topic `sensor_msgs/PointCloud2 <http://docs.ros.org/api/sensor_msgs/html/msg/PointCloud2.html>`_ tipinde mesaj basmaktadır.
 
 - /camera/ir/image topiğine abone olunur. Bu topic `/sensor_msgs/Image <http://docs.ros.org/api/sensor_msgs/html/msg/Image.html>`_ tipinde mesaj basmaktadır.
 
 - /camera/rgb/image_raw topiğine abone olunur. Bu topic `/sensor_msgs/Image <http://docs.ros.org/api/sensor_msgs/html/msg/Image.html>`_ tipinde mesaj basmaktadır.


