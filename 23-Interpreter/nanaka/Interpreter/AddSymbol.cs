using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Interpreter
{
    public class AddSymbol : Symbol
    {
        public override int Perse(IEnumerable<string> context)
        {
            Queue<string> contextQueue = new Queue<string>(context);
            // 式の終わりを示すやつ
            contextQueue.Enqueue("\\");

            // 最初の + の前の数字を処理する
            var res = ParseMultiSymbol(contextQueue);

            //  + 数字 の部分を処理する
            while (contextQueue.Count > 0)
            {
                // AddSymbolはMutipleSymbolの足し合わせで表現できる
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
                    // キューの先頭を見る(除去しない)
                    var word = contextQueue.Peek();
                    switch (word)
                    {
                        case "+":
                        case "-":
                        // 足し合わせのところでデキューするのでここではreturnするだけ
                            var symbol = new MultipleSymbol();
                            return symbol.Perse(queue);
                        // キューが空になるので繰り返し終了
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
