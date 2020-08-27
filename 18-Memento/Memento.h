#ifndef __MEMENTO_H__
#define __MEMENTO_H__
#include <bits/stdc++.h>

using namespace std;

class Memento
{
public:
    // 登録するtext
    vector<string> _text;
    // コンストラクトで保存を行う
    Memento(vector<string> _text);
};

#endif