package army;

import army.superClasse.Warrior;

public class Swordman extends Warrior {

    int atk = 100;
    int def = 80;
    int health = 700;
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
