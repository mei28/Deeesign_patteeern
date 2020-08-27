using System.Collections.Generic;

namespace Tosochu
{
    /// <summary>
    /// 観察対象
    /// </summary>
    class Subject
    {
        // 観察者の一覧
        protected List<Observer> observers;

        /// <summary>
        /// 観察者を一覧に追加する
        /// </summary>
        /// <param name="observer">観察者</param>
        public void AddObserver(Observer observer)
        {
            observers.Add(observer);
        }

        /// <summary>
        /// 観察者を一覧から削除する
        /// </summary>
        /// <param name="observer">観察者</param>
        public void RemoveObserver(Observer observer)
        {
            observers.Remove(observer);
        }

        /// <summary>
        /// 観察者全員に通知する
        /// </summary>
        /// <param name="message">通知メッセージ</param>
        public void NotifyObservers(string message) {
            foreach (Observer observer in observers)
            {
                observer.Update(message);
            }
        }
    }
}
