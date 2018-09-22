/*FJFJ*/

function validarForm()
{
	var res = true;
	var x=document.forms["login"]["usuario"].value;
	if (x==null || x=="")
	  {
	  alert("Por favor rellena el campo usuario");
	  res = false;
	  }
	return res;
}

function mostrarPistas()
{
	//Conmuta entre visible y oculto
	if (document.getElementById("pistas").style.display=="block")
		document.getElementById("pistas").style.display="none";
	else
		document.getElementById("pistas").style.display="block";

}

