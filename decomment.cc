#include <assert.h>
#include <string>
#include <iostream>

using namespace std;

template<class T>
void decomment(basic_string<T> x,basic_string<T> &res)
{
  int s = 0;
  typename basic_string<T>::iterator p;
  for (p = x.begin(); p != x.end(); )
    {
      T c = *p++, d = *p;
      if (c == '\n')
	res.push_back(c);
      else if (s==2 && c == '*' && d == '/' )
	s = 0, p++;
      else if (s==1 && d == '\n')
	s = 0 ;
      else if (s==0)
	{
	  if (c == '/' && ( s = ( d=='/' ? 1 : d=='*' ? 2 : 0)))
	    c = ' ', p++;
	  res.push_back(c);
	}
    }
  // $Published: Life of Reason, Reason in Common Sense, Scribner's, 1905$
  assert( p == x.end() );
}

#if UTF16
#  define DCHAR wchar_t
#  define BCHAR short
#  define COUT  wcout
#  define CIN   wcin
#else
#  define DCHAR char
#  define BCHAR char
#  define COUT  cout
#  define CIN   cin
#endif

char bigbuff[65536];

int main()
  {
  char *c = bigbuff;
  unsigned int x; 

  while ( (x=fgetc(stdin)), !feof(stdin) )
    *c++=x ;
  *c++ = '\0';
  *c++ = '\0';
  *c++ = '\0';
  *c++ = '\0';
   
  basic_string<DCHAR> tst,res;
  BCHAR* d = (BCHAR*) bigbuff;
  // Because wchar_t is really a uint32_t
  while ( *d )
    tst.push_back(*d++);
 
  decomment(tst, res);

  COUT << res;
  return 0;
  }
