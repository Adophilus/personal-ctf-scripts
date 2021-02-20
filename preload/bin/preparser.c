#include <stdio.h>
#include <limits.h>
#include <string.h>

void processStdin () {
	char buf[LINE_MAX];
	fgets(buf, sizeof(buf), stdin);
	puts("this is the buffer: ");
	puts(buf);
	puts("and this the template: template");
	fflush(stdin);
}

int main () {
	// processStdin();
	while (1) processStdin();
	return 0;
}