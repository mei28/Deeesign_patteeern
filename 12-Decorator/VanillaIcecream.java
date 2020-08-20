public interface Icecream{
    public String getName();
    public String howSweet();
}

public class VanillaIcecream implements Icecream{
    public String getName(){
        return "バニラアイスクリーム";
    }
    public String howSweet(){
        return "バニラ味";
    }
}