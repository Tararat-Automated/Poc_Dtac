pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                parallel (
                    "iOS": {
                        echo 'Running test for iOS..'
                        pybot -d Result -v ar_OS:iOS  DtacDemo.robot
                        echo 'Finish testing iOS..'
                    },
                    "Android": {
                        echo 'Running test for Android..'
                        pybot -d Result -v ar_OS:Android  DtacDemo.robot
                        echo 'Finish testing Android..'
                    }
                )
            }
        }
    }
}