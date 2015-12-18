# encoding: utf-8

class Cita
    def initialize(&block)
        @lista = List.new
        if block_given?  
            if block.arity == 1
                yield self
            else
                instance_eval &block 
            end
        end
    end
    
    def citar(referencia)
        #raise ArgumentError, "La referencia debe ser del tipo Referencia" unless referencia.is_a?(Referencia)
        @lista.push_back(referencia)
        
        aux = @lista.sort
        @lista.clear
        aux.each do |n|
            @lista.push_back(n)
        end
    end
    
    def clear
        @lista.clear
    end
    
    def to_s
        salida = ""
        @lista.each do |n|
            salida = salida + n.to_s + "\n"
        end
        salida
    end
end