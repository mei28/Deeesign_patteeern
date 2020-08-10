using System;
using System.Collections.Generic;
using System.Text;

namespace prototype
{
    public class Paper : ICloneable
    {
        //コンストラクタ
        public Paper()
        {
            Vertexes = new List<Tuple<float, float>>();
        }

        //コンストラクタ
        public Paper(string name)
        {
            Name = name;
            Vertexes = new List<Tuple<float, float>>();
        }

        //頂点座標のタプルをリストにする
        public List<Tuple<float, float>> Vertexes { get; set; }

        public string Name { get; set; }

        //cloneメソッド
        public object Clone()
        {
            return new Paper(Name) { Vertexes = new List<Tuple<float, float>>(Vertexes) };
        }
    }
}
