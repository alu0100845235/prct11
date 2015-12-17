# encoding: utf-8
require 'date'

class Referencia
    include Comparable
    attr_accessor :autores, :title, :editor, :date_p, :sufijo
    
    def initialize
        @autores = []
        yield self if block_given?
    end
    
    def autor(name)
        raise ArgumentError, "Los autores deben ser un String" unless name.is_a?(String)
        # Formateamos el nombre    
        aux = name.split
        raise ArgumentError, "El nombre del autor debe contener nombre y apellido" unless aux.length > 1
        
        nombre = aux.pop + ", "
        aux.each do |n|
            if n.length > 0
                nombre << n[0] + ". "
            end
        end
 
        # Insertamos y ordenamos el array
        @autores << nombre[0..-2]
        @autores = @autores.sort
    end
    
    def titulo(text)
        raise ArgumentError, "El titulo debe ser un String" unless text.is_a?(String)
        text = text.downcase
        aux = text.split
        aux[0].capitalize!
        aux.each do |p|
            if p.length > 2
                p.capitalize!
            end
        end
        @title = aux.join " "
    end
    
    def editorial(text)
        raise ArgumentError, "Editorial debe ser un String" unless text.is_a?(String)
        @editor = text 
    end

    def fecha(text)
        raise ArgumentError, "La fecha de publicacion debe ser un String" unless text.is_a?(String)
        @date_p = Date.parse(text) 
    end
    
    def <=>(other)
        # devolvemos nil si no son del tipo Referencia
        return nil unless other.is_a? Referencia
        # realizamos las comparaciones necesarias
        
        # Comprobamos si tienen el mismo apellido del primer autor, ordenamos por el primer autor
        return @autores.first <=> other.autores.first unless @autores.first == other.autores.first
        # Comprobamos cantidad de autores, priorizamos los que tengan menor numero de autores
        return @autores.length <=> other.autores.length unless @autores.length == other.autores.length
        # Comprobamos son exactamente los mismos autores, si no lo son ordenamos por la lista completa de autores
        return @autores <=> other.autores unless @autores & other.autores == @autores
        # Ordenamos por año de publicacion
        return @date_p.year <=> other.date_p.year unless @date_p.year == other.date_p.year
        # Ordenamos por titulo
        if @title != other.title
            # Insertamos sufijos
            mes = ["ENE", "FEB", "MAR", "ABR", "MAY", "JUN", "JUL", "AGO", "SEP", "OPT", "NOV", "DIC"]
            @sufijo = mes[@date_p.mon - 1]
            other.sufijo = mes[other.date_p.mon - 1]
            return @title <=> other.title
        end
        
        return 0
    end
end