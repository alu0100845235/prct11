# encoding: utf-8
class Periodico < Publicacion
    
    def initialize
        super
    end
    
    def to_s
        # formateamos autores
        str_autores = ""
        @autores.each do |autor|
            str_autores += autor + ", "
        end
        str_autores = str_autores[0, str_autores.length - 2]
        if @autores.length > 1
            str_autores = str_autores.sub(", " + @autores.last, " & " + @autores.last)
        end
        
        # generamos string de salida
        salida=""
        if(@pfin != nil)
            salida = "#{str_autores} (#{@date_p.strftime("%d, %B %Y")}). #{@title}.\n\t#{@editor}, p. #{@pinicio} - #{@pfin}.\n\tISSN: #{@issn}"
        else
            salida = "#{str_autores} (#{@date_p.strftime("%d, %B %Y")}). #{@title}.\n\t#{@editor}, p. #{@pinicio}.\n\tISSN: #{@issn}"
        end
        salida
    end
end
