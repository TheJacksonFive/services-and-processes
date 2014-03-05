#!/usr/bin/env ruby
#pelu.rb

class Cliente
  @@n_cliente=0

    def initialize
    @@n_cliente +=1
    @n_cliente = @@n_cliente
    puts "hola soy el cliente #{@n_cliente}."
    end 
    def cliente_number?
     @n_cliente
    end
end

arrayCliente = Array.new

#mutex = Mutex.new

while arrayCliente.length<20
	cliente = Cliente.new
	arrayCliente.push(cliente)
end

s1 = Thread.new do
	while(!arrayCliente.empty?)
#	mutex.synchronize{
	puts "Silla1"
	ncliente = arrayCliente.shift.cliente_number?
	puts "Client number #{ncliente}."
	sleep(rand(8))
	puts "GOOD BYE Client number #{ncliente}."
#	}
	end
end

s2 = Thread.new do

	while(!arrayCliente.empty?)
#	mutex.synchronize{
	puts "Silla2"
	ncliente = arrayCliente.shift.cliente_number?
	puts "Client number #{ncliente}."
	sleep(rand(8))
	puts "GOOD BYE Client number #{ncliente}."
#	}
	end
end

s3 = Thread.new do
	while(!arrayCliente.empty?)
#	mutex.synchronize{
	puts "Silla3"
	ncliente = arrayCliente.shift.cliente_number?
	puts "Client number #{ncliente}."
	sleep(rand(8))
	puts "GOOD BYE Client number #{ncliente}."
#	}	
	end
end

s4 = Thread.new do
	while(!arrayCliente.empty?)
	#mutex.synchronize{
	puts "Silla4"
	ncliente = arrayCliente.shift.cliente_number?
	puts "Client number #{ncliente}."
	sleep(rand(8))
	puts "GOOD BYE Client number #{ncliente}."
	#}
	end
end


s1.join
s2.join
s3.join
s4.join
