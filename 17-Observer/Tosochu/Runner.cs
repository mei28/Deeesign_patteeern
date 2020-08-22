using System;

namespace Tosochu
{
    /// <summary>
    /// 逃走者
    /// 各逃走者はゲームマスタを観察することで，他の逃走者の様子をメッセージ通知の形で知ることができる
    /// </summary>
    class Runner : Observer
    {
        public Runner(string name, Subject observable)
        {
            _name = name;
            _observable = observable;
            // インスタンス生成時に自分自身を観察者一覧に追加してもらう
            _observable.AddObserver(this);
        }

        /// <summary>
        /// ハンターに捕まった
        /// </summary>
        /// <param name="message">捕まったときの嘆き</param>
        public void CaughtByHunter(string message)
        {
            // 嘆く
            Console.WriteLine(_name + "> " + message);
            // 自分自身は観察者一覧から抜ける
            _observable.RemoveObserver(this);
            // ゲームマスタに報告
            Report();
        }

        /// <summary>
        /// ゲームマスタに報告する
        /// </summary>
        public override void Report()
        {
            _observable.NotifyObservers(_name + "が捕まりました");
        }

        /// <summary>
        /// 自分の状態を更新する
        /// 逃走者の持ってる通信端末の状態を更新するイメージ
        /// Subjectクラスから呼ばれる
        /// </summary>
        /// <param name="message">受け取った通知メッセージ</param>
        public override void Update(string message)
        {
            Console.WriteLine(_name + "> [" + message + "]");
        }
    }
}
