class Factorial {
    public static void main(String[] a) {
        System.out.println(new Fac().ComputeFac(10));
    }
}

class Fac {
  int MAX;
  //MAX = 10; //esto es un error
  public int ComputeFac(int num) {
    int num_aux;
    if (num < 1)
      num_aux = 1;
    else
      num_aux = num * (this.ComputeFac(num-1));
    return num_aux;
  }
}

class otra {
  int[] arreglo;
  
  public int imprimir() 
  {
    System.out.println("Este es el resultado: " + this); //error con paréntesis de más
    return id.func(4,arreglo.lenght);  //si cambiaron la regla como les dije, no pueden poner this, sino un ID, sino, debería estar correcta esta línea
  }

  public int operaciones(int op1, int op2)
  {
    int i;
    int result;   
    // i = 10%; //error de scanner
    //int[] arreglo;

    System.out.println("a");
    arreglo = new int[Fac]; //debería dar error. CORREGIRLO
     
    while (!(i < 0))
      arreglo[i] = i;
    
    if ((op1 < 1) && (op2 < 0))
    {
      result = (op1 + new int[2]) * (op2 - new int[5]);// se puso el int en lugar del arreglo, pork nuestra gramatica no permite esa definicion
    }
    else
    {
      result = 1;
    }
    
    //poner un ejemplo de SWITCH aquí
    switch (id)
    {
      case 1':'
        a = 1;
        b = 1;
	break;
      case 2':'
        a = 1;
        b = 1;
      default':'
        a = 1;
        b = 1;
    }
    
    return result;
  }
}

 // esto es basura al final para ver si la reconoce como error o no!!!

/* 

Notas:
- Aparece el error en la línea 9.
- En la línea 25 aparece el error por paréntesis, pero también un error con la sintaxis de la suma, que debe ser de dos Primary Expressions, y "this.operaciones()" es un message send que no se incluye dentro de esa regla, según la gramática dada.
- En la línea 26 sí funciona enviar "this.func" sin embargo hay que usar "lenght" en vez de "length". (Error ortográfico jaja)
- En la línea 32 aparece el error de scanner.
- En la línea 33 aparece el error, se resuelve quitando el ".MAX" y agregando un PrintStatement para resolver el problema de precedencia.
- Se agrega el switch y funciona correctamente. Hay que sustitur los : por ':' (con comillas simples).

*/


