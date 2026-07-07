pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build CAP Project') {
            steps {
                bat 'npx cds build'
            }
        }
    }
}