#include <malloc.h>
#include <stdlib.h>
int main()
{
  int array_length = 500000000;
  float *data;
  srand(time(0));
  data = malloc(array_length*sizeof(float));
  memset(data, 0xf0f0f0f0, sizeof(float)*array_length);
//  data = (float *) memalign (sizeof(float), array_length * sizeof (float));
//  
//	data[i] = rand();  
for(int i = 0; i < 100; i++)
  glamtest(data);
//  add_test(data);
  return 0;
}
