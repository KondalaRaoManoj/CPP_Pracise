#include <iostream>
#include <cstdio> // For popen()
#include <memory>
#include <array>
//#include <DBMS_Close.h>
//#include <DBMS_Init.h>
#include <GUI/GUI_View.h>
using namespace std;

int local_count ;
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
int main(int argc, char **argv) 
{

   int gui_return;
   local_count = 5;
   //write_extern();
   //ext_size();
   //ext_variablecheck();
   //ext_time();
   //ext_structexample();

   GUI_View GUI_Win;

   gui_return=GUI_Win.GUI_MainWindow(argc,argv);

   //extern_classpractise1();   
   //extern_classpractise2(); 
   //extern_classpracprivate();
   //extern_classpracprotected();   
   //extern_classconstructorpractise();
   //extern_classparamconstruc();
   //extern_classdestructor1();  


   return gui_return; 
}
