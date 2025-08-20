# Flask App CI/CD Pipeline with Jenkins and Docker

# What the App Does:
This application is a Flask server that serves the home page (/).
When a user visits, it loads the index.html file and displays a message – either from an environment variable or a default text.
In short, it’s a web app that shows a dynamic welcome message in an HTML page.

# What the Jenkins Pipeline Does:
This pipeline sets up a CI/CD process for a Flask application.
It pulls the code from GitHub, runs basic tests, builds a Docker image, and pushes it to Docker Hub with both the build number and latest tags.
Finally, it sends status notifications to Slack and cleans up old Docker images and containers.

# Stage-by-Stage Breakdown:

Clone:
Pull source code from GitHub using credentials.

Test:
Run tests (currently just prints "running test/s").

Build Docker:
Build a Docker image tagged as IMAGE_NAME:BUILD_NUMBER.

Push to Docker Hub:
Log in to Docker Hub with Jenkins credentials.
Tag the image also as "latest".
Push both IMAGE_NAME:BUILD_NUMBER and IMAGE_NAME:latest.

Get Docker Image Created Date:
Show creation date of the built Docker image.

Cleanup Images:
Remove the locally built images (BUILD_NUMBER and latest).

Post Actions:
Success - Send Slack notification: "Build SUCCESS".
Failure - Send Slack notification: "Build FAILURE".
Aborted - Send Slack notification: "Build ABORTED".
Always  - Clean up unused containers and old Docker images, then finish pipeline.


# Environment Variables / Credentials:
IMAGE_NAME: The full name of the Docker image (afekeng/flask-app).
BUILD_NUMBER: Jenkins-provided variable for the current build number.
Afekeng: SSH credentials used to pull from the GitHub repository.
docker-jenkins-credentials: Docker Hub credentials stored in Jenkins (username + password).

# What Was Modified from XD-DENG Example:
This pipeline was built from scratch and was not based on the XD-DENG repository. No modifications were made to XD-DENG code.

# Logs or Screenshots of Successful Pipeline Runs:

Started by user afek eng

[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins
 in /var/lib/jenkins/workspace/Jenkins CI_CD Pipeline for a Web App@2
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
Checking out Revision 01ff277aadf590b073a6fed096dc290a7e564d83 (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 01ff277aadf590b073a6fed096dc290a7e564d83 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b main 01ff277aadf590b073a6fed096dc290a7e564d83 # timeout=10
Commit message: "Add files via upload"
 > git rev-list --no-walk 01ff277aadf590b073a6fed096dc290a7e564d83 # timeout=10
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
+ docker build -t afekeng/flask-app:25 .
#0 building with "default" instance using docker driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 255B done
#1 DONE 0.0s

#2 [internal] load metadata for docker.io/library/python:3.12
#2 DONE 0.9s

#3 [internal] load .dockerignore
#3 transferring context: 2B done
#3 DONE 0.0s

#4 [1/5] FROM docker.io/library/python:3.12@sha256:23e642ca5600c3c6925490bf500914abe411d944b237ac0c6c87af2cd091b8fd
#4 DONE 0.0s

#5 [internal] load build context
#5 transferring context: 57.89kB 0.0s done
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
#10 writing image sha256:e4053acab98a9f0d11b29fab2e08bd0d72dbb603c7088ebc818325fe5896d33b done
#10 naming to docker.io/afekeng/flask-app:25 done
#10 DONE 0.1s
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
+ docker tag afekeng/flask-app:25 afekeng/flask-app:latest
+ docker push afekeng/flask-app:25
The push refers to repository [docker.io/afekeng/flask-app]
cbe627d32fd2: Preparing
1954c61f3b42: Preparing
66ab607848a7: Preparing
9dce74420273: Preparing
45330a5b1c3c: Preparing
d47d2d755fc4: Preparing
f669ce2634c5: Preparing
b72242dc7fb0: Preparing
fbb12b2180e7: Preparing
7aabebb55065: Preparing
cb9eb84282d0: Preparing
d47d2d755fc4: Waiting
b72242dc7fb0: Waiting
fbb12b2180e7: Waiting
7aabebb55065: Waiting
cb9eb84282d0: Waiting
f669ce2634c5: Waiting
45330a5b1c3c: Layer already exists
1954c61f3b42: Layer already exists
9dce74420273: Layer already exists
66ab607848a7: Layer already exists
d47d2d755fc4: Layer already exists
f669ce2634c5: Layer already exists
b72242dc7fb0: Layer already exists
fbb12b2180e7: Layer already exists
7aabebb55065: Layer already exists
cb9eb84282d0: Layer already exists
cbe627d32fd2: Pushed
25: digest: sha256:a3eb31fb89746f50f9a1ad74367eba659f8645085b8c226d926b04d00ca731b0 size: 2629
+ docker push afekeng/flask-app:latest
The push refers to repository [docker.io/afekeng/flask-app]
cbe627d32fd2: Preparing
1954c61f3b42: Preparing
66ab607848a7: Preparing
9dce74420273: Preparing
45330a5b1c3c: Preparing
d47d2d755fc4: Preparing
f669ce2634c5: Preparing
b72242dc7fb0: Preparing
fbb12b2180e7: Preparing
7aabebb55065: Preparing
cb9eb84282d0: Preparing
f669ce2634c5: Waiting
b72242dc7fb0: Waiting
fbb12b2180e7: Waiting
7aabebb55065: Waiting
cb9eb84282d0: Waiting
d47d2d755fc4: Waiting
45330a5b1c3c: Layer already exists
9dce74420273: Layer already exists
1954c61f3b42: Layer already exists
cbe627d32fd2: Layer already exists
66ab607848a7: Layer already exists
d47d2d755fc4: Layer already exists
f669ce2634c5: Layer already exists
b72242dc7fb0: Layer already exists
fbb12b2180e7: Layer already exists
7aabebb55065: Layer already exists
cb9eb84282d0: Layer already exists
latest: digest: sha256:a3eb31fb89746f50f9a1ad74367eba659f8645085b8c226d926b04d00ca731b0 size: 2629
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Get Docker Image Created Date)
[Pipeline] sh
+ docker inspect -f {{.Created}} afekeng/flask-app:25
2025-08-19T10:33:00.716272169Z
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Cleanup Images)
[Pipeline] sh
+ docker rmi afekeng/flask-app:25
Untagged: afekeng/flask-app:25
+ docker rmi afekeng/flask-app:latest
Untagged: afekeng/flask-app:latest
Untagged: afekeng/flask-app@sha256:a3eb31fb89746f50f9a1ad74367eba659f8645085b8c226d926b04d00ca731b0
Deleted: sha256:e4053acab98a9f0d11b29fab2e08bd0d72dbb603c7088ebc818325fe5896d33b
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] echo
Cleaning up Docker system
[Pipeline] sh
+ docker container prune -f
Total reclaimed space: 0B
+ docker image prune -af --filter until=168h
Total reclaimed space: 0B
[Pipeline] echo
Pipeline done.
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: <empty>, teamDomain: jenkinsdockerproject, channel: #flask_app, color: <empty>, botUser: false, tokenCredentialId: slack, notifyCommitters: false, iconEmoji: <empty>, username: <empty>, timestamp: <empty>
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS





# Problems Encountered and How They Were Solved:
The main challenge I faced in the project was dealing with topics that were not covered during the course.
Throughout the work, I had to deepen my knowledge in areas such as Docker integration,
managing credentials within Docker, and connecting to the pipeline using a user and password.
I acquired this knowledge independently by relying on official documentation,
conducting research online, and continuously learning from various resources.