using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Interpreter
{
    public class MultipleSymbol : Symbol
    {
        /// <summary>
        /// 1 * 1 * 2 * 3
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override int Perse(IEnumerable<string> context)
        {
            Queue<string> contextQueue = new Queue<string>(context);

            var leftNum = new NumberSymbol();
            var res = leftNum.Perse(new List<string>() { contextQueue.Dequeue() });

            while (contextQueue.Count > 0)
            {
                switch (contextQueue.Dequeue())
                {
                    case "*":
                        var rightNum = new NumberSymbol();
                        res *= rightNum.Perse(new List<string>() { contextQueue.Dequeue() });
                        break;
                    case "/":
                        var rightNum2 = new NumberSymbol();
                        res /= rightNum2.Perse(new List<string>() { contextQueue.Dequeue() });
                        break;
                    default:
                        throw new InvalidOperationException("MultipleSymbol");
                }

            }

            return res;
        }
    }
}
