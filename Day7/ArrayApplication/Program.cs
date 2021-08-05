using System;

namespace ArrayApplication
{
    class Program
    {
        static void UnderstandingDoWhile()
        {
            int num = 0;
            int sum=0, count = 0;
            do
            {
                Console.WriteLine("Please enter a number");
                num = Convert.ToInt32(Console.ReadLine());
                if(num>0 && num%7==0)
                {
                    sum += num;
                    count++;
                }
            } while (num>0);
            Console.WriteLine("The average of numbers divisible by 7 is {0}",(sum/count));
        }
        static void Main(string[] args)
        {
            UnderstandingDoWhile();
            Console.ReadKey();
        }
    }
}
