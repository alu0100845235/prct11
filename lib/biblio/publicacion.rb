# encoding: utf-8
class Publicacion < Referencia
    attr_accessor :pinicio, :pfin, :issns
    
    def initialize
        super
    end
    
    def pagina_inicio(number)
        raise ArgumentError, "Numero de pagina debe se un Numeric" unless number.is_a?(Numeric)
        @pinicio = number
    end
    
    def pagina_fin(number)
        raise ArgumentError, "Numero de pagina debe se un Numeric" unless number.is_a?(Numeric)
        @pfin = number
    end
    
    def issn(text)
        raise ArgumentError, "El codigo ISSN debe se un String" unless text.is_a?(String)
        @issns = text
    end
end
