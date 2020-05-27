pipeline {
   agent {
       docker {
           image 'douglasrs89/pychorme'
           args '--network=skynet'
       }
   }

   stages {
      stage('Build') {
         steps {
            sh 'pip install -r requirements.txt'
         }
      }
      stage('Testing') {
          steps {
              sh 'robot -d ./logs -v browser:headless tests/'
          }
          post {
              always {
                  robot 'logs'
              }
          }
      }
      stage('UAT') {
          steps {
             echo 'Simulando a provação do PO'
             input(message: 'Você aprova essa versão?', ok: 'Sim :)')
          }
      }
   }
}
