using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    class Student : IVisitor
    {

        public void visit(Tokyo tokyo)
        {
            Console.WriteLine("東京だ！人がたくさん！");

        }

        public void visit(Kyoto kyoto)
        {
            Console.WriteLine("京都に来たよ！舞妓さんがいとをかし～");

        }

        public void visit(Hakata hakata)
        {
            Console.WriteLine("博多にやってきた！もつ鍋が楽しみだ！");

        }

        public void visit(Hokkaido hokkaido)
        {
            Console.WriteLine("北海道に着いた！涼しくて気持ちいい！");

        }
    }
}
