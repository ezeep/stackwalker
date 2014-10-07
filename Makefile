BREAKPAD_SRCDIR := ./stackwalk/src
BREAKPAD_OBJDIR := ./stackwalk
BREAKPAD_LIBS := \
  $(BREAKPAD_OBJDIR)/lib/libbreakpad.a \
  $(BREAKPAD_OBJDIR)/lib/libdisasm.a \
  $(NULL)

JSON_DIR := jsoncpp-src-0.5.0
JSON_SRCDIR := $(JSON_DIR)/src/lib_json
JSON_INCLUDEDIR := $(JSON_DIR)/include

BIN := stackwalker

all: $(BIN)

OBJS := \
  json_reader.o \
  json_value.o \
  json_writer.o \
  $(NULL)

VPATH += $(JSON_SRCDIR)
CXXFLAGS += -I$(JSON_INCLUDEDIR) -std=gnu++0x -Wno-format -Werror

$(BIN): $(BIN).cc $(BREAKPAD_LIBS) $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $< $(BREAKPAD_LIBS) $(OBJS) -I$(BREAKPAD_SRCDIR)

breakpad:
	PREFIX=`pwd`/stackwalk/ SKIP_TAR=1 ./scripts/build-breakpad.sh

clean:
	$(RM) $(BIN) *.o
	rm -rf $(BREAKPAD_OBJDIR)
	rm -rf ./exploitable

clean-deps:
	rm -rf google-breakpad
