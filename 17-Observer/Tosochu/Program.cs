using System;

namespace Tosochu
{
    class Program
    {
        static void Main(string[] args)
        {
            GameMaster gm = new GameMaster();
            // Observerのインスタンス生成時にSubjectも渡す
            Runner sato = new Runner("佐藤", gm);
            Runner suzuki = new Runner("鈴木", gm);
            Runner tanaka = new Runner("田中", gm);

            tanaka.CaughtByHunter("ギャー");
            sato.CaughtByHunter("マジかよ...");
        }
    }
}
