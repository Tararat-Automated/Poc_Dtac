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
                        echo 'Running test for iOS 1..'
                        pybot -d Result -v ar_OS:iOS -v ar_Porturl:http://localhost:8200/wd/hub -v ar_pfversion:13.5 -v ar_devicename:A7A721F0-11B5-4113-A242-ED6402489624 DtacDemo.robot
                        echo 'Finish testing iOS..'
                        '''
                    },
                    "iOS-2": {
                        sh'''
                        appium -p 8200 &
                        echo 'Running test for iOS 2..'
                        pybot -d Result -v ar_OS:iOS -v ar_Porturl:http://localhost:8200/wd/hub -v ar_pfversion:13.5 -v ar_devicename:D4779DBC-AB3A-4208-9B79-79C5B017E775 DtacDemo.robot
                        echo 'Finish testing iOS..'
                        '''
                    },
                    "Android-1": {
                        sh'''
                        appium -p 8210 &
                        echo 'Running test for Android 1..'
                        pybot -d Result -v ar_OS:Android -v ar_Porturl:http://localhost:8210/wd/hub -v ar_pfversion:9 -v ar_devicename:emulator-5554 DtacDemo.robot
                        echo 'Finish testing Android..'
                        '''
                    },
                    "Android-2": {
                        sh'''
                        appium -p 8211 &
                        echo 'Running test for Android 2..'
                        pybot -d Result -v ar_OS:Android -v ar_Porturl:http://localhost:8211/wd/hub -v ar_pfversion:9 -v ar_devicename:emulator-5556 DtacDemo.robot
                        echo 'Finish testing Android..'
                        '''
                    }
                )
            }
        }
    }
}
