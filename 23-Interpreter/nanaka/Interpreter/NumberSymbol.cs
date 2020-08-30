using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Interpreter
{
    public class NumberSymbol : Symbol
    {
        public override int Perse(IEnumerable<string> context)
        {
            if (context.Count() != 1)
                throw new InvalidOperationException("NumberSymbol");
            return Convert.ToInt32(context.First());
        }
    }
}
