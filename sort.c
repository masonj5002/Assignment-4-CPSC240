// Author information
// Author name: Mason Jennings
// Author email: masonj@csu.fullerton.edu
#include <stdio.h>

int sort(int len, unsigned long int *array) {

    printf("\nHello from sort.c!!!!\n");
    printf("there are %d elements (random numbers) in the array\n", len);
    printf("\nThe first random number is 0x%016lx\n", array[0]);
    printf("The 2nd random number is 0x%016lx\n", array[1]);
    printf("The 3rd random number is 0x%016lx\n", array[2]);
    printf("The 4th random number is 0x%016lx\n", array[3]);

    //array[2] = 0;

    //printf("The 2nd random number is 0x%016lx", *(array+8));
    //make sure program can read array by displaying elements of the array first
    //then, make the sorting algorithm (bubble sort?)

    return 0;
}