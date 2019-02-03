@/* Forge 2.x Script */ ;
@/* Generates the draft of the application */ ;

clear ;
export ACCEPT_DEFAULTS=true ;
track-changes ;

@/* ========================== */;
@/* == Creating the project == */;
@/* ========================== */;

project-new --named pluralsight-persistence --topLevelPackage com.pluralsight.persistence.module07 --type war --finalName module07 ;


@/* ============================= */;
@/* == Creating Business Model == */;
@/* ============================= */;

@/* Language */;
java-new-enum --named Language --targetPackage com.pluralsight.persistence.module07.model ;
java-new-enum-const ENGLISH ;
java-new-enum-const FRENCH ;
java-new-enum-const SPANISH ;
java-new-enum-const PORTUGUESE ;
java-new-enum-const RUSSIAN ;


@/* Artist */;
jpa-new-mapped-superclass --named Artist ;
jpa-new-field --named firstName --length 50 ;
jpa-new-field --named lastName --length 50 ;
jpa-new-field --named bio --length 5000 ;
jpa-new-field --named dateOfBirth --type java.util.Date --temporalType DATE ;
jpa-new-field --named age --type java.lang.Integer ;

constraint-add --onProperty firstName --constraint NotNull ;
constraint-add --onProperty firstName --constraint Size --min 2 --max 50 ;
constraint-add --onProperty lastName --constraint NotNull ;
constraint-add --onProperty lastName --constraint Size --min 2 --max 50 ;
constraint-add --onProperty bio --constraint Size --max 5000 ;
constraint-add --onProperty dateOfBirth --constraint Past ;

@/* Author */;
jpa-new-entity --named Author ;
jpa-new-field --named preferredLanguage --type com.pluralsight.persistence.module07.model.Language ;

@/* Musician */;
jpa-new-entity --named Musician ;
jpa-new-field --named preferredInstrument ;

@/* Publisher */;
jpa-new-entity --named Publisher ;
jpa-new-field --named name --length 30 ;

constraint-add --onProperty name --constraint NotNull ;
constraint-add --onProperty name --constraint Size --max 30 ;

@/* Item */;
jpa-new-entity --named Item ;
jpa-new-field --named title --length 30 ;
jpa-new-field --named description --length 3000 ;
jpa-new-field --named unitCost --type java.lang.Float ;

constraint-add --onProperty title --constraint NotNull ;
constraint-add --onProperty title --constraint Size --min 1 --max 30 ;
constraint-add --onProperty description --constraint Size --min 1 --max 3000 ;
constraint-add --onProperty unitCost --constraint Min --value 1 ;

@/* Book */;
jpa-new-entity --named Book ;
jpa-new-field --named isbn --length 15 ;
jpa-new-field --named nbOfPage --type java.lang.Integer ;
jpa-new-field --named publicationDate --type java.util.Date --temporalType DATE ;
jpa-new-field --named language --type com.pluralsight.persistence.module07.model.Language ;
jpa-new-field --named authors --type com.pluralsight.persistence.module07.model.Author --relationshipType One-to-Many ;
jpa-new-field --named publisher --type com.pluralsight.persistence.module07.model.Publisher --relationshipType Many-to-One ;

constraint-add --onProperty isbn --constraint NotNull ;
constraint-add --onProperty isbn --constraint Size --max 15 ;
constraint-add --onProperty nbOfPage --constraint Min --value 1 ;

@/* CD */;
jpa-new-entity --named CD ;
jpa-new-field --named totalDuration --type java.lang.Float ;
jpa-new-field --named musicCompany ;
jpa-new-field --named genre ;
jpa-new-field --named musicians --type com.pluralsight.persistence.module07.model.Musician --relationshipType Many-to-Many ;

@/* Musician */;
cd ../Musician.java ;
jpa-new-field --named cds --type com.pluralsight.persistence.module07.model.CD --relationshipType Many-to-Many ;

@/* ===================== */;
@/* == Setting up REST == */;
@/* ===================== */;

rest-setup ;


@/* ============================= */;
@/* == Creating REST endpoints == */;
@/* ============================= */;

rest-generate-endpoints-from-entities --targets com.pluralsight.persistence.module07.model.Author com.pluralsight.persistence.module07.model.Book com.pluralsight.persistence.module07.model.CD com.pluralsight.persistence.module07.model.Musician com.pluralsight.persistence.module07.model.Publisher ;


@/* ==================== */;
@/* == Setting up JSF == */;
@/* ==================== */;

scaffold-setup ;

@/* Generate the UI for all the @Entities */ ;
scaffold-generate --targets com.pluralsight.persistence.module07.model.Author com.pluralsight.persistence.module07.model.Book com.pluralsight.persistence.module07.model.CD com.pluralsight.persistence.module07.model.Musician com.pluralsight.persistence.module07.model.Publisher ;


@/* =========================== */;
@/* == Cleaning Dependencies == */;
@/* =========================== */;

project-remove-dependencies org.hibernate.javax.persistence:hibernate-jpa-2.1-api:jar:: ;
project-remove-dependencies javax.validation:validation-api:jar:: ;
project-remove-dependencies org.jboss.spec.javax.servlet:jboss-servlet-api_3.0_spec:jar:: ;
project-remove-dependencies javax.ejb:javax.ejb-api:jar:: ;
project-remove-dependencies javax.ws.rs:javax.ws.rs-api:jar:: ;
project-remove-dependencies javax.enterprise:cdi-api:jar:: ;
project-remove-dependencies javax.annotation:jsr250-api:jar:: ;
project-remove-dependencies javax.inject:javax.inject:jar:: ;
project-remove-dependencies org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.1_spec:jar:: ;
project-remove-dependencies javax.faces:javax.faces-api:jar:: ;

project-remove-managed-dependencies org.hibernate.javax.persistence:hibernate-jpa-2.1-api:jar::1.0.0.Draft-16 ;
project-remove-managed-dependencies javax.ws.rs:javax.ws.rs-api:jar::2.0 ;
project-remove-managed-dependencies javax.ejb:javax.ejb-api:jar::3.2 ;
project-remove-managed-dependencies javax.enterprise:cdi-api:jar::[1.1,1.2) ;
project-remove-managed-dependencies javax.annotation:jsr250-api:jar::1.0 ;
project-remove-managed-dependencies org.jboss.spec:jboss-javaee-6.0:pom::3.0.2.Final ;
project-remove-managed-dependencies javax.faces:javax.faces-api:jar::2.2 ;

project-add-managed-dependencies javax:javaee-api:7.0:provided ;
project-add-dependencies javax:javaee-api:: ;

project-add-managed-dependencies org.primefaces:primefaces:4.0 ;
project-add-dependencies org.primefaces:primefaces:: ;

project-add-managed-dependencies org.webjars:bootstrap:3.1.0 ;
project-add-dependencies org.webjars:bootstrap:: ;

project-add-managed-dependencies org.webjars:jquery:2.1.0 ;
project-add-dependencies org.webjars:jquery:: ;

project-add-repository --named primefaces-repo --url http://repository.primefaces.org ;












