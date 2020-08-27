using System;
using System.Collections.Generic;

namespace Tosochu
{
    /// <summary>
    /// 逃走者がこのゲームマスタを観察する
    /// ゲームマスタが逃走者全員に通知する
    /// </summary>
    class GameMaster : Subject
    {
        public GameMaster()
        {
            observers = new List<Observer>();
        }
    }
}
