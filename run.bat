@echo off
set PWD=%CD%
call  pybot -d Result -v ar_OS:Android  Demo_test.robot "%PWD%\NRM-M_Project\Demo_test.robot
call pybot -d Result -v ar_Porturl:http://localhost:4723/wd/hub -v ar_OS:iOS  -v ar_pfversion:13.2.2 -v ar_devicename:iPhone8  DtacDemo.robot


