pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin"
        ANDROID_HOME = "/Users/tararatwongsansee/Library/Android/sdk"
        JAVA_HOME = "/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home"
    }

    stages {
        stage('Test') {
            steps {
                parallel (
                    "iOS-1": {
                        sh'''
                        appium -p 8200 &
                        sleep 5s
                        echo 'Running test for iOS 1..'
                        pybot -d Result/iOS -v ar_OS:iOS -v ar_Porturl:http://localhost:8200/wd/hub -v ar_pfversion:13.2 -v ar_devicename:FA551A27-9414-4785-AFCE-9D9B3A09B551 DtacDemo.robot
                        echo 'Finish testing iOS..'
                        '''
                    },
                    "iOS-2": {
                        sh'''
                        appium -p 8201 &
                        sleep 5s
                        echo 'Running test for iOS 1..'
                        pybot -d Result/iOS -v ar_OS:iOS -v ar_Porturl:http://localhost:8201/wd/hub -v ar_pfversion:13.6 -v ar_devicename:B13DAB82-673C-428E-87F1-24A31042DC0F DtacDemo.robot
                        echo 'Finish testing iOS..'
                        '''
                    },
                    "Android-1": {
                        sh'''
                        appium -p 8210 &
                        sleep 5s
                        echo 'Running test for Android 1..'
                        pybot -d Result/Android -v ar_OS:Android -v ar_Porturl:http://localhost:8210/wd/hub -v ar_pfversion:9 -v ar_devicename:emulator-5554 DtacDemo.robot
                        echo 'Finish testing Android 1'
                        '''
                    },
                    "Android-2": {
                        sh'''
                        appium -p 8211 &
                        sleep 5s
                        echo 'Running test for Android 2..'
                        pybot -d Result/Android -v ar_OS:Android -v ar_Porturl:http://localhost:8211/wd/hub -v ar_pfversion:10 -v ar_devicename:emulator-5556 DtacDemo.robot
                        echo 'Finish testing Android 2'
                        '''
                    }
                )
            }
        }
    }
}