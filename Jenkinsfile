pipeline {
    agent any

environment {
        CF_CREDS = credentials('cf-creds')
            }

    stages {
         stage('CF Login') {
    steps {
        bat """
        cf login ^
        -a https://api.cf.eu10-005.hana.ondemand.com ^
        -u %CF_CREDS_USR% ^
        -p %CF_CREDS_PSW%
        """
    }
}

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
        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                       bat 'terraform apply -auto-approve'
                                 }
                    }
                }
       stage('Target Space') {
            steps {
                    bat 'cf target -o org-build-igen43-lab-inhouse-jv4r8a7p -s bookshop-dev'
                    }
             }
stage('Debug CF') {
    steps {
        bat 'whoami'
        bat 'cf plugins'
    }
}

        stage('Deploy MTAR') {
            steps {
                    bat 'cf deploy mta_archives\\bookshop_1.0.0.mtar -f'
                    }
                }

       
    }
}