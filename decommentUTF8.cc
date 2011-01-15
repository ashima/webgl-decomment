#include <iostream>
#include <iterator>
#include <sstream>

#include "decomment.h"

using namespace std;

int main()
  {
  string tst1,res1;
  wstring tst2,res2;
  stringstream in;

  in << cin.rdbuf();
  tst1 = in.str();
  
  decomment(tst1, res1);
  //decomment(tst2, res2);

//  cout << tst1;
//  cout << endl  << "----becomes-------" << endl;
  cout << res1;
/*  cout << endl  << "----and-------" << endl;
  wcout << tst2;
  cout << endl  << "----becomes-------" << endl;
  wcout << res2;
*/
  return 0;
  }
