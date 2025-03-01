#include "GUI_View.h"




GUI_View:: GUI_View()
{

}
GUI_View:: ~GUI_View()
{
    
}


int GUI_View:: GUI_MainWindow(int GUI_View_argc,char **GUI_View_argv) {

    QApplication app (GUI_View_argc, GUI_View_argv);
    //QPushButton button ("Hello world !");
    //button.show();
    MainWindow w;
    w.show();


    return app.exec();
    //return 0;
 }
