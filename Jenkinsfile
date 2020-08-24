pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin"
    }

    stages {
        stage('Test') {
            steps {
                parallel (
                    "iOS": {
                        sh'''
                        echo 'Running test for iOS..'
                        pybot -d Result -v ar_OS:iOS  DtacDemo.robot
                        echo 'Finish testing iOS..'
                        '''
                    },
                    "Android": {
                        sh'''
                        echo 'Running test for Android..'
                        pybot -d Result -v ar_OS:Android  DtacDemo.robot
                        echo 'Finish testing Android..'
                        '''
                    }
                )
            }
        }
    }
}