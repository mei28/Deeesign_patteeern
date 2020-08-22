#include <bits/stdc++.h>
#include "TextManager.h"
#include "Memento.h"

using namespace std;

void TextManager::registerText()
{

    // 登録するときのフラグ
    bool registerFlg = true;
    string input_line;

    while (registerFlg)
    {
        cout << "登録するテキストを入力してください" << endl;
        cout << ">>";
        cin >> input_line;
        cout << endl;
        if (input_line == "")
        {
            cout << "入力してね！" << endl;
        }
        else
        {
            // textPool追加する
            textPool.push_back(input_line);
            registText = input_line;
            cout << "テキスト: " + input_line + " を登録したぞ！" << endl;
            registerFlg = false;
        }
    }
}

void TextManager::displayText()
{
    cout << "=====登録した内容=====" << endl;
    for (auto itr : textPool)
    {
        // 一個ずつ取り出したitrを出力
        cout << itr << endl;
    }
    cout << "======================" << endl;
}

Memento *TextManager::createMemento()
{
    // Mementoを作るよ
    return new Memento(textPool);
}

void TextManager::undo(Memento *memento)
{
    // 
    textPool = memento->_text;
    redoFlag = true;
    cout << "Undoをしたよ" << endl;
}

void TextManager::redo()
{
    if (redoFlag)
    {
        // 追加する．
        textPool.push_back(registText);
        registText = "";
        redoFlag = false;
        cout << "Redoした" << endl;
    }
    else
    {
        cout << "Redoできなかった！" << endl;
    }
}