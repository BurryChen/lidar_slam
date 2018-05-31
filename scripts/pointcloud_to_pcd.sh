#!/bin/sh
#
#roscore
FILE="/home/whu/data/whuplat/VLP16/_2018-05-04-11-56-52.bag"

# 2 pointcloud_to_pcd
mkdir ${FILE}_pc_hori ${FILE}_pc_ver

rosrun pcl_ros pointcloud_to_pcd __name:=pointcloud_to_pcd1 input:=/horizontal_laser_3d _prefix:=${FILE}_pc_hori/h_ &

rosrun pcl_ros pointcloud_to_pcd __name:=pointcloud_to_pcd2 input:=/vertical_laser_3d _prefix:=${FILE}_pc_ver/v_ &


# 3

rosbag play ${FILE} -r 0.1  

#x-terminal-emulator &

#rosbag record -O ${FILE}_point /horizontal_laser_2d /vertical_right_laser_2d /horizontal_point /vertical_right_point


