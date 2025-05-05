pipeline {
    agent {
        node { label 'slave_node'}
    }

    stages {
        // stage('Hello') {
        //     steps {
        //         echo 'Hello World'
        //     }
        // }
        stage('check') {
            steps {
                sh """
                  whoami
                  pwd
                  ls
                """
            }
        }
    }
    
    post {
        success {
            echo "success"
        }
        failure {
            echo "failure"
        }
    }
}
