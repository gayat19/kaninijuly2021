using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstSimpleConsoleApplication
{
    class Calculator
    {
    
        static void PrintMenu()
        {
            string myOperator;
            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine("Please enter a operation + - / * ");
                myOperator = Console.ReadLine();
                switch (myOperator)
                {
                    case "+":
                        Add();
                        break;
                    case "-":
                        Subract();
                        break;
                    case "*":
                        Mutlipy();
                        break;
                    case "/":
                        Divide();
                        break;
                    default:
                        Console.WriteLine("Invalid Entry");
                        break;
                }
            }
        }

        private static void Divide()
        {
            Console.WriteLine("Divide called");
        }

        private static void Add()
        {
            Console.WriteLine("Add called");
        }

        private static void Mutlipy()
        {
            Console.WriteLine("Multiply called");
        }

        private static void Subract()
        {
            Console.WriteLine("Sunbract called");
        }

        static void UnderstandingIteration()
        {
            //init;condition;modification
            for (int i = 1; i <= 10; i++)
            {
                Console.WriteLine(i);
            }
        }
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to my Calculator");
            PrintMenu();
            //UnderstandingIteration();
            Console.ReadKey();
        }
    }
}
