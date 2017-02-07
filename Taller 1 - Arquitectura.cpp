#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <iostream>

using namespace std;

unsigned int mult(unsigned int x, unsigned int y) 
{
         unsigned int z=0;
         for (int i=0; i < y; i++)
         {
             z=z+x;
         }
         return z;
}

unsigned int poten(unsigned int x, unsigned int y) 
{
         unsigned int z=1;
         for (int i=0; i < y; i++)
         {
            z=mult(x,z);
         }
         return z;
}

int polinomio(int x, int n)
{
        int p=n;
        int vec[n+1];
        int resultado=0;
        cout << endl;
        for(int i=0; i<=p; i++)
        {
            cout <<"Ingrese el coeficiente " << i+1 << " del polinomio: " ;
        	cin >> vec[i];
        }
        for(int i=0;i<=p;i++)
        { 
        	resultado=resultado+(vec[i]*(poten(x,n)));
        	n--;
        }
        cout << endl;
        return resultado;
}

int fact(int n)
{
    int r=1;
    for (int i=1; i<=n; i++)
    {
        r=r*i;
    }
    return r;
}

int division(int a, int b) 
{
         int i;
         while (a>=b)
         {
             a=a-b;
             i++; ;
         }
         return i;
}

main()
{
    unsigned int x,y;
    int a,b;
    
    /*cout << "EJERCICIO 1" << endl << endl;
    cout << "Ingrese el multiplicando: " ;
    cin >> x;
    cout << "Ingrese el multiplicador: " ;
    cin >> y;
    cout << endl;
    cout << "El resultado de la multiplicacion es: " << mult(x,y) << endl ;
    system("pause");
    */
    
    /*cout << "EJERCICIO 2" << endl << endl;
    cout << "Ingrese la base: " ;
    cin >> x;
    cout << "Ingrese la potencia: " ;
    cin >> y;
    cout << endl;
    cout << "El resultado de la potencia es: " << poten(x,y) << endl ;
    system("pause");
    */
    
    /*cout << "EJERCICIO 3" << endl << endl;
    cout << "Ingrese el grado del polinomio " ;
    cin >> y;
    cout << "Ingrese el valor de x: " ;
    cin >> x;
    cout << "El resultado del polinomio es: " << polinomio (x,y) << endl;
    system("pause");*/
    
    
    /*cout << "EJERCICIO 4" << endl << endl;
    cout << "Ingrese el numero del que desea conocer el factorial: " ;
    cin >> x ;
    cout << "El factorial es: " << fact(x) << endl ;
    system("pause");*/
    
    /*cout << "EJERCICIO 5" << endl << endl;
    cout << "Ingrese el divisor: " ;
    cin >> a ;
    cout << "Ingrese el dividendo: " ;
    cin >> b ;
    cout << "El resultado de la division es: " << division(a,b) << endl << endl ;
    system("pause");
    */
}

