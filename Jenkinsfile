pipeline {
    agent any

    parameters {
        string(name: 'INPUT_STRING', defaultValue: '', description: 'Enter a string to check if it is a palindrome')
    }

    environment {
        OUTPUT_FILE = 'palindrome_result.html'
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
                    def output = sh(script: "bash script.sh \"${params.INPUT_STRING}\"", returnStdout: true).trim()
                    writeFile file: OUTPUT_FILE, text: "<html><body><h1>Palindrome Check Result</h1><p>${output}</p></body></html>"
                }
            }
        }

        stage('Display Parameter') {
            steps {
                script {
                    currentBuild.description = "Palindrome check for input: ${params.INPUT_STRING}"
                }
            }
        }

        stage('Verify Output') {
            steps {
                script {
                    def description = currentBuild.description
                    if (description.contains("${params.INPUT_STRING}")) {
                        echo "Palindrome check result for input: ${params.INPUT_STRING} displayed."
                    } else {
                        error "Palindrome check result not displayed correctly."
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
                reportName: 'Palindrome Check Output'
            ])
        }
    }
}





