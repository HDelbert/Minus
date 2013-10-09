.PHONY:all clean

MAINSRC = Main.cpp

SRC += \
	$(MAINSRC) \
	controller/Controller.cpp \
	model/Mines.cpp

#include controller/Mines.mk

INCLUDEDIR += \
	-I"." \
	-I"controller/" \
	-I"model/" \
	-I"ui/"

OPT = -O3
INCLUDE = $(INCLUDEDIR)

CC = g++ $(OPT) -Wall
LIBS = -lm

RM = rm -rf
MKDIR = mkdir

OUTDIR = out
DIRS += $(OUTDIR) \
		$(OUTDIR)/ui \
		$(OUTDIR)/controller \
		$(OUTDIR)/model

EXE = $(OUTDIR)/Mines

OBJS = $(SRC:.cpp=.o)
OBJS := $(addprefix $(OUTDIR)/,$(OBJS))

all: $(DIRS) $(EXE)

$(DIRS):
	$(MKDIR) $@

$(EXE): $(OBJS)
	$(CC) -o $@ $^ $(LIBS)

$(OUTDIR)/%.o:%.cpp
	$(CC) $(INCLUDE) -o $@ -c $^

clean:
	$(RM) $(OUTDIR)
