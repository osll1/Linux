



pipeline {
    agent any

    parameters {
        string(name: 'user_input', defaultValue: 'madam', description: 'Enter a string to check if it is a palindrome')
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
                    def output = sh(script: "bash script.sh '${params.user_input}'", returnStdout: true).trim()
                    echo output // This line outputs the result to the Jenkins console

                    // Write the HTML file content
                    writeFile file: OUTPUT_FILE, text: """
                        <!DOCTYPE html>
                        <html lang='en'>
                        <head>
                            <meta charset='UTF-8'>
                            <meta name='viewport' content='width=device-width, initial-scale=1.0'>
                            <title>Palindrome Check Result</title>
                        </head>
                        <body>
                            <h1>Palindrome Check Result</h1>
                            <p>${output}</p>
                        </body>
                        </html>
                    """
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
//         string(name: 'user_input', defaultValue: 'madam', description: 'Enter a string to check if it is a palindrome')
//     }

//     environment {
//         OUTPUT_FILE = 'palindrome_result.html'
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
//                     def output = sh(script: "bash script.sh '${params.user_input}'", returnStdout: true).trim()
//                     echo output // This line outputs the result to the Jenkins console

//                     // Write the HTML file content
//                     writeFile file: OUTPUT_FILE, text: """
//                         <!DOCTYPE html>
//                         <html lang='en'>
//                         <head>
//                             <meta charset='UTF-8'>
//                             <meta name='viewport' content='width=device-width, initial-scale=1.0'>
//                             <title>Palindrome Check Result</title>
//                         </head>
//                         <body>
//                             <h1>Palindrome Check Result</h1>
//                             <p>${output}</p>
//                         </body>
//                         </html>
//                     """
//                 }
//             }
//         }

//         stage('Display Parameter') {
//             steps {
//                 script {
//                     currentBuild.description = "String parameter is '${params.user_input}'"
//                 }
//             }
//         }

//         stage('Verify Parameter on Web Page') {
//             steps {
//                 script {
//                     def description = currentBuild.description
//                     if (description.contains("${params.user_input}")) {
//                         echo "Parameter '${params.user_input}' exists on the web page."
//                     } else {
//                         error "Parameter '${params.user_input}' does not exist on the web page."
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
//                 reportName: 'Palindrome Check Result'
//             ])
//         }
//     }
// }



