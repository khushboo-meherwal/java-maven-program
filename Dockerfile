FROM maven

#Set the working directory for RUN and ADD commands
WORKDIR /code

#Copy the SRC, LIB and pom.xml to WORKDIR
ADD pom.xml /code/pom.xml
ADD src /code/src

#Build the code
RUN ["mvn", "clean"]
RUN ["mvn", "install"]

#Optional you can include commands to run test cases.

#Port the container listens on
EXPOSE 8081

#CMD to be executed when docker is run.
ENTRYPOINT ["java","-jar","target/jb-sonar-0.1.0.jar"]
