#include <iostream>
int count ;
extern void write_extern();
extern void ext_size();
extern void ext_variablecheck();
extern void ext_time();
extern void ext_structexample();

main() {
   count = 5;
   write_extern();
   ext_size();
   ext_variablecheck();
}