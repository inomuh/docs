#include "ros/ros.h"
#include "im_msgs/Bumper.h"

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
  ros::init(argc, argv, "bumper_listener");

  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("bumper", 1000, chatterCallback);

  ros::spin();

  return 0;
}
