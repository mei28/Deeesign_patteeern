public class Yumichan {
    private static final int STATE_ORDINARY = 0;    /** 通常の状態を表す */
    private static final int STATE_IN_BAD_MOOD = 1;     /** 機嫌の悪い状態を表す */
    private static final int STATE_IN_GOOD_MOOD = 2 /**機嫌の良い状態を追加**/
    private int state = -1;
 
    public void changeState(int state) {
        this.state = state;
    }

     public String morningGreet() {
        if (state == STATE_ORDINARY) {
            return "おっす!";
        } else if (state == STATE_IN_BAD_MOOD) {
            return "何か用？";
        } else if (state == STATE_IN_GOOD_MOOD){
              return "おはよー！超元気！！！！！！！！！！";
        } else {
            return "・・・";
        }
    }
 
    public String getProtectionForCold() {
        if (state == STATE_ORDINARY) {
            return "寒いから走るか〜";
        } else if (state == STATE_IN_BAD_MOOD) {
            return "寒いけど防寒めんどくさいから何もしないわ";
         } else if (state == STATE_IN_GOOD_MOOD){
             return "寒いけど元気！！！！防寒いらない！！！！！！";
        } else {
            return "・・・";
        }
    }
}
