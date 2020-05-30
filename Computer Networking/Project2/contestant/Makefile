JFLAGS = -g
JC = javac
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

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




default: all

all: contestant

contestant:$(CONTESTANTCLIENT:.java=.class)

clean:
	$(RM) *.class

