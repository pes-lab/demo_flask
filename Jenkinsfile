pipeline {
    agent {
        node { label 'slave_node'}
    }

    stages {
        stage('check') {
            steps {
                sh """
                  whoami
                  pwd
                  ls
                """
            }
        }
        stage('build') {
            steps {
                sh """
                  docker build
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
