// ConcreteImplementor
// 実装のクラス階層のクラス
import GreetImpl from "./GreetImpl";

export default class ChatGreetImpl extends GreetImpl {
    constructor(message: string) {
        // 親(GreetImpl)のconstructorを呼び出す。
        super(message);
    }
    //以下具体的な実装内容
    start(): void {
        this.printLine();
    }
    print(): void {
        console.log(this.message);
    }
    end(): void {
        this.printLine();
    }
    private printLine(): void {
        const messageCount: number = this.message.length;
        let line: string = '';
        for (let i: number = 0; i < messageCount; i++) {
            line += '-';
        }
        console.log(line);
    }
}