// Author information
// Author name: Mason Jennings
// Author email: masonj@csu.fullerton.edu

int sort(int len, unsigned long int *array) {
    // sort
    for (int i = 0; i < len; i++)
    {
        for (int j = i; j < len; j++)
        {
            if (array[j] < array[i])
            {
                unsigned long int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }

    return 0;
}