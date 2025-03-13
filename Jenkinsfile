pipeline {
    agent any

    stages {
        stage('Deploy with Helm') {
            steps {
                script {
                    withCredentials([file(credentialsId: 'kubeconfig_credential', variable: 'KUBECONFIG')]) {
                        sh '''
                            export KUBECONFIG=${KUBECONFIG}
                            kubectl config set-context --current --namespace weather
                            helm upgrade --install weather src/app/chart -f src/app/chart/override.values.yaml
                        '''
                    }
                }
            }
        }
    }
}
