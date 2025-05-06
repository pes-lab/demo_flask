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
                  docker build -t digo66/app_flask .
                """
            }
        }
        stage('push') {
            steps {
                sh """
                  docker push digo66/app_flask
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
