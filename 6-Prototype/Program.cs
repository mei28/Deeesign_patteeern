using System;

namespace prototype
{
    class Program
    {

        static void Main(string[] args)
        {
            // ******prototypeパターンの説明******

            //三角形に切った紙を作る
            Paper triangle = new Paper("三角形");

            //三角形の頂点の座標
            triangle.Vertexes.Add((0.5f, 0f).ToTuple());
            triangle.Vertexes.Add((1f, 1f).ToTuple());
            triangle.Vertexes.Add((0f, 1f).ToTuple());

            //三角形の紙に合わせて新しい紙を切る
            Paper deepCopy_triangle = (Paper)triangle.Clone();
            deepCopy_triangle.Name = "深いコピーの三角形";

            //オリジナルの三角形とコピーの三角形の名前と頂点数を確認
            Console.WriteLine($"名前: {triangle.Name} 頂点の数: {triangle.Vertexes.Count}");
            Console.WriteLine($"名前: {deepCopy_triangle.Name} 頂点の数: {deepCopy_triangle.Vertexes.Count}");

            Console.WriteLine("");
            Console.WriteLine("");

            //角をひとつ増やして、四角形にする
            deepCopy_triangle.Vertexes.Add((-0.5f, 0f).ToTuple());

            //オリジナルの三角形とコピーの三角形の名前と頂点数を再度確認
            Console.WriteLine($"名前: {triangle.Name} 頂点の数: {triangle.Vertexes.Count}");
            Console.WriteLine($"名前: {deepCopy_triangle.Name} 頂点の数: {deepCopy_triangle.Vertexes.Count}");

            Console.WriteLine("");
            Console.WriteLine("*******");
            Console.WriteLine("");

            // ******深いコピーと浅いコピーの説明******

            //代入して新しい三角形を作る
            Paper shallowCopy_triangle = triangle;
            shallowCopy_triangle.Name = "浅いコピーの三角形";

            //角をふたつ増やして、五角形にする
            shallowCopy_triangle.Vertexes.Add((-0.4f, 0f).ToTuple());
            shallowCopy_triangle.Vertexes.Add((-0.2f, 0f).ToTuple());

            //オリジナルの三角形とコピーの三角形の名前と頂点数を確認
            Console.WriteLine($"名前: {triangle.Name} 頂点の数: {triangle.Vertexes.Count}");
            Console.WriteLine($"名前: {shallowCopy_triangle.Name} 頂点の数: {shallowCopy_triangle.Vertexes.Count}");
        }
    }
}
