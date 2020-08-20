using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    class Kyoto : Site
    {
        public override void Accept(IVisitor visitor)
        {
            Console.WriteLine("************京都************");
            Console.WriteLine("");

            visitor.visit(this);
            Console.WriteLine("おいでやすー");
            Console.WriteLine("お土産に「八つ橋」いかがどすか～？");
            Console.WriteLine("");
        }
    }
}
