
  
pipeline {
    //environment {
      //  registry = "capstone/udacityprj5:v1.0"
    //}
	agent any
	stages {

		stage('Lint HTML') {
			steps {
				sh 'tidy -q -e *.html'
			}
		}
		stage('Build Docker Image ') {
			steps{
				sh "./run_docker.sh"				
			}
			
		}
		
		stage('upload docker image') {
			steps{
				
			withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
				 sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
				 sh "docker tag udacityprj5 rabinprj123/udacityprj5" 
				 sh 'docker push rabinprj123/udacityprj5'
				}
				
			}
			
		}
		stage('Deploy to EKS') {
			steps {
				withAWS(region:'us-east-1', credentials:'eks_credentials') {
					sh "./k8s.sh"
				}
			}
		}

        stage('Rolling update') {
			steps {
				withAWS(region:'us-east-1', credentials:'eks_credentials') {
					sh "./k8s-update.sh"
				}
			}
		}
	}
}
