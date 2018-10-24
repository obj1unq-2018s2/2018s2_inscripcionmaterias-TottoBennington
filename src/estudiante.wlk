import materia.*
class Estudiante{
	var property materiasAprobadas = []
	var property inscriptoEnMaterias = []
	var property carrerasCursadas = []
	var property creditosTotales
	
	method perteneceACarrera(materia) = carrerasCursadas.any{
		carrera => carrera.materias().contains(materia)
	}
	method perteneceAMateriasAprobadas(materia) = materiasAprobadas.map{
		mat => mat.materia()
	}.contains(materia)
	
	method inscriptoEn(materia) = inscriptoEnMaterias.contains(materia)
	
	method cumpleConLosPrerequisitosDe(materia) = materia.prerequisitos(self)
	// punto 1
	method puedeCursar(materia) = self.perteneceACarrera(materia) and 
								  not self.perteneceAMateriasAprobadas(materia) and
								  not self.inscriptoEn(materia) and
								  self.cumpleConLosPrerequisitosDe(materia)
								  
	//punto 2
	method registrarNuevaMatAprobada(materia, nota){
		if(not materiasAprobadas.any{mat => mat.materia() == materia}){
			materiasAprobadas.add(new MateriaAprob(
				materia = materia,
				nota = nota,
				estudiante = self
			))
		}
	}
	
	//punto 3
	method inscribirseEn(materia){
		if(self.puedeCursar(materia) and materia.cupo()>0){
			inscriptoEnMaterias.add(materia)
			materia.inscribirAlu(self)
		} else if(self.puedeCursar(materia) and materia.cupo() == 0){
			materia.listaDeEspera().add(self)
		} else{
			self.error("No hay cupo y la lista de espera esta llena")
		}
	}
}