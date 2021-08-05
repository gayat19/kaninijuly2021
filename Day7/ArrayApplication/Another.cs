using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArrayApplication
{
    class Another
    {

        static void Main(string[] args)
        {
            Employee employee = new Employee();
            employee.Id = 101;
            employee.Name = "Ramu";
            employee.Salary = 123455.3;
            employee.DoWork();
            employee.GetPaid();

            Employee employee1 = new Employee();
            employee1.Id = 102;
            employee1.Name = "Somu";
            employee1.Salary = 12312423.34;
            employee1.DoWork();
            employee1.GetPaid();
            Employee employee2 = employee1;
            employee2.DoWork();
            employee1.Name = "Changed from employee1";
            employee2.DoWork();
            Console.WriteLine("Hello World!");
            UnderstandingArray.AnotherStaticMethod();
            Console.ReadKey();
        }
    }
}
