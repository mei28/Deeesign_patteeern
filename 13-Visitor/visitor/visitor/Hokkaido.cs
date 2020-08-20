using System;
using System.Collections.Generic;
using System.Text;

namespace visitor
{
    // 北海道クラス
    class Hokkaido : Site
    {
        public override void Accept(IVisitor visitor)
        {
            Console.WriteLine("************北海道************");
            Console.WriteLine("");

            visitor.visit(this);
            Console.WriteLine("ﾏｲ ﾈｰﾑ ｲｽﾞ ｸﾗｰｸ. ﾎﾞｰｲｽﾞ ﾋﾞｰ ｱﾝﾋﾞｬｽ!");
            Console.WriteLine("ｵﾐﾔｹﾞﾆ ｻｯﾎﾟﾛﾉｳｶﾞｯｺｳｸｯｷｰ ﾄﾞｳｿﾞ");
            Console.WriteLine("");
        }
    }
}
