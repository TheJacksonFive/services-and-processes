#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>

sig_atomic_t sig = 1;

void handler(int number){
	sig = 0;
}

void spawn(char *program, char **argumentos, char **argumentos2){
	pid_t child;
	child = fork();
	if(child){
		execvp(program, argumentos2);
		return;
	}else
		execvp(program, argumentos);
	fprintf(stderr, "ERROR\n");
	sig = 0;
	abort();
}


int main(int argc, char *argv[]){

	FILE *f;
	char* lista[] = {"cat", ">" , argv[1], "Estefania", "Federico", "YO", "Alejandro", "Maria", NULL};

	char* nombres[] = {"cat", ">>", argv[1], "David", "David2", "David3", "David4", "David5", "David6", "David7", "David8", "David9", "David10"};

	struct sigaction sa;
	memset(&sa, 0, sizeof(sa));
	sa.sa_handler = &handler;

	sigaction(SIGCHLD, &sa, NULL);
	spawn("cat", lista, nombres);

	if(sig == 0){
		f = fopen(argv[1], "r");
		fprintf(stdout, argv[1]);
	}	

	return EXIT_SUCCESS;
}
