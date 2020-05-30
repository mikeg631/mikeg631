JFLAGS = -g
JC = javac
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = \
		AnswerResponse.java \
		AppendRequest.java \
		AppendResponse.java \
        BadResponse.java \
        BeginRequest.java \
        BeginResponse.java \
		Contest.java		\
		ContestantClient.java \
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
	ContestantClient.java \
	ContestmeisterClient.java \
	RunServer.java \

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


CONTESTANTCLIENT = \
		AnswerResponse.java \
		ContestOver.java	\
	NicknameRequest.java \
	NicknameResponse.java \
	Request.java \
	Response.java \
	SendAnswer.java \
	SendQuestion.java \
	Question.java \
	ContestantClient.java \


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

all::
	+$(MAKE) -C contestant
	+$(MAKE) -C contestmeister
	+$(MAKE) -C server

contestant:$(MAKE) -C contestant

cserver:$(MAKE) -C server

contestmeister:$(MAKE) -C contestmeister

clean:
	+$(MAKE) -C contestant clean
	+$(MAKE) -C contestmeister clean
	+$(MAKE) -C server clean

