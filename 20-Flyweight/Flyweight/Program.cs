using System;

namespace Flyweight
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            var a = Stamp.Get('a');
            var a2 = Stamp.Get('a');
            var b = Stamp.Get('b');

            Console.WriteLine(a == a2);
            Console.WriteLine(a == b);
        }
    }
}
