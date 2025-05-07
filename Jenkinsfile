pipeline {
    agent {
        node { label 'slave_node'}
    }
    environment {
        // 通过 withSonarQubeEnv 注入 SonarQube 环境变量
        def scannerHome = tool 'sonarScanner' // 替换为你在 Jenkins 中配置的 SonarQube 扫描器名称
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
            steps {
            // def scannerHome = tool 'sonarCloud';
                withSonarQubeEnv('sonarCloud') { 
                    sh "${scannerHome}/bin/sonar-scanner"
                }
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
