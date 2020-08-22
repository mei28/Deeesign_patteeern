namespace Tosochu
{
    /// <summary>
    /// 観察者
    /// </summary>
    abstract class Observer
    {
        // 観察者の名前
        protected string _name;

        // 観察対象
        protected Subject _observable;

        /// <summary>
        /// 観察対象に通知する
        /// </summary>
        public abstract void Report();

        /// <summary>
        /// 観察者の状態を更新する
        /// </summary>
        /// <param name="message">観察対象から送信される通知メッセージ</param>
        public abstract void Update(string message);
    }
}
