using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    abstract class Site
    {
        public abstract void Accept(IVisitor visitor);

    }
}
