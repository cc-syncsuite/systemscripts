#include <stdio.h>
#include <unistd.h>

int main() {
	char *argv[]  = {"reboot", 0} ;
	execve("/sbin/halt", argv, NULL) ;
}
