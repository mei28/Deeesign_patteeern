using System;

namespace Interpreter
{
    class Program
    {
        static void Main(string[] args)
        {
            var test = new AddSymbol();
            try
            {
                Console.WriteLine(test.Perse("2 * 3 + 4 * 5 * 6".Split(" ")));
                Console.WriteLine(test.Perse("6 / 3 - 4".Split(" ")));
                Console.WriteLine(test.Perse("6 / 3 ? 2".Split(" ")));
            }
            // Exceptionが返ってきたらエラー文を表示
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
