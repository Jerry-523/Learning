import army.Axeman;
import army.Spearman;
import army.Swordman;

import java.util.Scanner;

class main {
    public static void main(String[] args){
        int choose1;
        int choose2;
        Axeman axeman1 = new Axeman();
        Axeman axeman2 = new Axeman();
        Spearman spearman1 = new Spearman();
        Spearman spearman2 = new Spearman();
        Swordman swordsman1 = new Swordman();
        Swordman swordsman2 = new Swordman();
        Scanner input = new Scanner(System.in);
        System.out.println("Welcome to Arena\n");

        System.out.println("Choose a warrior [Player_1]:");
        System.out.println("\t1 - Swordsman;");
        System.out.println("\t2 - Spearman;");
        System.out.println("\t3 - Axeman;\n");
        System.out.print("Option: ");
        choose1 = input.nextInt();

        if (choose1 == 1){
            Swordman player1 = new Swordman();
            System.out.println("Swordsman ready!");
        } else if (choose1 == 2){
            Spearman player1 = new Spearman();
            System.out.println("Spearman ready!");
        } else if (choose1 == 3){
            Axeman player1 = new Axeman();
            System.out.println("Axeman ready!");
        }



        System.out.println("Choose a warrior [Player_2]:");
        System.out.println("\t1 - Swordsman;");
        System.out.println("\t2 - Spearman;");
        System.out.println("\t3 - Axeman;\n");
        System.out.print("Option: ");
        choose2 = input.nextInt();


        if (choose2 == 1){
            Swordman player2 = new Swordman();
            System.out.println("Swordsman ready!");
        } else if (choose2 == 2){
            Spearman player2 = new Spearman();
            System.out.println("Spearman ready!");
        } else if (choose2 == 3){
            Axeman player2 = new Axeman();
            System.out.println("Axeman ready!");
        }

        System.out.println("\n[WELCOME TO ARENA]\n");
        System.out.println("Round 1");
        System.out.println("Choose your movement...Player 1");
        System.out.println("\t[1] - Attack");
        System.out.println("\t[2] - Defend");
        System.out.print("Selected: ");
        choose1 = input.nextInt();
        System.out.println("Choose your movement...Player 2");
        System.out.println("\t[1] - Attack");
        System.out.println("\t[2] - Defend");
        System.out.print("Selected: ");
        choose2 = input.nextInt();


    }
}