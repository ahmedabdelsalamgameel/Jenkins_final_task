pipeline {

    agent {label "app_slave"}

    stages {
        stage('prepare') {
            steps {
                git 'https://github.com/ahmedabdelsalamgameel/Jenkins_final_task.git'
            }
        }
        
        stage('CI'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                sh '''

                    docker build ./nodeapp -f ./nodeapp/dockerfile -t ahmedabdelsalam19/nodejs_app
                    docker login -u ${USERNAME} -p ${PASSWORD}
                    docker push ahmedabdelsalam19/nodejs_app
                
                '''
                }
            }   
        }

        stage('CD'){
            steps{
                sh 'docker run -d -p 3000:3000 \
                -e REDIS_HOSTNAME=cluster-example.vwxetl.0001.use1.cache.amazonaws.com \
                -e REDIS_PORT=6379 \
                -e RDS_HOSTNAME=mysqldb.cpfst37s45nt.us-east-1.rds.amazonaws.com \
                -e RDS_USERNAME="admin" \
                -e RDS_PASSWORD="10321032" \
                -e RDS_PORT=3306 \
                ahmedabdelsalam19/nodejs_app '
            }
        }
    }
}