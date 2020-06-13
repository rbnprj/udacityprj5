
  
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
		
		stage('Build Docker Image') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh "./run_docker.sh"
				}
			}
		}

		stage('Upload Docker Image') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh "./upload_docker.sh"
				

                    sh "./upload_docker.sh $DOCKER_USERNAME $DOCKER_PASSWORD"
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
