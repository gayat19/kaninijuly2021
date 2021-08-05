using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArrayApplication
{
    class Employee
    {
        //int Id;
        //string Name;
        //double Salary;
        public int Id { get; set; }
        public string Name { get; set; }
        public double Salary { get; set; }
        //default empty constructor
        public Employee()
        {

        }
        public void DoWork()
        {
            Console.WriteLine("Work work work. "+Name);
        }
        public void GetPaid()
        {
            Console.WriteLine("Get paid a salary of Rs. "+Salary);
        }
    }
}
