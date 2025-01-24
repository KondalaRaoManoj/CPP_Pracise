#include <iostream>
int count ;
extern void write_extern();
extern void ext_size();
extern void ext_variablecheck();
extern void ext_time();
extern void ext_structexample();
extern void extern_classpractise1();
extern void extern_classpractise2();
extern void extern_classpracprivate();
extern void extern_classpracprotected();
extern void extern_classconstructorpractise();
//extern void extern_classparamconstruc();
//extern void extern_classdestructor1();
int main() 
{
   count = 5;
   write_extern();
   ext_size();
   ext_variablecheck();
   ext_time();
   ext_structexample();
   //extern_classpractise1();   
   //extern_classpractise2(); 
   //extern_classpracprivate();
   //extern_classpracprotected();   
   //extern_classconstructorpractise();
   //extern_classparamconstruc();
   //extern_classdestructor1();  
   return 1; 
}
