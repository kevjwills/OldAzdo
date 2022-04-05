using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Decisions
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
            Console.Write("Bob's Big Giveaway");
            Console.Write("Choose a door: 1, 2, 3: ");
            string userValue = Console.ReadLine();
            
            if(userValue == "1")
            {
                string message = "You won a new car!";
                Console.WriteLine(message);
            }
            else if (userValue == "2")
            {
                string message = "You won a new boat!";
                Console.WriteLine(message);
            }

            else if (userValue == "3")
            {
                string message = "You won a new cat!";
                Console.WriteLine(message);
            }


            else
            {
                Console.WriteLine("we didn't understand");
              }

            Console.ReadLine();*/
            Console.Write("Bob's Big Giveaway");
            Console.Write("Choose a door: 1, 2, 3: ");
            string userValue = Console.ReadLine();

            string message = (userValue == "1") ? "boat" : "strand of lint";
            Console.WriteLine("{0} and {1}", message, userValue);
            //Console.Write("You won a ");
            Console.ReadLine();
            

        }
    }
}
