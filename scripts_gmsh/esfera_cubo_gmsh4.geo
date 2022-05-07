//+
SetFactory("OpenCASCADE");
r=1;
b=3;
a=b*2;
//+
Sphere(1) = {0, 0, 0, r, -Pi/2, Pi/2, 2*Pi};
//+
Box(4) = {-a/2, -a/2, -a/2, a, a, a};
//+
Surface Loop(3) = {2, 4, 6, 3, 5, 7};

//Se eliminan los volumenes generados por las figuras predeterminadas
Delete {
  Volume{1}; 
}
//+
Delete {
  Volume{4}; 
}

//Volumen entre la esfera y el cubo
Surface Loop(4) = {1};
//+
Surface Loop(5) = {6, 2, 4, 7, 3, 5};
//+
Volume(1) = {4, 5};

//Densidad de malla
c=0.1;
Field[1] = MathEval;
Field[1].F = "0.1*(x^2+y^2+z^2)";
Background Field = 1;

// Grupos físicos
Physical Surface("Boundary", 16) = {5, 3, 6, 2, 4, 7};
Physical Surface("Sphere", 17) = {1};
