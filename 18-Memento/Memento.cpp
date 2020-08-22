#include <bits/stdc++.h>
#include "Memento.h"
using namespace std;

Memento::Memento(vector<string> text)
{
    // 直近のテキストを保持する．
    // 現在の状態を保存 → Mementoのいいところ
    _text = text;
}