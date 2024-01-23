#include <iostream>

using namespace std;

extern "C" int someThingFromASM(int x, int y, int z);

int main(){
    int x, y, z;

    cout << "Insira o primeiro numero: ";
    cin >> x;
    cout << "Insira o segundo numero: ";
    cin >> y;
    cout << "Insira o terceiro numero: ";
    cin >> z;

    //==============================================

    cout << "O resultado: " << someThingFromASM(x, y, z) << endl;

    return 0;
}