CC := gcc.exe
CFLAGS := -Wall -Wextra -Werror -Ilibusb
LDFLAGS := -Llibusb -lusb-1.0 -lWs2_32 -lmsvcrt

OBJS := src/main.o src/getopt.o src/stlink.o src/crypto.o tiny-AES-c/aes.o

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

stlink-tool: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

clean:
	del /f src\*.o
	del /f stlink-tool
