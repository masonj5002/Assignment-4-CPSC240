// Author information
// Author name: Mason Jennings
// Author email: masonj@csu.fullerton.edu
#include <stdio.h>
#include <string.h>

extern const char* executive();

int main(int argc, char* argv[]) {

    printf("Welcome to Randsom Products, LLC.\n");
    printf("This software is maintained by Alfred Finkelstein\n");

    const char* return_code = "NULL";
    return_code = executive();

    printf("%s\n", return_code);
    printf("The program will now end.\n");

    printf("Oh, %s. We hope you enjoyed your arrays. Do come again.\n", return_code);
    printf("A zero will now be returned to the operating system\n");
    return 0;

} // end of program