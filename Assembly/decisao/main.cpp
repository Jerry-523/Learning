#include <iostream>

using namespace std;

// O retorno só pode ser um e o parametro pode ser varios
// EAX EDI
extern "C" int option1(int num1, int num2);
extern "C" int option2(int num1);

int main()
{
int num1, num2, op;
cout << "Introduza o primeiro número: ";
cin >> num1;
cout << "Introduza o segundo número: ";
cin >> num2;
cout << "Da decisão 1 obte-se o maior valor que é: " << option1(num1, num2) << endl;
// =========================================
cout << "Escolha uma opção entre 1,2,3: " << endl;
cin >> op;
cout << "Da decisão 2 obte-se o valor: " << option2(op) << endl;

return 0;
}
