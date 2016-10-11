CC=gcc

SDL_CFLAGS = `sdl-config --cflags`
SDL_LIBS = `sdl-config --libs` -lSDL_mixer

CFLAGS=-ggdb -DENABLE_DEBUG -O2 -Wall $(SDL_CFLAGS)

OBJDIR = obj
SRCDIR = src
OUTDIR = build

SRCS= client.o common.o vm.o sprites.o decode.o animation.o \
	rooms.o render.o main.o music.o debug.o lzss.o sound.o \
	screen.o scale2x.o scale3x.o game2bin.o cd_iso.o scale800x480.o
OBJS = $(SRCS:.c=.o)

#INCLUDE= $(addprefix -I, $(SRCDIR))

all: $(OBJDIR) $(OUTDIR)/alien

$(OUTDIR)/alien: $(addprefix $(OBJDIR)/, $(OBJS))
	$(CC) $^ -o $@ $(SDL_LIBS)

$(OBJDIR):
	mkdir $(OBJDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -MMD -c $^ -o $@

clean:
	@rm -rf build/alien $(OBJDIR)
