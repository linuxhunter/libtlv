CC ?= gcc
CFLAGS  := -Wall

OBJS = tlv_box.o key_list.o
LIB = libtlv.so

all : $(LIB)

%.o : %.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

$(LIB) : $(OBJS)
	rm -f $@
	$(CC) -shared -o $@ $(OBJS)
	rm -f $(OBJS)

clean:
	rm -f $(OBJS) $(LIB)
