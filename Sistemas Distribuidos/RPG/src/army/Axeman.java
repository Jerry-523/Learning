package army;
import army.superClasse.Warrior;

public class Axeman extends Warrior {

    private int atk = 150;
    private int def = 100;

    private int health = 600;

    public int attack() {
        return this.atk;
    }

    public int defense() {
        return this.def;
    }
    public int fail_defense(int attk){
        health = this.health - attk;
        return this.health - attk;
    }
    public int gethealth(){
        return this.health;
    }

}
