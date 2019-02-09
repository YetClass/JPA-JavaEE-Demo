# Module 07: JPA 2.2 Within Java EE 8

In this module the author shows how Java Persistence API 2.2 is integrated with Java EE 8. Persistence becomes easier and more transparent for developers because the Java EE container automates most of the persistent and transactional tasks.

## Code 

The code of this module follows the [Maven](http://maven.apache.org/) directory structure. The `src/main/` directory contains the main source code while you will find the test class under `src/test/`. The `pom.xml` and `assembly.xml` files are Maven specific describes the project and its dependencies.

Once [Maven](http://maven.apache.org/), [H2 Database](http://www.h2database.com) and a [JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html) are installed and the database is up and running, enter the following Maven commands:

* `mvn help:help` : shows Maven help
* `mvn clean`     : cleans the `target` directory
* `mvn compile`   : compiles the code
* `mvn test`      : runs the test case (make sure the H2 database is up and running)
* `mvn exec:java` : executes the main class

## Demo 

This module contains the web application that was used during all the demos. The structure of the application is:

* Under the `src/main/java` directory:
* The `model` package contains all the entities of our business model (`Artist`, `Item`...)
* The `rest` package contains the REST endpoints
* The `view` package contains the JSF backing beans

* Under the `src/main/resources` directory you will find the `persistence.xml` configuration file for JPA as well as the `insert.sql` file that loads data into the database

* Under the `src/main/webapp` directory you will find the Web resources
* The `resources` directory contains the Facelets template and the CSS styles and favicon
* The `WEB-INF` directory contains the `web.xml`, `beans.xml`, `faces-config.xml` file

To run the demo you will need to package the application into a War file by running the Maven command `mvn clean package`. Then, make sure you are a [H2 database](http://www.h2database.com) and a [Wildfly](http://wildfly.org) up and running. Deploy the war file and go to the URL [http://localhost:8080/module07/]().


*To execute the `Main` classes, compile the code first using `mvn compile` and then use the `mvn exec:java` Maven goal. But make sure to choose the appropriate `Main` class in the `pom.xml` under the `exec-maven-plugin` configuration.*
