

pipeline {
    agent any

    parameters {
        string(name: 'user_input', defaultValue: 'madam', description: 'Enter a string to check if it is a palindrome')
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
                    def output = sh(script: """
                        #!/bin/bash

                        # Function to check if a string is a palindrome
                        is_palindrome() {
                            local input="\$1"
                            local reversed_input=\$(echo "\$input" | rev)
                            if [[ "\$input" == "\$reversed_input" ]]; then
                                echo "The string '\$input' is a palindrome."
                            else
                                echo "The string '\$input' is not a palindrome."
                            fi
                        }

                        # Input string from Jenkins parameter
                        input_string="${params.user_input}"

                        # Check if the string is a palindrome
                        is_palindrome "\$input_string"
                    """, returnStdout: true).trim()
                    
                    writeFile file: OUTPUT_FILE, text: "<html><body><h1>Palindrome Check Result</h1><p>${output}</p></body></html>"
                }
            }
        }

        stage('Display Parameter') {
            steps {
                script {
                    currentBuild.description = "String parameter is '${params.user_input}'"
                }
            }
        }

        stage('Verify Parameter on Web Page') {
            steps {
                script {
                    def description = currentBuild.description
                    if (description.contains("${params.user_input}")) {
                        echo "Parameter '${params.user_input}' exists on the web page."
                    } else {
                        error "Parameter '${params.user_input}' does not exist on the web page."
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
                reportName: 'Palindrome Check Result'
            ])
        }
    }
}


// pipeline {
//     agent any

//     parameters {
//         string(name: 'user_input', defaultValue: '0', description: 'A numeric parameter')
//     }

//     environment {
//         OUTPUT_FILE = 'output.html'
//     }

//     stages {
//         stage('Clone Repository') {
//             steps {
//                 git 'https://github.com/osll1/Linux.git'  
//             }
//         }

//         stage('Run Shell Script') {
//             steps {
//                 script {
//                     def output = sh(script: "bash script.sh ${params.user_input}", returnStdout: true).trim()
//                     writeFile file: OUTPUT_FILE, text: "<html><body><h1>Output</h1><p>${output}</p></body></html>"
//                 }
//             }
//         }

//         stage('Display Parameter') {
//             steps {
//                 script {
//                     currentBuild.description = "Numeric parameter is ${params.user_input}"
//                 }
//             }
//         }

//         stage('Verify Parameter on Web Page') {
//             steps {
//                 script {
//                     def description = currentBuild.description
//                     if (description.contains("${params.user_input}")) {
//                         echo "Parameter ${params.user_input} exists on the web page."
//                     } else {
//                         error "Parameter ${params.user_input} does not exist on the web page."
//                     }
//                 }
//             }
//         }
//     }

//     post {
//         always {
//             archiveArtifacts artifacts: OUTPUT_FILE, fingerprint: true
//             publishHTML(target: [
//                 allowMissing: false,
//                 alwaysLinkToLastBuild: true,
//                 keepAll: true,
//                 reportDir: '.',
//                 reportFiles: OUTPUT_FILE,
//                 reportName: 'Shell Script Output'
//             ])
//         }
//     }
// }
