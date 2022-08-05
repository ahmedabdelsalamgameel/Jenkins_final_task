# CI/CD pipeline for Node.js App

****Descreption****

→ build infrastructure on aws using terraform
→ prepare ec2 to be node agent for jenkins
→ deploy node.js app on ec2 by jenkins pipeline

### - Build our infrastructure using terraform on aws

```bash
$ terraform init
$ terraform paln
$ terraform apply 
```

### - Build an image from jenkins with docker client and run a new container

- build jenkins image
    
    ```bash
    $ docker build . -f dockerfile -t jenkins_docker
    ```
    
- run container from this image
    
    ```bash
    $ docker run -d -p 8082:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins_docker
    ```
    
    ![Untitled](CI%20CD%20pipeline%20for%20Node%20js%20App%20b8617be732914d6387eb71724c017a1b/Untitled.png)
    
- ssh to app ec2 through bastion ec2
    - create config file on .ssh dir on Jenkins container
        
        ```bash
        Host bastion_ec2
        User ubuntu
        HostName 3.236.182.194  
        IdentityFile /root/.ssh/test_keypair.pem  
        Host app_ec2
        HostName  10.0.3.139
        user ubuntu
        ProxyCommand ssh bastion_ec2 -W %h:%p
        identityFile /root/.ssh/test_keypair.pem 
        ```
        
        ![Untitled](CI%20CD%20pipeline%20for%20Node%20js%20App%20b8617be732914d6387eb71724c017a1b/Untitled%201.png)
        
    
- try to ssh using “jump host” through config file [in jenkins container]
    
    ```bash
    $ ssh application_ec2
    ```
    
    ![Untitled](CI%20CD%20pipeline%20for%20Node%20js%20App%20b8617be732914d6387eb71724c017a1b/Untitled%202.png)
    

- prepare private instance  [application_ec2] to be node agent for jenkins
    - Download JAR file
    
    ![Untitled](CI%20CD%20pipeline%20for%20Node%20js%20App%20b8617be732914d6387eb71724c017a1b/Untitled%203.png)
    
    - run application_ec2.yaml in ansible dir
        
        ```bash
        $ ansible-playbook -i ansible/inventory --private-key test_keypair.pem ansible/application_ec2.yaml
        ```
        
        ![Untitled](CI%20CD%20pipeline%20for%20Node%20js%20App%20b8617be732914d6387eb71724c017a1b/Untitled%204.png)
        

- create node agent
    
    ![Untitled](CI%20CD%20pipeline%20for%20Node%20js%20App%20b8617be732914d6387eb71724c017a1b/Untitled%205.png)
    
    ### Build Pipeline
    
    ![Untitled](CI%20CD%20pipeline%20for%20Node%20js%20App%20b8617be732914d6387eb71724c017a1b/Untitled%206.png)
    
    ## Test DB connection
    
    ![Untitled](CI%20CD%20pipeline%20for%20Node%20js%20App%20b8617be732914d6387eb71724c017a1b/Untitled%207.png)
    

### Test redis connection

![Untitled](CI%20CD%20pipeline%20for%20Node%20js%20App%20b8617be732914d6387eb71724c017a1b/Untitled%208.png)