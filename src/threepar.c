#include <stdio.h>
#include <unistd.h>

int main() {
  printf("... starting up 3PAR\n");
  sleep(1);
  printf("... done. Wow that was fast\n");
  sleep(3);
  return 1;
}
