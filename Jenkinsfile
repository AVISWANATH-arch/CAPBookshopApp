pipeline {
    agent any

    stages {

        stage('Check MBT') {
            steps {
                bat 'mbt --version'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build MTAR') {
            steps {
                bat 'mbt build'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    bat 'terraform plan'
                }
            }
        }
    }
}