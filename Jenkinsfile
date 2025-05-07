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
        stage('SonarQube analysis') {
        def scannerHome = tool 'sonarCloud';
            try {
                withSonarQubeEnv('sonarScanner') { 
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            } catch (Exception e) {
                echo "SonarQube analysis failed: ${e.message}"
                currentBuild.result = 'FAILURE'
            }
        }
        stage('docker hub login'){
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_hub_key', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                }
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
