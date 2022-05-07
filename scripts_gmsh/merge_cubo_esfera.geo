a=3; //Arista del cubo
b=a/2;
d=1; //Diametro esfera
r=d/2;


Point(2001) = {b, b, b, 1.0};
Point(2002) = {b, b, -b, 1.0};
Point(2003) = {-b, b, b, 1};
Point(2004) = {b, -b, b, 1};
Point(2005) = {b, -b, -b, 1};
Point(2006) = {-b, b, -b, 1};
Point(2007) = {-b, -b, b, 1};
Point(2008) = {-b, -b, -b, 1};
Line(2001) = {2001, 2004};
Line(2002) = {2004, 2005};
Line(2003) = {2005, 2002};
Line(2004) = {2002, 2001};
Line(2005) = {2001, 2003};
Line(2006) = {2004, 2007};
Line(2007) = {2005, 2008};
Line(2008) = {2002, 2006};
Line(2009) = {2006, 2003};
Line(2010) = {2003, 2007};
Line(2011) = {2007, 2008};
Line(2012) = {2008, 2006};
Line Loop(2013) = {2002, 2007, -2011, -2006};
Plane Surface(2014) = {2013};
Line Loop(2015) = {2005, 2010, -2006, -2001};
Plane Surface(2016) = {2015};
Line Loop(2017) = {2012, -2008, -2003, 2007};
Plane Surface(2018) = {2017};
Line Loop(2019) = {2004, 2001, 2002, 2003};
Plane Surface(2020) = {2019};
Line Loop(2021) = {2011, 2012, 2009, 2010};
Plane Surface(2022) = {2021};
Line Loop(2023) = {2004, 2005, -2009, -2008};
Plane Surface(2024) = {2023};

Point(1001) = {r, 0, 0, 1};
Point(1002) = {0, r, 0, 1};
Point(1003) = {-r,0, 0, 1};
Point(1004) = {0, -r, 0, 1};
Point(1005) = {0, 0, r, 1};
Point(1006) = {0, 0, -r, 1};
Point(1007) = {0, 0, 0, 1};

Circle(1001) = {1006, 1007, 1002};
Circle(1002) = {1002, 1007, 1005};
Circle(1003) = {1005, 1007, 1004};
Circle(1004) = {1004, 1007, 1006};
Circle(1005) = {1002, 1007, 1001};
Circle(1006) = {1001, 1007, 1004};
Circle(1007) = {1002, 1007, 1003};
Circle(1008) = {1004, 1007, 1003};
Circle(1009) = {1005, 1007, 1001};
Circle(1010) = {1006, 1007, 1001};
Circle(1011) = {1006, 1007, 1003};
Circle(1012) = {1003, 1007, 1005};
Line Loop(1013) = {1009, 1006, -1003};
Ruled Surface(1014) = {1013};
Line Loop(1015) = {1009, -1005, 1002};
Ruled Surface(1016) = {1015};
Line Loop(1017) = {1005, -1010, 1001};
Ruled Surface(1018) = {1017};
Line Loop(1019) = {1010, 1006, 1004};
Ruled Surface(1020) = {1019};
Line Loop(1021) = {1002, -1012, -1007};
Ruled Surface(1022) = {1021};
Line Loop(1023) = {1012, 1003, 1008};
Ruled Surface(1024) = {1023};
Line Loop(1025) = {1004, 1011, -1008};
Ruled Surface(1026) = {1025};
Line Loop(1027) = {1001, 1007, -1011};
Ruled Surface(1028) = {1027};

//Volumen
Surface Loop(2025) = {2024, 2020, 2016, 2022, 2014, 2018};
Surface Loop(2026) = {1016, 1014, 1020, 1018, 1028, 1022, 1024, 1026};
Volume(2027) = {2025, 2026};

//Para que se ignore el valor de la malla en los puntos
Field[1] = MathEval;
Field[1].F = "0.1*(x^2+y^2+z^2)";
Background Field = 1;


//Physical surfaces
Physical Surface(2030) = {2024};
Physical Surface(2031) = {2018};
Physical Surface(2032) = {2016};
Physical Surface(2033) = {2022};
Physical Surface(2034) = {2020};
Physical Surface(2035) = {2014};
Physical Surface(2036) = {1028, 1018, 1016, 1022, 1026, 1024, 1014, 1020};
Physical Volume(2037) = {2027};
