#include<iostream>

using namespace std;

void adicao();
void subtracao();
void multiplicacao();
void divisao();

int main() {

    system("clear");
    int i, x;

    cout << "\t###########################\n" << 
            "\t###       [ MENU ]      ###\n" << 
            "\t###########################\n" << 
            "\t# 1- [   Adicao         ] #\n" << 
            "\t# 2- [   Subtracao      ] #\n" << 
            "\t# 3- [   Multiplicacao  ] #\n" << 
            "\t# 4- [   Divisao        ] #\n" <<
            "\t###########################\n" << 
            "\t => Choose: ";
    while(true){
        cin >> x;
        if (x == 1) {
            adicao();
        }else if (x == 2) {
            subtracao();
        }else if (x == 3) {
            multiplicacao();
        }else if (x == 4) {
            divisao();
        }else {
            main();
        }

    }
}

void subtracao(){
    system("clear");
    float a, b, result, x;
    cout << "\t###########################\n" << 
            "\t###    [ Subtracao ]    ###\n" << 
            "\t###########################\n" <<
            "\t => Insira o numero 1: ";
    cin >> a;
    cout << "\t => Insira o numero 2: ";
    cin >> b;
    result = a - b;
    system("clear");
    cout << "\t###########################\n" << 
            "\t###    [ Subtracao ]    ###\n" << 
            "\t###########################\n";
    cout << "\t => RESULTADO: " << result << endl;
    cout << "\t [1] => Again" << endl;
    cout << "\t [0] => Go to menu" << endl;
    cout << "\t Choose: ";
    cin >> x;
    if (x == 1) {
        subtracao();
    } else {
        main();
    }
}

void adicao(){
    system("clear");
    float a, b, result, x;
    cout << "\t###########################\n" << 
            "\t###      [ Adicao ]     ###\n" << 
            "\t###########################\n" <<
            "\t => Insira o numero 1: ";
    cin >> a;
    cout << "\t => Insira o numero 2: ";
    cin >> b;
    result = a + b;
    system("clear");
    cout << "\t###########################\n" << 
            "\t###      [ Adicao ]     ###\n" << 
            "\t###########################\n";
    cout << "\t => RESULTADO: " << result << endl;
    cout << "\t [1] => Again" << endl;
    cout << "\t [0] => Go to menu" << endl;
    cout << "\t Choose: ";
    cin >> x;
    if (x == 1) {
        adicao();
    } else {
        main();
    }
}

void multiplicacao(){
    system("clear");
    float a, b, result, x;
    cout << "\t###########################\n" << 
            "\t###  [ Multiplicacao ]  ###\n" << 
            "\t###########################\n" <<
            "\t => Insira o numero 1: ";
    cin >> a;
    cout << "\t => Insira o numero 2: ";
    cin >> b;
    result = a * b;
    system("clear");
    cout << "\t###########################\n" << 
            "\t###  [ Multiplicacao ]  ###\n" << 
            "\t###########################\n";
    cout << "\t => RESULTADO: " << result << endl;
    cout << "\t [1] => Again" << endl;
    cout << "\t [0] => Go to menu" << endl;
    cout << "\t Choose: ";
    cin >> x;
    if (x == 1) {
        multiplicacao();
    } else {
        main();
    }
}

void divisao(){
    system("clear");
    float a, b, result, x;
    cout << "\t###########################\n" << 
            "\t###     [ Divisao ]     ###\n" << 
            "\t###########################\n" <<
            "\t => Insira o divisor: ";
    cin >> a;
    cout << "\t => Insira o quociente: ";
    cin >> b;
    result = a / b;
    system("clear");
    cout << "\t###########################\n" << 
            "\t###     [ Divisao ]     ###\n" << 
            "\t###########################\n";
    cout << "\t => RESULTADO: " << result << endl;
    cout << "\t [1] => Again" << endl;
    cout << "\t [0] => Go to menu" << endl;
    cout << "\t Choose: ";
    cin >> x;
    if (x == 1) {
        divisao();
    } else {
        main();
    }
}
