pipeline {
    agent any
    environment {
        CI = 'true'
    }
    stages {
        stage('Deploy') {
            steps {
                sh 'kubectl config set-context --current --namespace weather'
                sh 'helm upgrade --install weather src/app/chart -f src/app/chart/override.values.yaml'
            }
        }
    }
}
