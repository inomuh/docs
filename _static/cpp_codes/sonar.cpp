#include "ros/ros.h"
#include "sensor_msgs/Range.h"


void chatterCallback(const sensor_msgs::Range::ConstPtr& msg)
{
  ROS_INFO("Sonar Seq: [%d]", msg->header.seq);
  ROS_INFO("Sonar Range: [%f]", msg->range);
}

int main(int argc, char **argv)
{ 
  ros::init(argc, argv, "infrared_listener");

  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("sensor/sonar0", 1000, chatterCallback);

  ros::spin();

  return 0;
}
