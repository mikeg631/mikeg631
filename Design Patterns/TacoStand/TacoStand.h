#include <iostream>
#include <vector>
#include <string>
#include <stdio.h>
// Below is a helper print function 
std::string promptOptions(std::vector<std::string> options)
{
    while(true)
    {
        for(int i = 0; i < options.size(); i++)
            std::cout << i+1 << ". " + options.at(i) << std::endl;

        std::cout << "Enter the corresponding number please" << std::endl;
        int temp;
        std::cin >> temp;
            if(std::cin.fail())
            {
                std::cout << "Wrong input try again!!" << std::endl;
                std::cin.clear();
                std::cin.ignore(32767,'\n');
                continue;
            }
        if(temp > 0 && temp <= options.size())
            return options.at(temp-1);
        
        std::cout << "'Invalid input try again" << std::endl;

    }
};

//TexMex is the object to be built and servered by the StaffMember (director), TexMexBuilder
// helps choose the right recipe to build requested order
class TexMex
{
    public:
    std::string getBase()
    {
        return this->base;
    }
    std::string getSauce()
    {
        return this->sauce;
    }
    
    std::vector<std::string> getToppings()
    {
        return this->toppings;
    }

    void setBase(std::string base)
    {
        this->base = base;
    }
     void setSauce(std::string sauce)
    {
        this->sauce = sauce;
    }
     void setToppings(std::vector<std::string> toppings)
    {
        this->toppings = toppings;
    }

    void printOrder()
    {
        std::cout << "Here is your " + base + " that has the following toppings:";
        for(int i = 0; i < toppings.size(); i++)
        {
            std::cout << toppings.at(i) + " ,";
        }
        std::cout << " and is sauced up with " + sauce << std::endl;
    }
    private:
    std::string base;
    std::string sauce;
    std::vector<std::string> toppings;
};

//Abstract Builder
class TexMexBuilder
{
    public:
    TexMexBuilder()
    {
        texMex = new TexMex();
    }
    //Base is variable and must be choosen for any type of order, so this does not really change
    void buildBase(std::string base) 
    {
       texMex->setBase(base);
    }
    //There are preset toppings and sauces for the 3 main styles. Custom order prompts the user for input
    //so buildToppings() and build sauce is left for implementation 
    virtual void buildToppings() = 0;
    virtual void buildSauce() = 0;

    // allows for retrivial of the object   
    TexMex* getTexMex()
    {
        return texMex;
    }
    private:
    TexMex* texMex;
};

class BeefTexMexBuilder : public TexMexBuilder
{
public: 
BeefTexMexBuilder()
{
    texMex = TexMexBuilder::getTexMex();
}

void buildToppings()
{
    texMex->setToppings({"Beef","Lettuce", "Tomato"});
}

void buildSauce()
{
    texMex->setSauce("Sour cream");
}

private:
TexMex* texMex;
};

class ChickenTexMexBuilder : public TexMexBuilder
{
public: 
ChickenTexMexBuilder()
{
    texMex = TexMexBuilder::getTexMex();
}
//always same toppings
void buildToppings()
{
    texMex->setToppings({"Chicken","Lettuce", "Cheese"});
}
//always same sauce
void buildSauce()
{
    texMex->setSauce("Siracha");
}

private:
TexMex* texMex;
};


class TempehTexMexBuilder : public TexMexBuilder
{
public: 
TempehTexMexBuilder()
{
    texMex = TexMexBuilder::getTexMex();
}
//always the same toppings
void buildToppings()
{
    texMex->setToppings({"Tempeh","Lettuce", "Corn"});
}
//This builder always sets the same sauce
void buildSauce()
{
    texMex->setSauce("Habanero");
}

private:
TexMex* texMex;
};


class CustomTexMexBuilder : public TexMexBuilder
{
public: 
CustomTexMexBuilder()
{
    texMex = TexMexBuilder::getTexMex();
}
//Custom Order prompts for 3 toppings
void buildToppings()
{
    std::vector<std::string> toppings;
    std::vector<std::string> options = {"Beef", "Chicken", "Tempeh", "Lettuce", "Tomato", "Corn", "Cheese"};
    std::cout << "What is the first topping you would like? Our options include: " << std::endl;
    toppings.push_back(promptOptions(options));
    std::cout << "What is the second topping you would like? Our options include: " << std::endl;
    toppings.push_back(promptOptions(options));
    std::cout << "What is the third topping you would like? Our options include: " << std::endl;
    toppings.push_back(promptOptions(options));
    texMex->setToppings(toppings);
}

void buildSauce()
{
    std::cout << "What sauce would you like? Our options include: " << std::endl;
    texMex->setSauce(promptOptions({"Sour Cream","Siracha","Habenaro", "No sauce"}));
}


private:
TexMex* texMex;
};

//StaffMember is the director who will take orders and call the right builder to make the right object
class StaffMember
{
    public:
    TexMex* takeOrder()//Staff <
    {
        if(currentOrder != nullptr)//deleting last order if there is one
            delete currentOrder;
        bool notChosen = true;
        int d;
        // Here I prompt for the base as all orders need a base, custom or not.
        std::cout << "What base would you like? Our options are: " << std::endl;
        std::string tempBase = promptOptions({"Bowl","Burrito","Taco"});
        while(notChosen)
        {
            //Here the type of order is determined. This helps set the logic for which builder to use
        std::cout << "What would you like to order? Enter the corresponding number" << std::endl;
        std::cout << "1. Beef " + tempBase + "  with lettuce and tomato, topped with sour cream" << std::endl;
        std::cout << "2. Chicken " + tempBase + " with letttuce and cheese, topped with siracha" << std::endl;
        std::cout << "3. Tempeh " + tempBase + " with lettuce and corn, topped with habenaro" << std::endl;
        std::cout << "4. Custom " + tempBase << std::endl;
        std::cin >> d;
        if(std::cin.fail())
            {
                std::cout << "Wrong input try again!!" << std::endl;
                std::cin.clear();
                std::cin.ignore(32767,'\n');
                continue;
            }
        if(d > 0 && d < 5)
            notChosen = false;
        }
        if(d == 1)//choose builder type
            currentOrder = new BeefTexMexBuilder();
        else if(d == 2)
            currentOrder = new ChickenTexMexBuilder();
        else if(d == 3)
            currentOrder = new TempehTexMexBuilder();
        else if(d == 4)
            currentOrder = new CustomTexMexBuilder();
        
        //Director makes taco, code is the same regardless.
        this->currentOrder->buildBase(tempBase);
        this->currentOrder->buildToppings();
        this->currentOrder->buildSauce();
        return this->currentOrder->getTexMex();
    }

    ~StaffMember()
    {
        if(currentOrder != nullptr)// clean up
            delete currentOrder;
    }

    
    private:
    TexMexBuilder* currentOrder;
};
//OrderCounter is basically a singleton that contains the staff member who will make the order
class OrderCounter
{
    public:
    //orderCounter acts likr an N-singleton for the staff members
    OrderCounter()
    {
        staff = new StaffMember();//make singleton
    }

    TexMex* serveCustomer()
    {
        return staff->takeOrder();//make and take order
    
    }
    //clearing memory
    ~OrderCounter()
    {
        delete staff;
    }
    
    private:
    StaffMember* staff;
};
