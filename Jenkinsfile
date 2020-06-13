
  
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
		
		stage('Build Docker Image & upload') {
			steps{
				node {
				   docker.withRegistry('https://registry.hub.docker.com', 'DockerHubID') {
					 echo "build image"
					def image = docker.build("rabinprj123/udacityprj5")
 					echo "push image"
					/* Push the container to the custom Registry */
					image.push()
				    }
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
