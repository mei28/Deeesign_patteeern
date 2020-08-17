// RefinedAbstraction
// 機能のクラス階層(機能を追加する形で形成されるクラス階層)
// Greetクラスのサブクラス
import Greet from "./Greet";
import GreetImpl from "./GreetImpl";

export default class RepeatGreet extends Greet {
    constructor(impl: GreetImpl) {
        super(impl);
    }

    // Greet クラスに機能を追加。
    repeatDisplay(): void {
        this.start();
        this.print();
        this.print();
        this.end();
    }
}