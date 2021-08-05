using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArrayApplication
{
    class UnderstandingArray
    {
        void UseSimpleArray()
        {
            int[] arr1 = { 123, 43, 6456, 57, 56, 344, 3, 2, 54645, 64 };
            Array.Sort(arr1);
            for (int i = 0; i < arr1.Length; i++)
            {
                Console.WriteLine(arr1[i]);
            }
            AnotherMethod();
            //int[] arr = new int[3];
            //Console.WriteLine("The size of the array is "+arr.Length);
            //arr[0] = 100;
            ////Console.WriteLine(arr[0]);
            //for (int i = 0; i < arr.Length; i++)
            //{
            //    Console.WriteLine("Please enter a number");
            //    arr[i] = Convert.ToInt32(Console.ReadLine());
            //}

            //Console.WriteLine("The numbers are");
            //for (int i = 0; i < arr.Length; i++)
            //{
            //    Console.WriteLine(arr[i]);
            //}
        }
       public static void AnotherStaticMethod()
        {
            Console.WriteLine("Another static method");
        }
        void AnotherMethod()
        {
            AnotherStaticMethod();
            Console.WriteLine("Another Method");
        }
        static void Main(string[] args)
        {
            UnderstandingArray understandingArray = new UnderstandingArray();
            understandingArray.UseSimpleArray();
            understandingArray.AnotherMethod();
            //static method so direct call
            AnotherStaticMethod();
            Console.ReadKey();
        }
    }
}
