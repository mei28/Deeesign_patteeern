using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    interface IVisitor
    {
        // Acceptorクラスの数だけ、Visitorクラスが必ずVisitメソッドを持つように
        void visit(Tokyo tokyo);
        void visit(Kyoto kyoto);
        void visit(Hakata hakata);
        void visit(Hokkaido hokkaido);
    }
}
