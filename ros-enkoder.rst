Enkoder
```````

Bu kısımda enkoderlerden veri okuma ve odom konum hesabı anlatılmaktadır.

Enkoder Sensörünü Çalıştırma
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Evarobot üzerindeki enkoder sensörleri çalıştırmadan önce Evarobot'a ssh ile bağlanılır.

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

Bilgisayar ile Evarobot'un konuşabilmesi için multimaster_fkie paketinde keşif ve senkronizasyon için kullanılan iki düğümü çalıştırmamız gerekmektedir.

::

	# evarobot
	> roslaunch master_discovery_fkie master_discovery.launch

::

	# evarobot
	> roslaunch master_sync_fkie master_sync.launch


Enkoder Sensörlerini Terminalden Okuma
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bilgisayar tarafında terminalden enkoderlerden gelen veri ile hesaplanan konum ve hız bilgilerini okumak için senkronizasyon düğümlerini çalıştırmak gerekmektedir.

::

	# pc
	> roslaunch master_discovery_fkie master_discovery.launch

::

	# pc
	> roslaunch master_sync_fkie master_sync.launch

Başka bir terminalde rostopic komutu ile hesaplanan robotun bağıl konum ve hız okunabilir.

::

	# pc
	> rostopic echo /odom

Topik hakkında bilgi almak için ise aşağıdaki kod kullanılır.

::

	# pc
	> rostopic info /odom


Enkoder Konum Bilgisini Okumak icin Basit Subscriber Yazma
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Catkin çalışma alanında evarobot_odom_subs adında paket oluşturulur.

::

	> cd ~/catkin_ws/src
	> catkin_create_pkg evarobot_odom_subs nav_msgs rospy roscpp

Oluşturulan paketin içerinde /src klasörü altında odom_listener.cpp isminde c++ dosyası oluşturulur.

::

	> cd ~/catkin_ws/src/evarobot_odom_subs
	> mkdir -p ~/catkin_ws/src/evarobot_odom_subs/src
	> cd src
	> gedit odom_listener.cpp

odom_listener.cpp dosyasının içerisine yazılacak kod aşağıda verilmektedir.

::

	#include "ros/ros.h"
	#include "nav_msgs/Odometry.h"

	/**
	 * Bu örnekte evarobot üzerindeki bağıl konum ve hız ROS sistemi üzerinden okuyan basit bir subscriber yapılmaktadır.
	 */

	/**
	 * Dinlenen topikten veri geldiğinde çalışacak callback fonksiyonudur.
	 * Bu örnekte, görevi gelen mesafe verileri ekrana yazdırmakdır.
	 */
	void chatterCallback(const nav_msgs::Odometry::ConstPtr& msg)
	{
	  ROS_INFO("Seq: [%d]", msg->header.seq);
	  ROS_INFO("Position-> x: [%f], y: [%f], z: [%f]", msg->pose.pose.position.x,msg->pose.pose.position.y, msg->pose.pose.position.z);
	  ROS_INFO("Orientation-> x: [%f], y: [%f], z: [%f], w: [%f]", msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z, msg->pose.pose.orientation.w);
	  ROS_INFO("Vel-> Linear: [%f], Angular: [%f]", msg->twist.twist.linear.x,msg->twist.twist.angular.z);
	}

	int main(int argc, char **argv)
	{
	  /**
	   * ROS ilklendiriliyor.
	   */
	  ros::init(argc, argv, "odom_listener");

	  ros::NodeHandle n;

	  /**
	   * Subscriber tanımlanıyor.
	   * İlk parametre olarak dinlenecek topiğin adı, ardından bufferın büyüklüğü ve callback fonksiyonu tanımlanmaktadır.
	   */
	  ros::Subscriber sub = n.subscribe("odom", 1000, chatterCallback);

	  ros::spin();

	  return 0;
	}
	
Kod bu `linten <_static/cpp_codes/enkoder.cpp>`_ indirilebilir.

Paket derlenirken yazdığımız cpp dosyasını derlemesi için CMakeLists.txt dosyasını aşağıdaki gibi düzenliyoruz.

::

	> cd ..
	> gedit CMakeLists.txt

::

	cmake_minimum_required(VERSION 2.8.3)
	project(evarobot_odom_subs)

	find_package(catkin REQUIRED COMPONENTS
	  nav_msgs
	  roscpp
	  rospy
	)

	catkin_package()

	include_directories(
	  ${catkin_INCLUDE_DIRS}
	)

	add_executable(odom_listener src/odom_listener.cpp)
	add_dependencies(odom_listener nav_msgs_generate_messages_cpp)
	 target_link_libraries(odom_listener
	   ${catkin_LIBRARIES}
	)

Yazdığımız ROS paketini derliyoruz.

::

	> cd ~/catkin_ws/
	> catkin_make

Yazdığımız odom_listener düğümünü aşağıdaki gibi çalıştırıldığında, okunan verilerin ekrana yazılması beklenmektedir.

::

	> rosrun evarobot_odom_subs odom_listener






