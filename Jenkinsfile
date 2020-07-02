
  
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
				// Build image and add a descriptive tag
				sh "docker build  --tag=udacityprj5 ."
			
			}
			
		}
		
		stage('upload docker image') {
			steps{
				
			withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
				 sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
				 sh "docker tag udacityprj5 rabinprj123/udacityprj5:$BUILD_ID" 
				 sh 'docker push rabinprj123/udacityprj5'
				}
				
			}
			
		}
		stage('Deploy to EKS') {
			steps {
				withAWS(region:'us-east-1', credentials:'eks_credentials') {
					sh "aws eks --region us-east-1 update-kubeconfig --name capstoneprj"
					echo "start kube apply"
					sh "kubectl apply -f  app-deployment.yaml"
					sh "kubectl get nodes"
					sh "kubectl get pods"
					sh "kubectl describe pods"
				}
			}
		}

        stage('Rolling update') {
			steps {
				withAWS(region:'us-east-1', credentials:'eks_credentials') {
					sh "kubectl set image deployment/nginx nginx=rabinprj123/udacityprj5:latest"
					sh "kubectl rollout status deployment/nginx"
					sh "kubectl get deployments"
				}
			}
		}
	}
}
