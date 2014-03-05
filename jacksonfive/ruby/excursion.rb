#!/usr/bin/env ruby
#excursion.rb


class Alumno
	@@codigo_alumno = 0
	def initialize
		@@codigo_alumno += 1
		@codigo_alumno = @@codigo_alumno
	end
	def devolver_codigo?
		@codigo_alumno
	end
end

colegio = Array.new
campo = Array.new
bus1 = Array.new
bus2 = Array.new
bus3 = Array.new
bus4 = Array.new

mutex = Mutex.new

while colegio.length<2000
alumno = Alumno.new
colegio.push(alumno)
#puts "Alumno #{colegio.shift.devolver_codigo?}"
end

autobus1 = Thread.new do
while bus1.length<52
#mutex.synchronize do
alumno_nuevo = colegio.shift.devolver_codigo?
bus1.push(alumno_nuevo)
cantidad = bus1.length
puts "Autobus 1: #{alumno_nuevo} Cantidad de alumnos: #{cantidad}\n"
sleep rand(4)
#end
end
while !bus1.empty?
alumno_campo  = bus1.shift
campo.push(alumno_campo)
puts "El alumno #{alumno_campo} ha llegado al campo"
sleep 7
end
end

autobus2 = Thread.new do
while bus2.length<52
#mutex.synchronize do
alumno_nuevo2 = colegio.shift.devolver_codigo?
bus2.push(alumno_nuevo2)
cantidad_bus2 = bus2.length
puts "Autobus 2: #{alumno_nuevo2} Cantidad de alumnos: #{cantidad_bus2}\n"
sleep rand(4)
end
while !bus2.empty?
alumno_campo2 = bus2.shift
campo.push(alumno_campo2)
puts "El alumno #{alumno_campo2} ha llegado al campo"
sleep 7
end
end
#end

autobus3 = Thread.new do
while bus3.length<52
#mutex.synchronize do
alumno_nuevo3 = colegio.shift.devolver_codigo?
bus3.push(alumno_nuevo3)
cantidad_bus3 = bus3.length
puts "Autobus 3: #{alumno_nuevo3} Cantidad de alumnos: #{cantidad_bus3}\n"
sleep rand(4)
end
while !bus3.empty?
alumno_campo3 = bus3.shift
campo.push(alumno_campo3)
puts "El alumno #{alumno_campo3} ha llegado al campo"
sleep 7
end
#end
end

autobus4 = Thread.new do
while bus4.length<52
#mutex.synchronize do
alumno_nuevo4 = colegio.shift.devolver_codigo?
bus4.push(alumno_nuevo4)
cantidad_bus4 = bus4.length
puts "Autobus 4: #{alumno_nuevo4} Cantidad de alumnos: #{cantidad_bus4}\n"
sleep rand(4)
#end
end
while !bus4.empty?
alumno_campo4 = bus4.shift
campo.push(alumno_campo4)
puts "El alumno #{alumno_campo4} ha llegado al campo"
sleep 7
end
end

autobus1.join
autobus2.join
autobus3.join
autobus4.join
