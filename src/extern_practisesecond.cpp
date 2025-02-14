#include <iostream>

extern int local_count;

void write_extern(void) {
   std::cout << "Count is " << local_count << std::endl;
}