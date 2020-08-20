using System;

namespace visitor
{
    class Program
    {
        static void Main(string[] args)
        {
            // Acceptorクラスのインスタンス
            Tokyo tokyo = new Tokyo();
            Kyoto kyoto = new Kyoto();
            Hakata hakata = new Hakata();
            Hokkaido hokkaido = new Hokkaido();
            
            // Visitorクラスのインスタンス
            Student student = new Student();
            Silver silver = new Silver();

            tokyo.Accept(student);
            kyoto.Accept(student);
            hakata.Accept(student);
            hokkaido.Accept(student);

            Console.WriteLine("");

            tokyo.Accept(silver);
            kyoto.Accept(silver);
            hakata.Accept(silver);
            hokkaido.Accept(silver);
        }
    }
}
