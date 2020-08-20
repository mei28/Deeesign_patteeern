using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    //観光地をまとめたクラス
    abstract class Site
    {
        // Acceptorクラスが必ずAcceptメソッドを持つように
        public abstract void Accept(IVisitor visitor);

    }
}
