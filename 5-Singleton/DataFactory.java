public class DataFactory{
　//生成はここだけ！　privateなのもポイント！
    private static DataFactory dataFactory = new DataFactory();
    private DataFactory(){}
    public static DataFactory getInstance(){
　//これで返す！ここを介してしかアクセスできなくなる。
        return dataFactory;
    }
}

//使う時
dataFactory1 = DataFactory.getInstance()
dataFactory2 = DataFactory.getInstance()
