#include <iostream>
using namespace std;
 
class Box {
   protected:
      double width;
};
 
class SmallBox:Box { // SmallBox is the derived class.
   public:
      void setSmallWidth( double wid );
      double getSmallWidth( void );
};
 
// Member functions of child class
double SmallBox::getSmallWidth(void) {
   return width ;
}
 
void SmallBox::setSmallWidth( double wid ) {
   width = wid;
}
 
// Main function for the program
void extern_classpracprotected() {
   SmallBox box;
 
   // set box width using member function
   box.setSmallWidth(5.0);
   cout << "Width of box : "<< box.getSmallWidth() << endl;
 

}