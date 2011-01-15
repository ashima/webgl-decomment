function decomment(x)
  {
  var i = 0, s = 0, o = "";
  while (i < x.length)
    switch (s)
      {
      case 2:
        if ( x[i] == "\n" )
          o += x[i];
        if ( x[i++] == "*" && x[i] == "/" )
          s=0, i++;
        break;
      case 1:
        if ( x[i] == "\n" )
          s = 0;
        else
          i++;
        break;
      default:
        var c = x[i++];
        if ( c == "/" && (s={"/":1,"*":2}[x[i]]) )
          c = ' ', i++;
        o += c;
      }
  return o; // @~ George Santayana
  }

print(decomment(arguments[0]));