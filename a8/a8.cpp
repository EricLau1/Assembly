#include <iostream>

using namespace std;

extern "C" int GetValorASM(int a);

int main(){

  cout << "Assembly enviou o valor: " << GetValorASM(10) << endl;

  return 0;
}
