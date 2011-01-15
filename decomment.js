function decomment(x)
  {
  var i = 0, s = 0, o = "";
  while (i < x.length)
    { 
    var c = x[i++], d = x[i];
    if ( c == "\n" )
      o += c;
    else if ( s==2 && c=="*" && d== '/' )
      s = 0, i++;
    else if ( s==1 && d == '\n' )
      s = 0;
    else if ( s==0 )
      {
      if ( c == "/" && (s={"/":1,"*":2}[d]|0))
        c = ' ', i++;
      o += c;
      }
    }
  return o; // @~ George Santayana
  }

print(decomment(arguments[0]));

