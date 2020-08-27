#include <bits/stdc++.h>
#include "Memento.h"
#include "TextManager.h"

using namespace std;

int main()
{
    TextManager *tm = new TextManager();
    string input;
    bool processFlg = true;
    Memento *memento = tm->createMemento();

    while (processFlg)
    {
        cout << "どの処理を行いますか?" << endl;
        cout << "[t]: テキスト登録, [d]: テキスト表示, [u]Undo, [r]Redo, [e]終了" << endl;
        cin >> input;
        if (input == "t")
        {
            cout << "テキスト登録をするよ" << endl;
            memento = tm->createMemento();
            tm->registerText();
        }
        else if (input == "d")
        {
            cout << "テキスト表示を行います" << endl;
            tm->displayText();
        }
        else if (input == "u")
        {
            tm->undo(memento);
        }
        else if (input == "r")
        {
            tm->redo();
        }
        else if(input=="e")
        {
            processFlg = false;
            cout << "終了するね!" << endl;
        }
        else cout<<"入力おかしくない??"<< endl;
    }
    return 0;
}