using System;
using System.Collections.Generic;
using System.Text;

namespace Interpreter
{
    public abstract class Symbol
    {
        public virtual int Perse(IEnumerable<string> context)
        {
            throw new NotImplementedException();
        }
    }
}
