pipeline {
    agent any

    parameters {
        string(name: 'user_input', defaultValue: '0', description: 'A numeric parameter')
    }

    environment {
        OUTPUT_FILE = 'output.html'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/osll1/Linux.git'  
            }
        }

        stage('Run Shell Script') {
            steps {
                script {
                    def output = sh(script: "bash script.sh ${params.user_input}", returnStdout: true).trim()
                    writeFile file: OUTPUT_FILE, text: "<html><body><h1>Output</h1><p>${output}</p></body></html>"
                }
            }
        }

        stage('Display Parameter') {
            steps {
                script {
                    currentBuild.description = "Numeric parameter is ${params.user_input}"
                }
            }
        }

        stage('Verify Parameter on Web Page') {
            steps {
                script {
                    def description = currentBuild.description
                    if (description.contains("${params.user_input}")) {
                        echo "Parameter ${params.user_input} exists on the web page."
                    } else {
                        error "Parameter ${params.user_input} does not exist on the web page."
                    }
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: OUTPUT_FILE, fingerprint: true
            publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: '.',
                reportFiles: OUTPUT_FILE,
                reportName: 'Shell Script Output'
            ])
        }
    }
}
