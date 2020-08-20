using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    // 東京クラス
    class Tokyo : Site
    {
        public override void Accept(IVisitor visitor)
        {
            Console.WriteLine("************東京************");
            Console.WriteLine("");

            visitor.visit(this);
            Console.WriteLine("僕はハチ公！東京にようこそだワン！");
            Console.WriteLine("お土産に「東京ばなな」をどうぞだワン！");
            Console.WriteLine("");
        }
    }
}
