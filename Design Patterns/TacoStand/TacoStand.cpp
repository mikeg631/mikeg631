#include "TacoStand.h"

int main()
{
    OrderCounter* counter = new OrderCounter(); // Making OrderCounter
        while(true) // loop indefinitely
        {
        std::cout << "Would you like to order? (1 for yes, anything other integer for no)" << std::endl;
        int d;
        std::cin >> d;

        if(d != 1)
        {
            break;// break if condition not met effectively ending the ordering process
        }
        TexMex* meal = counter->serveCustomer();//Serving the customer and getting the requested object
        meal->printOrder();//prints out food
        delete meal;//clean up memory
        }
        std::cout << "Have a nice day!" << std::endl;
    delete counter;//clean up
}