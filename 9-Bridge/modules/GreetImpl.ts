// Implementor
// 実装のクラス階層の最上位クラス
export default abstract class GreetImpl {
    // protected : 継承クラス内でのみ参照可能
    protected message: string;

    constructor(message: string) {
        this.message = message;
    }
    // abstract : 子クラスに実装を任せる。
    abstract start(): void;
    abstract print(): void;
    abstract end(): void;
}