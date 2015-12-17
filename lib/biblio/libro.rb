# encoding: utf-8
class Libro < Referencia
    attr_accessor :series, :n_edition, :isbns
    
    def initialize
        @isbns = []
        super
    end
    
    def serie(text)
        if !text.nil?
            raise ArgumentError, "La serie debe ser un String" unless text.is_a?(String)
        end
        @series = text
    end
    
    def n_edicion(number)
        raise ArgumentError, "Numero de edicion debe ser un Numeric" unless number.is_a?(Numeric)
        @n_edition = number
    end
    
    def isbn(text)
        raise ArgumentError, "El ISBN debe ser un String" unless text.is_a?(String)
        @isbns << text
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

        # formateamos isbn
        str_isbn = ""
        @isbns.each do |n_isbn|
            if n_isbn.length > 10
                str_isbn += "ISBN-13: #{n_isbn}\n"
            else
                str_isbn += "ISBN-10: #{n_isbn}\n"
            end
        end
        
         if @sufijo != nil
            str_sufijo = " " + @sufijo
        else
            str_sufijo = ""
        end
        
        salida=""
        if series != nil
            salida = "#{str_autores} (#{@date_p.strftime("%d, %B %Y")}#{str_sufijo}). #{@title} (#{@series}).\n\t#{@editor}; #{@n_edition} edición\n\t#{str_isbn}"
        else
            salida = "#{str_autores} (#{@date_p.strftime("%d, %B %Y")}#{str_sufijo}). #{@title}.\n\t#{@editor}; #{@n_edition} edición\n\t#{str_isbn}"
        end
        salida
    end
end
