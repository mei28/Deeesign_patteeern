#include <bits/stdc++.h>
#include "Memento.h"
using namespace std;

class TextManager
{
public:
    // テキストの保存するvector
    vector<string> textPool;
    // 登録するstring
    string registText = "";
    // redoするかflag
    bool redoFlag = true;
    // registTextを登録する記録
    void registerText();
    // 登録したstringを表示する
    void displayText();
    // メメントインスタンスを生成する．
    Memento *createMemento();
    // mementoを用いてundoする．
    // mementoの利点
    void undo(Memento *memento);
    // redoをする
    void redo();
};