// Abstraction
//機能のクラス階層の最上位クラス
import GreetImpl from "./GreetImpl";

export default class Greet {
    // クラス変数を定義
    private impl: GreetImpl;

    //橋(Impl)を受け取る
    constructor(tmp_impl: GreetImpl) {
        this.impl = tmp_impl;
    }

    start(): void {
        this.impl.start();
    }

    print(): void {
        this.impl.print();
    }

    end(): void {
        this.impl.end();
    }

    display(): void {
        this.start();
        this.print();
        this.end();
    }
}