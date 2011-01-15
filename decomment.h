#include <assert.h>
#include <string>
using namespace std;

template<class T>
void decomment(basic_string<T> x,basic_string<T> &res)
  {
  int s = 0;
  typename basic_string<T>::iterator p;

  for (p = x.begin(); p != x.end(); )
    switch (s)
      { 
      case 2:
        if ( *p == '\n' )
          res.push_back(*p);
        if ( *p++ == '*' && *p == '/' )
          s = 0, p++;
        break;
      case 1:
        if ( *p == '\n')
          s = 0;
        else
          p++;
        break;
      default:
        T c = *p++;
        if (c == '/' && ( s = ( *p=='/' ? 1 : *p=='*' ? 2 : 0)))
          c = ' ', p++;
        res.push_back(c);
      }
  assert( p == x.end() );
  }

