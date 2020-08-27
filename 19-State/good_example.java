interface State {
    public String morningGreet();
    public String getProtectionForCold();
}

class BadMoodState implements State {
    public String morningGreet() {
        return "おお";
    }
    public String getProtectionForCold() {
        return "寒いけど防寒めんどいから何もしないわ";
    }
}

class OrdinaryState implements State {
    public String morningGreet() {
        return "おっす！";
    }
    public String getProtectionForCold() {
        return "寒いから走るか〜";
    }
}

//追加箇所はここだけでOK!
class GoodState implements State{
    public String morningGreet() {
        return "おはよー！超元気！！！！！！！！！！";
    }
    public String getProtectionForCold() {
        return "寒いけど元気！防寒いらない！！";
    }
}

public class StatePatternYumichan {
    private State state = null;
 
    private void changeState(State state) {
        this.state = state;
    }
 
    public String morningGreet() {
        return this.state.morningGreet();
    }

    public String getProtectionForCold() {
        return this.state.getProtectionForCold();
    }
}


