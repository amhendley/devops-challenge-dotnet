pipeline {
    agent any

    environment {
        CONFLUENCE_PARENT_PAGE_ID = '1234567890'
        
        SONARQUBE_CREDENTIALS_ID = 'sonarqube-token'
        SAST_CREDENTIALS_ID = 'sast-login'
        CSA_CREDENTIALS_ID = 'csa-login'
        CSS_CREDENTIALS_ID = 'css-login'
        REGISTRY_CREDENTIALS_ID = 'registry-login'

        IMAGE_NAME = 'devops-dotnet-challenge'
        IMAGE_TAGS = "${IMAGE_NAME}:latest,${IMAGE_NAME}:0.${BUILD_NUMBER}"

    }

    options {
        disableConcurrentBuilds()
        timestamps()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Validate') {
            steps {
                echo "Validation..."
            }
        }
        stage('Initialise') {
            steps {
                echo "Initialisation..."
            }
        }
        stage('Clean') {
            steps {
                echo "Clean..."
            }
        }
        stage('Build') {
            steps {
                echo "Build..."
                echo "Bundle Up..."
            }
        }
        stage('Publish') {
            steps {
                echo "Publish: Container image to DEVELOP Registry repository..."
                echo "Publish: Database scripts to a DEVELOP Blob repository version folder..."
            }
        }    
        stage('Tests') {
            parallel {
                stage('Unit Tests') {
                    steps {
                        echo "Unit Tests: Execution..."
                    }
                }
                stage('Inspect') {
                    steps {
                        echo "Inspect: Code quality (linting) analysis..."
                    }
                }
            }
        }
        stage('Compliance') {
            parallel {
                stage('Quality') {
                    steps {
                        echo "Quality: Validate unit and linting tests..."
                    }
                }
                stage('SAST') {
                    steps {
                        echo "SAST: Static code analysis..."
                    }
                }
                stage('CSA') {
                    steps {
                        echo "SCA: Dependency analysis..."
                    }
                }
                stage('CSS') {
                    steps {
                        echo "CSS: Container analysis..."
                    }
                }
            }
        }
        stage('Deploy') {
            when {
                anyOf {
                    branch 'master';
                    branch 'main'
                }
            }
            steps {
                echo "Deploy: Database delta changes..."
                echo "Deploy: AWS ECS Cluster..."
                echo "Deploy: AWS ECS Task Definition..."
                echo "Deploy: AWS ECS Service..."
                echo "Deploy: AWS NLB..."
                echo "Deploy: AWS Route 53..."
            }
        }
        stage('Integration') {
            when {
                anyOf {
                    branch 'master';
                    branch 'main'
                }
            }
            steps {
                echo "Integration: Perform integration tests..."
                echo "Integration: Publish compliance reports to DEVELOP Blob repository version folder..."
            }
        }
        stage('Promote') {
            when {
                anyOf {
                    branch 'master';
                    branch 'main'
                }
            }
            steps {
                echo "Promote: DEVELOP repository Container image to a STAGING Registry repository..."
                echo "Promote: DEVELOP Blob version folder to a STAGING Blob repository..."
         
        }
        stage('Clean Up') {
            steps {
                echo "Clean Up..."
            }
        }
    }
    post {
        always {
            echo "Post: email build status..."
        }
        success {
            script {
                if ("${BRANCH_NAME}" in ['master', 'main']) {
                    echo "Post: MS Teams success post..."
                    echo "Post: Publish build results to Confluence..."
                }
            }
        }
        failure {
            script {
                if ("${BRANCH_NAME}" in ['master', 'main']) {
                    echo "Post: MS Teams failure post..."
                }
            }
        }
    }
}