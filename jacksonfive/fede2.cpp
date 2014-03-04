#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <signal.h>

sig_atomic_t seguir = 1;

void requiem(int number){
	seguir = 0;
}

void spawn(char *argv[]){
	pid_t hijo = fork();
	if (hijo != 0)
		return;
	else
		execvp(argv[1], argv+1);
	fprintf(stderr, "ERROR\n");
	seguir = 0;
	abort();
}

int main(int argc, char *argv[]){
	struct sigaction sa;
	memset(&sa, 0, sizeof(sa));
	sa.sa_handler = &requiem;

	sigaction(SIGCHLD, &sa, NULL);
	spawn(argv);

	while(seguir)
		printf("1\n");

	if(seguir == 0){
	printf("SOY EL HIJO");
	}

	printf("3");

	return 0;	
}
