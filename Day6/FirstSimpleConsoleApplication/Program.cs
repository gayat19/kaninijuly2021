using System;

namespace FirstSimpleConsoleApplication
{
    class Program
    {
        static int _num1, _num2;
        static void TakeInputOfTwoNumbers()
        {
            Console.WriteLine("Please enter the first number");
            _num1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Please enter the second number");
            _num2 = Convert.ToInt32(Console.ReadLine());
        }
        static void FindTheGreatestOfTwoNumbers()
        {
            Console.WriteLine("Enter the numbers for finding the greatest");
            TakeInputOfTwoNumbers();
            if (_num1 == _num2)
                Console.WriteLine("The numbers are equal");
            else if(_num1>_num2)
                Console.WriteLine($"{_num1} is greater than {_num2}");
            else
                Console.WriteLine($"{_num2} is greater than {_num1}");
        }
        static void AddTwoNumbers()
        {
            Console.WriteLine("Enter the number for sum");
            TakeInputOfTwoNumbers();
            int sum = 0;
            sum = _num1 + _num2;
            // Console.WriteLine("The sum of {0} and {1} is {2}",num1,num2,sum);
            Console.WriteLine($"The sum of {_num1} and {_num2} is {sum}");
        }
        static void ProductOfTwoNumbers()
        {
            Console.WriteLine("Enter the number for finding the product");
            TakeInputOfTwoNumbers();
            int product = 0;
            product = _num1 * _num2;
            // Console.WriteLine("The product of {0} and {1} is {2}",num1,num2,sum);
            Console.WriteLine($"The product of {_num1} and {_num2} is {product}");
        }
        static void Main(string[] args)
        {
            FindTheGreatestOfTwoNumbers();
            AddTwoNumbers();
            ProductOfTwoNumbers();
            //AddTwoNumbers();
            /*Console.WriteLine("Hello World!");
            Console.WriteLine("This is a number {0} I want to to print", 20);
            string name = "C#";
            Console.WriteLine("Welcome to the {name} language");
            Console.WriteLine($"Welcome to the {name} language");*/

            Console.ReadKey();
        }
    }
}
