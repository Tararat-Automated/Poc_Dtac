pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin"
        ANDROID_HOME = "/Users/tararatwongsansee/Library/Android/sdk"
        JAVA_HOME = "/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home"
    }

    stages {
        stage('TestiOS') {
            steps {
                parallel (
                    "iOS1": {
                        sh'''
                        appium -p 8200 &
                        sleep 5s
                        echo 'Running test for iOS..'
                        pybot -d Result/iOS2 -v ar_OS:iOS -v ar_Porturl:http://localhost:8200/wd/hub -v ar_pfversion:13.6 -v ar_devicename:iPhone11 DtacDemo.robot
                        echo 'Finish testing iOS..'
                        '''
                    },
                    "iOS2": {
                        sh'''
                        appium -p 8201 &
                        sleep 5s
                        echo 'Running test for iOS..'
                        pybot -d Result/iOS1 -v ar_OS:iOS -v ar_Porturl:http://localhost:8201/wd/hub -v ar_pfversion:13.2 -v ar_devicename:BB7783D1-2C5C-4E42-914E-AA2AFAD8DCD0 DtacDemo.robot
                        echo 'Finish testing iOS..'
                        '''
                    }
                )
            }
        }
        stage ("TestAndroid"){
            steps {
                parallel (
                    "Android1": {
                        sh'''
                        appium -p 8210 &
                        sleep 5s
                        echo 'Running test for Android..'
                        pybot -d Result/Android1 -v ar_OS:Android -v ar_Porturl:http://localhost:8210/wd/hub -v ar_pfversion:9 -v ar_devicename:emulator-5554 DtacDemo.robot
                        echo 'Finish testing Android'
                        '''
                    },
                    "Android2": {
                        sh'''
                        appium -p 8211 &
                        sleep 5s
                        echo 'Running test for Android..'
                        pybot -d Result/Android2 -v ar_OS:Android -v ar_Porturl:http://localhost:8211/wd/hub -v ar_pfversion:10 -v ar_devicename:emulator-5556 DtacDemo.robot
                        echo 'Finish testing Android'
                        '''
                    }

                )
            }
        }
    }
}
