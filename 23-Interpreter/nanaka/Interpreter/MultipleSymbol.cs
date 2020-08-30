using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Interpreter
{
    public class MultipleSymbol : Symbol
    {
        public override int Perse(IEnumerable<string> context)
        {
            Queue<string> contextQueue = new Queue<string>(context);

            // * or / の左側の数字をintに変換
            var leftNum = new NumberSymbol();
            var res = leftNum.Perse(new List<string>() { contextQueue.Dequeue() });

            while (contextQueue.Count > 0)
            {
                switch (contextQueue.Dequeue())
                {
                    // 右側の数字をintに変換し、左側の数字と乗除計算
                    case "*":
                        var rightNum = new NumberSymbol();
                        res *= rightNum.Perse(new List<string>() { contextQueue.Dequeue() });
                        break;
                    case "/":
                        var rightNum2 = new NumberSymbol();
                        res /= rightNum2.Perse(new List<string>() { contextQueue.Dequeue() });
                        break;
                    // * or / 以外であればExceptonを投げる
                    default:
                        throw new InvalidOperationException("MultipleSymbol");
                }

            }

            return res;
        }
    }
}
