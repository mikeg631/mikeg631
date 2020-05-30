JFLAGS = -g
JC = javac
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java
	
SERVER = \
		AnswerResponse.java \
		AppendRequest.java \
		AppendResponse.java \
        BadResponse.java \
        BeginRequest.java \
        BeginResponse.java \
		Contest.java		\
		ContestantThread.java \
		ContestmeisterThread.java \
		ContestOver.java	\
	DeleteRequest.java \
	DeleteResponse.java \
	GetRequest.java \
	GetResponse.java \
	KillRequest.java \
	KillResponse.java \
	ListRequest.java \
	ListResponse.java \
	NicknameRequest.java \
	NicknameResponse.java \
	PutRequest.java \
	PutResponse.java \
	Request.java \
	Response.java \
	ReviewRequest.java \
	ReviewResponse.java \
	RunningContest.java \
	SetRequest.java \
	SetResponse.java \
	SendAnswer.java \
	SendQuestion.java \
	Server.java \
	QuestionStat.java \
	Question.java \
	RunServer.java \

default: all

all:$ cserver

cserver:$(SERVER:.java=.class)

clean:
	$(RM) *.class
