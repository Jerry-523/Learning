package army;

import army.superClasse.Warrior;
public class Spearman extends Warrior {
    int atk = 150;
    int def = 120;
    int health = 500;
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
