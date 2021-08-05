using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArrayApplication
{
    class UnderstandingStatic
    {
        int num1;
        static int snum1;
        UnderstandingStatic()
        {
            num1++;
            snum1++;
        }
        void PrintNumbers()
        {
            Console.WriteLine("The value of teh instance number is "+num1);
            Console.WriteLine("The value of static number is " + snum1); ;
        }
        
        static void Main(string[] args)
        {
            UnderstandingStatic obj1 = new UnderstandingStatic();
            obj1.PrintNumbers();
            UnderstandingStatic obj2 = new UnderstandingStatic();
            obj2.PrintNumbers();
            Console.ReadKey();
        }
    }
}
