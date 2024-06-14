import mutual.*

class Socios {
	
	const actRealizadas = []
	var property maximoAct
	var edad 
	const idiomas = #{}
	
	method esAdoradorDelSol() = actRealizadas.all({algo=> algo.broncearse()})
	
	method actividadesEsforzadas() = actRealizadas.filter({algo => algo.implicaEsfuerzo()})
	
	method registrarAct(actividad){
		if(actRealizadas.size()==maximoAct){
			self.error("Máximo de actividades")
		}
		else{
			actRealizadas.add(actividad)
		}
	}
	
	method leAtrae(actividad)= null
	
	
	
	
}




class SocioTranquilo inherits Socios{
	
	override method leAtrae(actividad) = actividad.diasActividad()>=4
}


class SocioCoherente inherits Socios{
	
	override method leAtrae(actividad) = if (self.esAdoradorDelSol()) actividad.broncearse() else actividad.implicanEsfuerzo()
	
}

class SocioRelajado inherits Socios {
	
	override method leAtrae(actividad) = not idiomas.intersection(actividad.idiomas()).isEmpty()
}