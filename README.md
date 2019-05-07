# lidar_slam
Package to run 3D SLAM with two 2d Lidars, pixhawk imu and the Cartographer package

 
3)roslaunch
# Launch the 2D backpack demo.
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=${HOME}/Downloads/cartographer_paper_deutsches_museum.bag

roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=/home/whu/data/cartographer_paper_deutsches_museum.bag

roslaunch cartographer_ros offline_backpack_2d.launch bag_filenames:=/home/whu/data/cartographerdata/cartographer_paper_deutsches_museum.bag


 
-------------------------------------------   20171022
Cartographer现已经支持Toyota HSR、TurtleBots、PR2、RevoLDS这几个机器人平台。

启动ROS 

roscore
1) revo_lds 例子
roslaunch cartographer_ros demo_revo_lds.launch bag_filename:=/home/whu/data/cartographer_paper_revo_lds.bag

2）hokuyo
新终端，启动hokuyo UTM-30LX
ls -l /dev/ttyACM0
若显示为crw-rw----，则为其加权限使其显示为crw-rw-rw-

sudo chmod a+rw /dev/ttyACM0

roslaunch cartographer_ros demo_hokuyo.launch
3)2 hokuyo+imu

例子
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=/home/whu/data/cartographer_paper_deutsches_museum.bag

4）myself  1 hokuyo+imu

sudo chmod a+rw /dev/ttyACM0 /dev/ttyUSBO
roslaunch cartographer_ros hokuyo_IMU.launch

4）myself  hokuyo

sudo chmod a+rw /dev/ttyACM0 
roslaunch lidar_slam demo_hokuyo.launch

-------------------------------------------   20171107
1)cmd 调试:
/home/whu/slam_ws/install/lib/cartographer_ros/cartographer_node -configuration_directory /home/whu/slam_ws/install/share/lidar_slam/configuration_files -configuration_basename backpack_2d.lua echoes_1:=horizontal_laser_2d echoes_2:=vertical_laser_2d __name:=cartographer_node

/home/whu/slam_ws/install/lib/cartographer_ros/cartographer_node -configuration_directory /home/whu/slam_ws/install/share/cartographer_ros/configuration_files -configuration_basename backpack_2d.lua echoes:=horizontal_laser_2d __name:=cartographer_node

valgrind --tool=callgrind

--------------------------------------------- 20180130
velodyne 的启动
-----------------
1. install Driver

$ sudo apt-get install ros-VERSION-velodyne
2 connect to the LIDAR
http://wiki.ros.org/velodyne/Tutorials/Getting%20Started%20with%20the%20Velodyne%20VLP16
http://wiki.ros.org/velodyne/Tutorials/Getting%20Started%20with%20the%20HDL-32E

$sudo ifconfig eth0 192.168.1.100

$sudo route add 192.168.1.201 eth0  每次roslaunch都要重新设置,关闭无线网络

3 View Data

$roslaunch velodyne_pointcloud 32e_points.launch calibration:=/opt/ros/kinetic/share/velodyne_pointcloud/params/32db.yaml

$rosrun rviz rviz -f velodyne

线头的正对面是+X,上方是+Z，右手法则

-----------------------------------------20180426
VLP-16 3D data record  
1. Setting->Eidt connections
 https://jingyan.baidu.com/article/86fae346d096093c49121a30.html
 http://wiki.ros.org/velodyne/Tutorials/Getting%20Started%20with%20the%20Velodyne%20VLP16
 //restart network：
 $ sudo /etc/init.d/networking restart
 //test 
 $ ifconfig 
 $ ping 192.168.1.201
 
2. 开启imu权限 sudo chmod 777 /dev/ttyUSB0
3. roslaunch lidar_slam record_vlp16_2_imu.launch 
