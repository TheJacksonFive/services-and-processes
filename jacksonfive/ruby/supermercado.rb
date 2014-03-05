#!/usr/bin/env ruby
#supermercado.rb

require 'thread'

class Client
	@@ncliente = 0
	def initialize 
		@leche = rand(5)+1
		@@ncliente += 1
		@ncliente = @@ncliente
	end

	def n_cliente?
		@ncliente
	end
	def n_leche?
		@leche
	end
end

class Object
	def synchronize
		
	end
	def mutex
	end
end


arrayClientes = Array.new
arrayCola = Array.new
mutex = Mutex.new

#Genera clientes infinitamente y los mete en un array de Clientes
h1 = Thread.new do
arrayClientes.synchronize do
while(1)
cliente = Client.new
arrayClientes.push(cliente)
puts "cliente #{cliente.n_cliente?} Cartones de leche: #{cliente.n_leche?}\n"
sleep(2)
end
end
end

#Extrae clientes del array de Cliente y los mete en el array de Cola
h2 = Thread.new do
 #while(arrayCliente.empty?)
arrayCola.synchronize do
 while(1)
# mutex.synchronize{
 arrayCola.push(arrayClientes.shift)
 cantidad = arrayCola.length
 cantidad2 = arrayClientes.length
 puts "Clientes en la tienda: #{cantidad2} clientes, Cola para pagar: #{cantidad}\n"
 sleep(3)
# }
 end
end
end

e1 = Thread.new do
end

e2 = Thread.new do
end

e3 = Thread.new do
end

h1.join
h2.join
#e1.join
#e2.join
#e3.join
