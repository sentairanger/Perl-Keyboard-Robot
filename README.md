# Perl-Keyboard-Robot
This project controls a robot in Perl using a CamJam Edukit 3 board but can be used with other motor boards. 

## Getting started

I have provided a cpanfile to install the needed libraries. You can install them individually with `cpan <module-name>` but be sure to be in root to install these modules. Then you can run the application with `perl robot-movement.pl`. And then the LED should first blink and then you can run the robot with the a, s, d and f keys. You can use any motor board you want, but just update the pin numbers. 
