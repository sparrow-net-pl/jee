#WebSphere Liberty Profile pom.xml Builder
This application is a simple command line tool that will create two POM files for installation into a Maven repository.  The first POM file automates the installation of all of the libraries provided by the Liberty Profile and the second POM is used to add these libraries to a Maven project.

More information can be found here:
<http://tglawles-jee.blogspot.com/2014/11/using-eclipse-luna-and-maven-with.html> 

##Getting the code
To get the code, clone the following repository:
<https://github.com/tglawless/jee.git>

##Building the JAR
To build the executable JAR file, run the following command from the project root directory:
```
cd CLONE_DIR/jee/was-pom-builder
mvn clean install
```

##Running the Tool
The tool is run using the following command:
```
java -jar was_pom_builder-VERSION.jar WLP_VERSION WLP_INSTALL_DIR
```
where VERSION is the version of the JAR file being executed, WLP_VERSION is the installed version of the Liberty profile and WLP_INSTALL_DIR is the root directory of the installation itself.  WLP_VERSION can contain a list of versions comma separated.  This is useful when installing aliases.  For example:
```
java -jar was_pom_builder-1.0.0.jar 8.5.5.3,LATEST /opt/IBM/WebSphere/Liberty
```

##Installing the POM Files into Maven
The result of running the command in the previous section will be four POM files:

*   was_installer_8.5.5.3.pom
*   was_development_8.5.5.3.pom
*   was_installer_LATEST.pom
*   was_development_LATEST.pom

The **was_installer_8.5.5.3.pom** and **was_installer_LATEST.pom** POM files install all of the individual JAR files packaged with the Liberty Profile.  To execute this POM file, run the following command:
```
mvn install -f was_installer_8.5.5.3.pom
mvn install -f was_installer_LATEST.pom
```

The **was_development_8.5.5.3.pom** and **was_development_LATEST.pom** POM files can be used within Eclipse (or any Maven project) to pull all of the Liberty Profile dependencies into a project.  This POM must also be installed using the command below:
```
mvn install -f was_development_8.5.5.3.pom
mvn install -f was_development_LATEST.pom
```

##Using the POM files
Once the POM files have been generated and installed into the Maven repository, they can be included into a Maven project using the following dependency:
```XML
<dependency>
	<groupId>com.ibm.tools.target</groupId>
	<artifactId>was-liberty</artifactId>
	<version>LATEST</version>
	<type>pom</type>
	<scope>provided</scope>
</dependency>
```
**Note:  If using the maven archetypes provided by IBM for LLiberty, this dependency will be added to the project automatically.

**Note:  if using a Liberty version other then v8.5.5.3, replace 8.5.5.3 in the instructions above with the appropriate value.**
