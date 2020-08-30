using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Interpreter
{
    public class AddSymbol : Symbol
    {
        /// <summary>
        /// 1 * 5 + 2 * 3
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override int Perse(IEnumerable<string> context)
        {
            Queue<string> contextQueue = new Queue<string>(context);
            contextQueue.Enqueue("\\");

            var res = ParseMultiSymbol(contextQueue);

            while (contextQueue.Count > 0)
            {
                switch (contextQueue.Dequeue())
                {
                    case "+":
                        res += ParseMultiSymbol(contextQueue);
                        break;
                    case "-":
                        res -= ParseMultiSymbol(contextQueue);
                        break;
                    default:
                        throw new InvalidOperationException("AddSymbol");
                }
            }

            return res;

            int ParseMultiSymbol(Queue<string> contextQueue)
            {
                Queue<string> queue = new Queue<string>();
                while (true)
                {
                    var word = contextQueue.Peek();
                    switch (word)
                    {
                        case "+":
                        case "-":
                            var symbol = new MultipleSymbol();
                            return symbol.Perse(queue);
                        case "\\":
                            contextQueue.Dequeue();
                            var symbol2 = new MultipleSymbol();
                            return symbol2.Perse(queue);
                        default:
                            contextQueue.Dequeue();
                            queue.Enqueue(word);
                            break;
                    }
                }
            }
        }
    }
}
