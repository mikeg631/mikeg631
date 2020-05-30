JFLAGS = -g
JC = javac
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

CONTESTMEISTERCLIENT = \
		AppendRequest.java \
		AppendResponse.java \
        BadResponse.java \
        BeginRequest.java \
        BeginResponse.java \
	DeleteRequest.java \
	DeleteResponse.java \
	GetRequest.java \
	GetResponse.java \
	KillRequest.java \
	KillResponse.java \
	ListRequest.java \
	ListResponse.java \
	PutRequest.java \
	PutResponse.java \
	Request.java \
	Response.java \
	ReviewRequest.java \
	ReviewResponse.java \
	SetRequest.java \
	SetResponse.java \
	Question.java \
	ContestmeisterClient.java \

default: all

all: contestmeister

contestmeister:$(CONTESTMEISTERCLIENT:.java=.class)

clean:
	$(RM) *.class

