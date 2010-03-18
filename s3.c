#include <stdio.h>

int main() {
	system("/sbin/s3_h.sh") ;
	FILE *f = fopen("/sys/power/state", "w") ;
	fputs("disk", f) ;
	fclose(f) ;
	system("/sbin/s3_f.sh") ;
	return 0 ;
}
