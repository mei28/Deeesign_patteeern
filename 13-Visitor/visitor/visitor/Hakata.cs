using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    // 博多クラス
    class Hakata : Site
    {
        public override void Accept(IVisitor visitor)
        {
            Console.WriteLine("************博多************");
            Console.WriteLine("");

            visitor.visit(this);
            Console.WriteLine("よぉきんしゃったね！");
            Console.WriteLine("「通りもん」ばり美味か～、とっとーと！");
            Console.WriteLine("");
        }
    }
}
