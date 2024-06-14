import socios.*


class Actividad{
	 const property idiomas = #{}
	 method implicaEsfuerzo()
	 method broncearse()
	 method diasActividad ()
	 method esInteresante() = idiomas.size() > 1
	 method esRecomendadaParaSocio(socio){
	 	return self.esInteresante() and socio.leAtrae(self) and not socio.actRealizadas().contains(self)
	 }
}


class ViajesDePlaya inherits Actividad{
	var property largoPlaya
	
	override method diasActividad(){
		return largoPlaya / 500
	}
	
	override method implicaEsfuerzo(){
		return largoPlaya > 1200
	}
	
	override method broncearse() = true
}


class ExcursionACiudad inherits Actividad{
	var cantAtracciones
	
	override method diasActividad(){
		return cantAtracciones / 2
	}
	
	override method implicaEsfuerzo(){
		return cantAtracciones.between(5,8)
	}
	
	override method broncearse()= false

	
	override method esInteresante()= super() or cantAtracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
	
	override method diasActividad(){
		return super() +1
	}
	
	override method broncearse()= true
}



class SalidaDeTrekking inherits Actividad{
	var property kmARecorrer 
	var property diasDeSol
	
	override method diasActividad(){
		return kmARecorrer / 50
	}
	
	override method implicaEsfuerzo(){
		return kmARecorrer > 80
	}
	
	override method broncearse(){
		return (diasDeSol > 200) or (diasDeSol.between(100,200) and kmARecorrer > 120)
		 
	}
	
	override method esInteresante() = super() and diasDeSol > 140
}




class ClaseDeGimnasia inherits Actividad{
	
	method initialize(){
		if(idiomas != #{"español"}){
			self.error("las clases de gimnasia solo se permiten en español")
		}
	}
	override method diasActividad()=1
	override method implicaEsfuerzo()=true
	override method broncearse()=true
	
	override method esRecomendadaParaSocio(socio){
		return socio.edad().between(20,30)
	}
}




class TallerLiterario inherits Actividad{
	var property libro =[idiomas,cantPaginas, nombreAutor]
	var property cantPaginas
	var property nombreAutor
	
	override method idiomas()= libro.idiomas()
	
	override method diasActividad() = libro.size() + 1
	
	override method implicaEsfuerzo(){
		return (libro.find({algo => algo.cantPaginas() > 500})) or (libro.all({algo => algo.nombreAutor() == libro.nombreAutor()}) and libro.size()>1)
	}
	
	override method broncearse()= false
	
	override method esRecomendadoParaSocio(socio){
		return socio.idiomas().size() >1
	}
}







