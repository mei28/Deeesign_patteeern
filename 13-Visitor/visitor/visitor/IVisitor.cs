using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    interface IVisitor
    {
        void visit(Tokyo tokyo);
        void visit(Kyoto kyoto);
        void visit(Hakata hakata);
        void visit(Hokkaido hokkaido);
    }
}
