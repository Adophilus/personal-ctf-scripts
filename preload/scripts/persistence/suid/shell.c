#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

struct Configuration {
	char *username;
	char *password;
};


int main () {
	struct Configuration Config;

	// Configuring the credentials
	Config.username = "adophilus";
	Config.password = "AdophilusBrian";

	char *username, *password;
	printf("username: ");
	scanf("%ms", &username);
	printf("password: ");
	scanf("%ms", &password);
	
	if ((strcmp(username, Config.username) == 0) && (strcmp(password, Config.password) == 0)) {
		puts("Username and password matched!");
		execl("/bin/bash", "bash", "-p", "-i", NULL);
	}
	else {
		puts("[LOG] Command server running on port range 10000 - 65535");
		puts("[LOG] Port knocking requred on ports 10, 20, 30, 40, 50, 60, ..., 5000");
		puts("[LOG] Hint: Read up the man pages of 'knockd' in order to port knock");
	}
	
	free(username);
	free(password);
	return 0;
}
