using System;
using System.Collections.Generic;
using System.Text;

namespace Flyweight
{
    public class Stamp
    {
        char type;

        private Stamp(char type)
        {
            this.type = type;
        }

        public void Print()
        {
            Console.WriteLine(this.type);
        }

        // 生成済みインスタンスの一覧
        static Dictionary<char, Stamp> cache = new Dictionary<char, Stamp>();

        //　インスタンス生成のためのメソッド
        public static Stamp Get(char type)
        {
            if (!cache.ContainsKey(type))
                cache.Add(type, new Stamp(type));
            return cache[type];
        }
    }
}
