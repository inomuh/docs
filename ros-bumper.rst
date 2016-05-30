Bumper
``````

Bu kısımda evarobot üzerindeki bumper sensörlerinin nasıl kullanılacağı anlatılmaktadır.

Bumper'ı Çalıştırma
~~~~~~~~~~~~~~~~~~~

evarobot içerisindeki sürücüler sayesinde robot üzerindeki bumper sensörleri okunabilmektedir. 
Sensörlerin okuma bilgisi, çarpışma var ya da yok şeklinde bir değere sahiptir. 
evarobot üzerindeki bumper'ı çalıştırmadan önce Evarobot'a ssh ile bağlanılır.

::

	# evarobot
	> ssh pi@evarobot
	> sudo -s

Bumper sensörlerini çalıştırmak için aşağıdaki kodu terminalde çalıştırmak yeterli olacaktır. 
evarobot_bumper isimli launch dosyası bumper sensörleri çalıştırmaktadır. 
Launch dosyasının aldığı parametreler hakkında bilgi almak için `evarobot_bumper <http://wiki.ros.org/evarobot_bumper>`_ sayfasını kullanabilirsiniz.

::

	# evarobot
	> roslaunch evarobot_bumper evarobot_bumper.launch

Bilgisayar ile evarobot'un konuşabilmesi için multimaster_fkie paketinde keşif ve senkronizasyon için kullanılan iki düğümü çalıştırmamız gerekmektedir.

::

	# evarobot
	> roslaunch evarobot_start master_discovery.launch

::

	# evarobot
	> roslaunch evarobot_start master_sync.launch


Bumper'ı Terminalden Okuma
~~~~~~~~~~~~~~~~~~~~~~~~~~

Bilgisayar tarafında terminalden bumper sensörlerini okumak için senkronizasyon düğümlerini çalıştırmak gerekmektedir.

::

	# pc
	> roslaunch evapc_start sync.launch 

Başka bir terminalde rostopic komutu ile bumper verisi okunabilir.

::

	# pc
	> rostopic echo /bumper

Topik hakkında bilgi almak için ise aşağıdaki kod kullanılır.

::

	# pc
	> rostopic info /bumper
	
	
Bumper için Basit Subscriber Yazma
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Catkin çalışma alanında evarobot_bumper_subs adında paket oluşturulur.

::

	> cd ~/catkin_ws/src
	> catkin_create_pkg evarobot_bumper_subs im_msgs rospy roscpp

Oluşturulan paketin içerinde /src klasörü altında bumper_listener.cpp isminde c++ dosyası oluşturulur.

::

	> cd ~/catkin_ws/src/evarobot_bumper_subs
	> mkdir -p ~/catkin_ws/src/evarobot_bumper_subs/src
	> cd src
	> gedit bumper_listener.cpp

bumper_listener.cpp dosyasının içerisine yazılacak kod aşağıda verilmektedir.

::

	#include "ros/ros.h"
	#include "im_msgs/Bumper.h"

	/**
	 * Bu örnekte evarobot üzerindeki bumper sensörleri ROS sistemi üzerinden okuyan basit bir subscriber yapılmaktadır.
	 */

	/**
	 * Dinlenen topikten veri geldiğinde çalışacak callback fonksiyonudur.
	 * Bu örnekte görevi gelen verileri ekrana yazdırmakdır.
	 */
	void chatterCallback(const im_msgs::Bumper::ConstPtr& msg)
	{
	  ROS_INFO("New Data: %d", msg->header.seq);
	  for(int i = 0; i < msg->state.size(); i++)
	  {
		if(msg->state[i].bumper_state)
			  ROS_INFO("Bumper[%d] True", i);
			else
			  ROS_INFO("Bumper[%d] False", i);
	  }
	}

	int main(int argc, char **argv)
	{
	  /**
	   * ROS ilklendiriliyor.
	   */
	  ros::init(argc, argv, "bumper_listener");

	  ros::NodeHandle n;

	  /**
	   * Subscriber tanımlanıyor.
	   * İlk parametre olarak dinlenecek topiğin adı, ardından bufferın büyüklüğü ve callback fonksiyonu tanımlanmaktadır.
	   */
	  ros::Subscriber sub = n.subscribe("bumper", 1000, chatterCallback);

	  ros::spin();

	  return 0;
	}

Kod bu `linten <_static/cpp_codes/bumper.cpp>`_ indirilebilir.

Paket derlenirken yazdığımız cpp dosyasını derlemesi için CMakeLists.txt dosyasını aşağıdaki gibi düzenliyoruz.

::

	> cd ..
	> gedit CMakeLists.txt

	cmake_minimum_required(VERSION 2.8.3)
	project(evarobot_bumper_subs)

	find_package(catkin REQUIRED COMPONENTS
	  im_msgs
	  roscpp
	  rospy
	)

	catkin_package()

	include_directories(
	  ${catkin_INCLUDE_DIRS}
	)

	add_executable(bumper_listener src/bumper_listener.cpp)
	add_dependencies(bumper_listener im_msgs_generate_messages_cpp)
	 target_link_libraries(bumper_listener
	   ${catkin_LIBRARIES}
	)

Yazdığımız ROS paketini derliyoruz.

::

	> cd ~/catkin_ws/
	> catkin_make

Yazdığımız bumper_listener düğümünü aşağıdaki gibi çalıştırıldığında, okunan verilerin ekrana yazılması beklenmektedir.

::

	> rosrun evarobot_bumper_subs bumper_listener	
	
	
.. include:: ros-kizilotesi.rst
	
