import estudiante.*
class Materia{
	const creditosAlAprobar
	const anioDeLaMateria // numero entero
	const carreraALaQuePertenece
	var property cupo
	var property listaDeEspera = []
	var property inscriptos = []
	
	method inscribirAlu(estudiante){
		inscriptos.add(estudiante)
		cupo -= 1
	}
	
	method prerequisito(estudiante) = estudiante.carrerasCursadas().contains(carreraALaQuePertenece)
}

class MateriaConCorrelativas inherits Materia{
	var property correlativas = []
	override method prerequisito(estudiante) = super(estudiante) and correlativas.all{
		mat => estudiante.perteneceAMateriasAprobadas(mat) 
	}
}

class MateriaConCreditos inherits Materia{
	var property creditosNecesariosParaInsc
	override method prerequisito(estudiante) = super(estudiante) and creditosNecesariosParaInsc >= estudiante.creditosTotalesDeEst()
}

class MateriaConAnio inherits Materia{
	// no supe como terminarlo
	//override method prerequisito(estudiante) = super(estudiante) and 
}

class MateriaAprob{
	var property materia
	var property nota
	var property estudiante
}