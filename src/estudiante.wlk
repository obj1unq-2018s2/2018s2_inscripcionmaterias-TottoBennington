import materia.*
class Estudiante{
	var property materiasAprobadas = []
	var property inscriptoEnMaterias = []
	var property carrerasCursadas = []
	
	method perteneceACarrera(materia) = carrerasCursadas.any{
		carrera => carrera.contains(materia)
	}
	method perteneceAMateriasAprobadas(materia) = !materiasAprobadas.map{
		mat => mat.nombreMateria() == materia.nombreMateria()
	}.isEmpty()
	
//	method inscriptoEn(materia) = inscriptoEnMaterias.contains(materia)
	
//	method cumpleConLosPrerequisitosDe(materia) = materia.prereq()
}