IMU
```

Bu kısımda evarobot üzerinde bulunan minimu9 v3 sensörünün kullanımı anlatılmaktadır.

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

Bilgisayar ile Evarobot'un konuşabilmesi için multimaster_fkie paketinde keşif ve senkronizasyon için kullanılan iki düğümü çalıştırmamız gerekmektedir.

::

	# evarobot
	> roslaunch master_discovery_fkie master_discovery.launch


::

	# evarobot
	> roslaunch master_sync_fkie master_sync.launch


IMU Sensörünü Terminalden Okuma
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bilgisayar tarafında terminalden imu sensörünü okumak için senkronizasyon düğümlerini çalıştırmak gerekmektedir.

::

	# pc
	> roslaunch master_discovery_fkie master_discovery.launch

::

	# pc
	> roslaunch master_sync_fkie master_sync.launch

Başka bir terminalde rostopic komutu ile imu verisi okunabilir.

::

	# pc
	> rostopic echo /imu_data

Topik hakkında bilgi almak için ise aşağıdaki kod kullanılır.


::

	# pc
	> rostopic info /imu_data
	
	

IMU Sensör icin Basit Subscriber Yazma
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Catkin çalışma alanında evarobot_imu_subs adında paket oluşturulur.

::

	> cd ~/catkin_ws/src
	> catkin_create_pkg evarobot_imu_subs sensor_msgs rospy roscpp

Oluşturulan paketin içerinde /src klasörü altında imu_listener.cpp isminde c++ dosyası oluşturulur.

::

	> cd ~/catkin_ws/src/evarobot_imu_subs
	> mkdir -p ~/catkin_ws/src/evarobot_imu_subs/src
	> cd src
	> gedit imu_listener.cpp

imu_listener.cpp dosyasının içerisine yazılacak kod aşağıda verilmektedir.

::

	#include "ros/ros.h"
	#include "sensor_msgs/Imu.h"

	/**
	 * Bu örnekte evarobot üzerindeki imu sensörünü ROS sistemi üzerinden okuyan basit bir subscriber yapılmaktadır.
	 */

	/**
	 * Dinlenen topikten veri geldiğinde çalışacak callback fonksiyonudur.
	 * Bu örnekte, görevi gelen mesafe verileri ekrana yazdırmakdır.
	 */
	void chatterCallback(const sensor_msgs::Imu::ConstPtr& msg)
	{
	  ROS_INFO("Imu Seq: [%d]", msg->header.seq);
	  ROS_INFO("Imu Orientation x: [%f], y: [%f], z: [%f], w: [%f]", msg->orientation.x,msg->orientation.y,msg->orientation.z,msg->orientation.w);
	}

	int main(int argc, char **argv)
	{
	  /**
	   * ROS ilklendiriliyor.
	   */
	  ros::init(argc, argv, "imu_listener");

	  ros::NodeHandle n;

	  /**
	   * Subscriber tanımlanıyor.
	   * İlk parametre olarak dinlenecek topiğin adı, ardından bufferın büyüklüğü ve callback fonksiyonu tanımlanmaktadır.
	   */
	  ros::Subscriber sub = n.subscribe("imu_data", 1000, chatterCallback);

	  ros::spin();

	  return 0;
	}
	
Kod bu `linten <_static/cpp_codes/imu.cpp>`_ indirilebilir.

Paket derlenirken yazdığımız cpp dosyasını derlemesi için CMakeLists.txt dosyasını aşağıdaki gibi düzenliyoruz.

::

	> cd ..
	> gedit CMakeLists.txt

::

	cmake_minimum_required(VERSION 2.8.3)
	project(evarobot_imu_subs)

	find_package(catkin REQUIRED COMPONENTS
	  sensor_msgs
	  roscpp
	  rospy
	)

	catkin_package()

	include_directories(
	  ${catkin_INCLUDE_DIRS}
	)

	add_executable(imu_listener src/imu_listener.cpp)
	add_dependencies(imu_listener sensor_msgs_generate_messages_cpp)
	 target_link_libraries(imu_listener
	   ${catkin_LIBRARIES}
	 )

Yazdığımız ROS paketini derliyoruz.


::

	> cd ~/catkin_ws/
	> catkin_make

Yazdığımız imu_listener düğümünü aşağıdaki gibi çalıştırıldığında, okunan verilerin ekrana yazılması beklenmektedir.

::

	> rosrun evarobot_imu_subs imu_listener
