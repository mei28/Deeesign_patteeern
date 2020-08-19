using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    class Silver : IVisitor
    {
        public void visit(Tokyo tokyo)
        {
            Console.WriteLine("東京じゃあ～！浅草寺が趣深いのぉ～");

        }

        public void visit(Kyoto kyoto)
        {
            Console.WriteLine("京都じゃよ！八つ橋がのどに詰まるんじゃあ…");

        }

        public void visit(Hakata hakata)
        {
            Console.WriteLine("博多じゃ。天神様にお参りじゃ～");

        }

        public void visit(Hokkaido hokkaido)
        {
            Console.WriteLine("北海道じゃぞ～、年寄りに優しい気温じゃの～");

        }
    }
}
