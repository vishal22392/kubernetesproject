pipeline {
    agent any
    environment {
        def dockerRun = "docker run -p 8000:80 -d --name cloudknowledges  sd171991/demo-project:latest"
        def dockerrm = "docker container rm -f cloudknowledges"
        def dockerimagerm = "docker image rmi  sd171991/demo-project"
    }
        

    stages {
        stage('PUll') {
            steps {
                git 'https://github.com/cloudjankari/kubernetesproject.git'
            }
        }
        
        stage("Build") {
            steps {
                sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID sd171991/$JOB_NAME:v1.$BUILD_ID'
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID sd171991/$JOB_NAME:latest'
                
            }
        }
        
        stage("Push") {
            steps {
                withCredentials([string(credentialsId: 'mobilehubpassword', variable: 'mobilehubpassword')]) {
    // some block
    sh 'docker login -u sd171991 -p ${mobilehubpassword}'
    sh 'docker image push sd171991/$JOB_NAME:v1.$BUILD_ID'
    sh 'docker image push sd171991/$JOB_NAME:latest'
    sh 'docker image rmi $JOB_NAME:v1.$BUILD_ID sd171991/$JOB_NAME:v1.$BUILD_ID sd171991/$JOB_NAME:latest'
}
            }
        }
        
        stage("Deployment") {
            steps {
             sshagent(['hostpassword']) {
    // some block           
   
                 sh "ssh -o StricHostKeyChecking=no ec2-user@172.31.42.54 ${dockerrm}"
                 sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.42.54 ${dockerimagerm}"
                 sh "ssh -o StricHostKeyChecking=no ec2-user@172.31.42.54  ${dockerRun}"
    
}
        }
        }
    }
}
