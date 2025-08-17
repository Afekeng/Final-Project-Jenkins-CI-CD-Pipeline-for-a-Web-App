# Flask App CI/CD Pipeline with Jenkins and Docker

## What the App Does
This is a Flask web application that responds to HTTP requests with content rendered by `app.py`.

## What the Jenkins Pipeline Does
The Jenkins pipeline automates the CI/CD process of the Flask application. It performs the following steps:

## Stage-by-Stage Breakdown

### Clone
Clones the project repository from GitHub using SSH credentials stored in Jenkins.

### Test
Placeholder stage for running application tests. Currently contains an echo statement.

### Build Docker
Builds a Docker image for the Flask application and tags it with the Jenkins build number.

### Push to Docker Hub
Logs into Docker Hub using credentials from Jenkins. It tags the image with both the build number and "latest", then pushes both tags to Docker Hub.

## Environment Variables / Credentials

- `IMAGE_NAME`: The full name of the Docker image (`afekeng/flask-app`).
- `BUILD_NUMBER`: Jenkins-provided variable for the current build number.
- `Afekeng`: SSH credentials used to pull from the GitHub repository.
- `docker-jenkins-credentials`: Docker Hub credentials stored in Jenkins (username + password).

## What Was Modified from XD-DENG Example
This pipeline was built from scratch and was not based on the XD-DENG repository. No modifications were made to XD-DENG code.

## Logs or Screenshots of Successful Pipeline Runs
Started by user afek eng
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Jenkins CI_CD Pipeline for a Web App@2
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone)
[Pipeline] git
The recommended git tool is: NONE
using credential Afekeng
Cloning the remote Git repository
Cloning repository git@github.com:Afekeng/Final-Project-Jenkins-CI-CD-Pipeline-for-a-Web-App.git
 > git init /var/lib/jenkins/workspace/Jenkins CI_CD Pipeline for a Web App@2 # timeout=10
Fetching upstream changes from git@github.com:Afekeng/Final-Project-Jenkins-CI-CD-Pipeline-for-a-Web-App.git
 > git --version # timeout=10
 > git --version # 'git version 2.43.0'
using GIT_SSH to set credentials 
Verifying host key using known hosts file
 > git fetch --tags --force --progress -- git@github.com:Afekeng/Final-Project-Jenkins-CI-CD-Pipeline-for-a-Web-App.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git@github.com:Afekeng/Final-Project-Jenkins-CI-CD-Pipeline-for-a-Web-App.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 8e1d90b8a8e14ffc69995efed691817ba413e416 (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 8e1d90b8a8e14ffc69995efed691817ba413e416 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b main 8e1d90b8a8e14ffc69995efed691817ba413e416 # timeout=10
Commit message: "Add files via upload"
 > git rev-list --no-walk 8e1d90b8a8e14ffc69995efed691817ba413e416 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] echo
running test/s
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build Docker)
[Pipeline] sh
+ docker build -t afekeng/flask-app:9 .
#0 building with "default" instance using docker driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 196B done
#1 DONE 0.0s

#2 [internal] load metadata for docker.io/library/python:3.12
#2 DONE 0.5s

#3 [internal] load .dockerignore
#3 transferring context: 2B done
#3 DONE 0.0s

#4 [1/5] FROM docker.io/library/python:3.12@sha256:b66b2931a57fc8e82a28744a13c09bd9e0acd08c38f9906fbe2ae12c225329d5
#4 resolve docker.io/library/python:3.12@sha256:b66b2931a57fc8e82a28744a13c09bd9e0acd08c38f9906fbe2ae12c225329d5 0.0s done
#4 DONE 0.0s

#5 [internal] load build context
#5 transferring context: 51.95kB 0.0s done
#5 DONE 0.0s

#6 [2/5] WORKDIR /app
#6 CACHED

#7 [3/5] COPY requirements.txt .
#7 CACHED

#8 [4/5] RUN pip install --no-cache-dir -r requirements.txt
#8 CACHED

#9 [5/5] COPY . .
#9 DONE 0.1s

#10 exporting to image
#10 exporting layers 0.0s done
#10 writing image sha256:aec6c20bc480f86a7089ae79620fd9e7d8bd7c5a163a733abb8666f0d21130ce done
#10 naming to docker.io/afekeng/flask-app:9 done
#10 DONE 0.0s
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Push to Docker Hub)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] sh
+ docker login -u afekeng -p ****
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
Login Succeeded
+ docker tag afekeng/flask-app:9 afekeng/flask-app:latest
+ docker push afekeng/flask-app:9
The push refers to repository [docker.io/afekeng/flask-app]
a9dcf471b864: Preparing
54e7bfaee742: Preparing
35ebfc9409ad: Preparing
282d45c88fb3: Preparing
99fa613becf2: Preparing
0786f4e9dc98: Preparing
d51cc5e0995c: Preparing
1b90aaaeb596: Preparing
a9b908787288: Preparing
20c8aca21338: Preparing
175a19836175: Preparing
0786f4e9dc98: Waiting
d51cc5e0995c: Waiting
1b90aaaeb596: Waiting
a9b908787288: Waiting
20c8aca21338: Waiting
175a19836175: Waiting
99fa613becf2: Layer already exists
35ebfc9409ad: Layer already exists
282d45c88fb3: Layer already exists
54e7bfaee742: Layer already exists
d51cc5e0995c: Layer already exists
0786f4e9dc98: Layer already exists
1b90aaaeb596: Layer already exists
a9b908787288: Layer already exists
20c8aca21338: Layer already exists
175a19836175: Layer already exists
a9dcf471b864: Pushed
9: digest: sha256:2e313ca12e1c50cf240f6f5026b1afd6021b8950e35a5e2308c757d96f3cc617 size: 2629
+ docker push afekeng/flask-app:latest
The push refers to repository [docker.io/afekeng/flask-app]
a9dcf471b864: Preparing
54e7bfaee742: Preparing
35ebfc9409ad: Preparing
282d45c88fb3: Preparing
99fa613becf2: Preparing
0786f4e9dc98: Preparing
d51cc5e0995c: Preparing
1b90aaaeb596: Preparing
a9b908787288: Preparing
20c8aca21338: Preparing
175a19836175: Preparing
0786f4e9dc98: Waiting
d51cc5e0995c: Waiting
1b90aaaeb596: Waiting
a9b908787288: Waiting
20c8aca21338: Waiting
175a19836175: Waiting
35ebfc9409ad: Layer already exists
99fa613becf2: Layer already exists
282d45c88fb3: Layer already exists
54e7bfaee742: Layer already exists
a9dcf471b864: Layer already exists
1b90aaaeb596: Layer already exists
0786f4e9dc98: Layer already exists
a9b908787288: Layer already exists
d51cc5e0995c: Layer already exists
20c8aca21338: Layer already exists
175a19836175: Layer already exists
latest: digest: sha256:2e313ca12e1c50cf240f6f5026b1afd6021b8950e35a5e2308c757d96f3cc617 size: 2629
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] echo
Pipeline done.
[Pipeline] echo
Build succeeded.
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS

## Problems Encountered and How They Were Solved

- **Git SSH Access Denied**: Solved by creating an SSH key and adding it to both GitHub and Jenkins credentials.
- **Docker login failed in Jenkins**: Solved by creating a Docker Hub username/password credential in Jenkins and using it inside `withCredentials`.


