#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <pthread.h>
#include <signal.h>

void *funcion(void *hilo){
	char *convert;
	convert  = (char *) hilo;
	while(1){
		int r = rand() % 6;
		printf("%s comiendo...", convert);
		fflush(stdout);
		sleep(r); 
		printf("%s descansando...", convert);
		int r2 = rand() % 6;
		fflush(stdout);
		sleep(r2);
	}
}

int main(){

	pthread_t h1, h2, h3, h4;
	char *hilo1 = "hilo1";
	char *hilo2 = "hilo2";
	char *hilo3 = "hilo3";
	char *hilo4 = "hilo4";

	pthread_create(&h1, NULL, funcion, (void *) hilo1); 
	pthread_create(&h2, NULL, funcion, (void *) hilo2);
	pthread_create(&h3, NULL, funcion, (void *) hilo3);
	pthread_create(&h4, NULL, funcion, (void *) hilo4);
	pthread_join(h1, NULL);
	pthread_join(h2, NULL);
	pthread_join(h3, NULL);
	pthread_join(h4, NULL);
	return EXIT_SUCCESS;
}
