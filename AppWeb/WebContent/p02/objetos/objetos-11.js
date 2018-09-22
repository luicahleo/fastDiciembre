// Ejemplo de herencia emulada en ECMAScript
// https://developer.mozilla.org/es/docs/Web/JavaScript/Introducci%C3%B3n_a_JavaScript_orientado_a_objetos

// Creamos nuestra función constructora de la superclase
function ClassA(primerNombre){
    this.nombre=primerNombre
    this.otrosNombres = ["Obj sin asignar"];
}

// Agregamos un par de métodos a ClassA.prototype
ClassA.prototype.asignar = function(n){
    this.otrosNombres[this.otrosNombres.length]=n;
}
ClassA.prototype.identificarse = function(){
    alert('Mi primer nombre es: '+this.nombre+'\nMis otros nombres son:'+this.otrosNombres);
}


// Definimos el constructor de la subclase ClassB
function ClassB(primerNombre, asunto){
    // LLamamos al constructor de la superclase
    ClassA.call(this, primerNombre);
    // Inicializamos las propiedades específicas de la subclase
    this.asunto=asunto;
}    

// Creamos el objeto ClassB.prototype, que hereda de ClassA.prototype
ClassB.prototype = Object.create(ClassA.prototype);

// Establecemos la propiedad "constructor" para referencias a ClassB
ClassB.prototype.constructor = ClassB;

// Reemplazamos el método identificarse
ClassB.prototype.identificarse = function(){
    alert('Mi primer nombre es: '+this.nombre+'\nMis otros nombres son:'+this.otrosNombres+
	  '\nMi asunto es:'+this.asunto);
}

//alert('El constructor de ClassA es: '+ClassA.constructor.toString());
//alert('El constructor de ClassB es: '+ClassB.constructor);
//console.log('El constructor de ClassA es: '+ClassA.constructor.toString());
//console.log('El constructor de Class es: '+ClassB.constructor);


miobjetoA1=new ClassA("nomA1");
miobjetoA2=new ClassA("nomA2");
miobjetoB1=new ClassB("nomB1","asunto de B1");
miobjetoB2=new ClassB("nomB2","asunto de B2");

alert('miobjetoA1 es una instancia de ClassA: '+ (miobjetoA1 instanceof ClassA));
alert('miobjetoB1 es una instancia de ClassB: '+ (miobjetoB1 instanceof ClassB));

miobjetoA1.identificarse();
miobjetoA2.identificarse();
miobjetoB1.identificarse();
miobjetoB2.identificarse();

miobjetoA1.asignar("objA1");
miobjetoA2.asignar("objA2");
miobjetoB1.asignar("objB1");
miobjetoB2.asignar("objB2");

miobjetoA1.identificarse();
miobjetoA2.identificarse();
miobjetoB1.identificarse();
miobjetoB2.identificarse();
