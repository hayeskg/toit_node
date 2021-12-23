main:
  while:  
    time := Time.now.local
      print "Time: $(%02d time.h):$(%02d time.m)"
      print "Date: $(%04d time.year)-$(%02d time.month)-$(%02d time.day)"

