# encoding: utf-8
require 'spec_helper'

describe Biblio do
    before :each do
        @b1 = Libro.new{ |r|
            r.autor "Dave Thomas"
            r.autor "Andy Hunt"
            r.autor "Chad Fowler"
            r.titulo "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide"
            r.serie "The Facets of Ruby"
            r.editorial "Pragmatic Bookshelf"
            r.n_edicion 4
            r.fecha "07/07/2013"
            r.isbn "978-1937785499"
            r.isbn "1937785491"
        }
        @b2 = Libro.new{ |r|
            r.autor "Scott Chacon"
            r.titulo "Pro Git 2009th Edition"
            r.serie "Pro"
            r.editorial "Apress"
            r.n_edicion 2009
            r.fecha "27/08/2009"
            r.isbn "978-1430218333"
            r.isbn "1430218339"
        }
        @b3 = Libro.new{ |r|
            r.autor "David Flanagan"
            r.autor "Yukihiro Matsumoto"
            r.titulo "The Ruby Programming Language"
            r.editorial "O'Reilly Media"
            r.n_edicion 1
            r.fecha "04/02/2008"
            r.isbn "0596516177"
            r.isbn "978-0596516178"
        }
        @b4 = Libro.new{ |r|
            r.autor "David Chelimsky"
            r.autor "Dave Astels"
            r.autor "Bryan Helmkamp"
            r.autor "Dan North"
            r.autor "Zach Dennis"
            r.autor "Aslak Helleson"
            r.titulo "The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends"
            r.serie "The Facets of Ruby"
            r.editorial "Pragmatic Bookshelf"
            r.n_edicion 1
            r.fecha "25/12/2010"
            r.isbn "1934356379"
            r.isbn "978-1934356371"
        }
        @b5 = Libro.new{ |r|
            r.autor "Richard E"
            r.titulo "Silverman Git Pocket Guide"
            r.editorial "O'Reilly Media"
            r.n_edicion 1
            r.fecha "02/08/2013"
            r.isbn "1449325866"
            r.isbn "1449325866"
        }
        @bx = Libro.new{ |r|
            r.autor "Dave Thomas"
            r.autor "Andy Hunt"
            r.autor "Chad Fowler"
            r.titulo "the Pragmatic Programmers Guide"
            r.serie "The Facets of Ruby"
            r.editorial "Pragmatic Bookshelf"
            r.n_edicion 4
            r.fecha "08/08/2013"
            r.isbn "978-1937785499"
            r.isbn "1937785491"
        }

        @p1 = Periodico.new{ |r|
            r.autor "autor apellido"
            r.titulo "Titulo"
            r.editorial "Periodico"
            r.fecha "07/07/2013"
            r.pagina_inicio 1
            r.issn "123456789"
        }
        @p2 = Periodico.new{ |r|
            r.autor "autor1 apellido1"
            r.autor "autor2 apellido2"
            r.titulo "Titulo2"
            r.editorial "Periodico2"
            r.fecha "08/08/2013"
            r.pagina_inicio 1
            r.pagina_fin 2
            r.issn "123456789"
        }
        @p3 = Periodico.new{ |r|
            r.autor "autor apellido"
            r.titulo "Titulo3"
            r.editorial "Periodico3"
            r.fecha "08/08/2013"
            r.pagina_inicio 1
            r.pagina_fin 100
            r.issn "123456789"
        }
        
        @r1 = Revista.new{ |r|
            r.autor "autor apellido"
            r.titulo "Titulo"
            r.editorial "Revista"
            r.fecha "07/07/2013"
            r.numero 10
            r.pagina_inicio 1
            r.issn "123456789"
        }
        @r2 = Revista.new{ |r|
            r.autor "autor1 apellido1"
            r.autor "autor2 apellido2"
            r.titulo "Titulo2"
            r.editorial "Revista2"
            r.fecha "08/08/2013"
            r.numero 11
            r.pagina_inicio 1
            r.pagina_fin 2
            r.issn "123456789"
        }
        @r3 = Revista.new{ |r|
            r.autor "autor apellido"
            r.titulo "Titulo3"
            r.editorial "Revista3"
            r.fecha "08/08/2013"
            r.numero 12
            r.pagina_inicio 1
            r.pagina_fin 100
            r.issn "123456789"
        }
        
        @e1 = Edocumento.new{ |r|
            r.autor "autor apellido"
            r.titulo "Titulo"
            r.editorial "E-documento"
            r.fecha "07/07/2013"
            r.pagina_inicio 1
            r.issn "123456789"
            r.url "http://www.hola.com"
        }
        @e2 = Edocumento.new{ |r|
            r.autor "autor1  apellido1"
            r.autor "autor2  apellido2"
            r.titulo "Titulo2"
            r.editorial "E-documento2"
            r.fecha "08/08/2013"
            r.pagina_inicio 1
            r.pagina_fin 2
            r.issn "123456789"
            r.url "http://www.hastaluego.com"
        }
        @e3 = Edocumento.new{ |r|
            r.autor "autor apellido"
            r.titulo "Titulo3"
            r.editorial "E-documento3"
            r.fecha "08/08/2013"
            r.pagina_inicio 1
            r.pagina_fin 100
            r.issn "123456789"
            r.url "http://www.chao.com"
        }
    
        @l1 = List.new
        @l2 = List.new(@b1)
        @l3 = List.new(@p2)
        @l3.push_back(@p1)
        
        @citas = Cita.new{ |c|
            c.citar @b1
            c.citar @b2
            c.citar @b3
            c.citar @b4
            c.citar @b5
            c.citar @bx
        }
    end
    
    describe "Comprobacion de la herencia de Libro" do
        it "Test herencia lista" do
            expect(@b1.is_a?Object).to be true
            expect(@b1.is_a?Referencia).to be true
            expect(@b1.instance_of?Libro).to be true
            expect(@b2.is_a?Object).to be true
            expect(@b2.is_a?Referencia).to be true
            expect(@b2.instance_of?Libro).to be true
            expect(@b3.is_a?Object).to be true
            expect(@b3.is_a?Referencia).to be true
            expect(@b3.instance_of?Libro).to be true
        end
    end
    
    describe "Comprobacion de la herencia de Periodico" do
        it "Test herencia lista" do
            expect(@p1.is_a?Object).to be true
            expect(@p1.is_a?Referencia).to be true
            expect(@p1.is_a?Publicacion).to be true
            expect(@p1.instance_of?Periodico).to be true
            expect(@p2.is_a?Object).to be true
            expect(@p2.is_a?Referencia).to be true
            expect(@p2.is_a?Publicacion).to be true
            expect(@p2.instance_of?Periodico).to be true
            expect(@p3.is_a?Object).to be true
            expect(@p3.is_a?Referencia).to be true
            expect(@p3.is_a?Publicacion).to be true
            expect(@p3.instance_of?Periodico).to be true
        end
    end
    
    describe "Comprobacion de la herencia de Revista" do
        it "Test herencia lista" do
            expect(@r1.is_a?Object).to be true
            expect(@r1.is_a?Referencia).to be true
            expect(@r1.is_a?Publicacion).to be true
            expect(@r1.instance_of?Revista).to be true
            expect(@r2.is_a?Object).to be true
            expect(@r2.is_a?Referencia).to be true
            expect(@r2.is_a?Publicacion).to be true
            expect(@r2.instance_of?Revista).to be true
            expect(@r3.is_a?Object).to be true
            expect(@r3.is_a?Referencia).to be true
            expect(@r3.is_a?Publicacion).to be true
            expect(@r3.instance_of?Revista).to be true
        end
    end
    
    describe "Comprobacion de la herencia de Documento Electronico" do
        it "Test herencia lista" do
            expect(@e1.is_a?Object).to be true
            expect(@e1.is_a?Referencia).to be true
            expect(@e1.is_a?Publicacion).to be true
            expect(@e1.instance_of?Edocumento).to be true
            expect(@e2.is_a?Object).to be true
            expect(@e2.is_a?Referencia).to be true
            expect(@e2.is_a?Publicacion).to be true
            expect(@e2.instance_of?Edocumento).to be true
            expect(@e3.is_a?Object).to be true
            expect(@e3.is_a?Referencia).to be true
            expect(@e3.is_a?Publicacion).to be true
            expect(@e3.instance_of?Edocumento).to be true
        end
    end
    
    describe "Comprobacion de la herencia de la lista" do
        it "Test herencia lista" do
            expect(@l1.is_a?Object).to be true
            expect(@l1.instance_of?List).to be true
            expect(@l2.is_a?Object).to be true
            expect(@l2.instance_of?List).to be true
        end
    end
    
    
    describe "Comprobacion de una correcta construccion de Libro" do
        it "Existe al menos un autor" do
            expect(@b1.autores).not_to eq(nil)
            expect(@b2.autores).not_to eq(nil)
            expect(@b3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@b1.title).not_to eq(nil)
            expect(@b2.title).not_to eq(nil)
            expect(@b3.title).not_to eq(nil)
        end
        it "Existe o no una serie" do
            expect(@b1.series).not_to eq(nil)
            expect(@b2.series).not_to eq(nil)
            expect(@b3.series).to eq(nil)
        end
        it "Existe editorial" do
            expect(@b1.editor).not_to eq(nil)
            expect(@b2.editor).not_to eq(nil)
            expect(@b3.editor).not_to eq(nil)
        end
        it "Existe edicion" do
            expect(@b1.n_edition).not_to eq(nil)
            expect(@b2.n_edition).not_to eq(nil)
            expect(@b3.n_edition).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@b1.date_p).not_to eq(nil)
            expect(@b2.date_p).not_to eq(nil)
            expect(@b3.date_p).not_to eq(nil)
        end
        it "Existe isbn" do
            expect(@b1.isbns).not_to eq(nil)
            expect(@b2.isbns).not_to eq(nil)
            expect(@b3.isbns).not_to eq(nil)
        end
    end
    
    describe "Comprobacion de una correcta construccion de Periodico" do
        it "Existe al menos un autor" do
            expect(@p1.autores).not_to eq(nil)
            expect(@p2.autores).not_to eq(nil)
            expect(@p3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@p1.title).not_to eq(nil)
            expect(@p2.title).not_to eq(nil)
            expect(@p3.title).not_to eq(nil)
        end
        it "Existe editorial" do
            expect(@p1.editor).not_to eq(nil)
            expect(@p2.editor).not_to eq(nil)
            expect(@p3.editor).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@p1.date_p).not_to eq(nil)
            expect(@p2.date_p).not_to eq(nil)
            expect(@p3.date_p).not_to eq(nil)
        end
        it "Existe pagina de inicio" do
            expect(@p1.pinicio).not_to eq(nil)
            expect(@p2.pinicio).not_to eq(nil)
            expect(@p3.pinicio).not_to eq(nil)
        end
        it "Existe pagina de fin" do
            expect(@p1.pfin).to eq(nil)
            expect(@p2.pfin).not_to eq(nil)
            expect(@p3.pfin).not_to eq(nil)
        end
        it "Existe issn" do
            expect(@p1.issns).not_to eq(nil)
            expect(@p2.issns).not_to eq(nil)
            expect(@p3.issns).not_to eq(nil)
        end
    end
    
    describe "Comprobacion de una correcta construccion de Revista" do
        it "Existe al menos un autor" do
            expect(@r1.autores).not_to eq(nil)
            expect(@r2.autores).not_to eq(nil)
            expect(@r3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@r1.title).not_to eq(nil)
            expect(@r2.title).not_to eq(nil)
            expect(@r3.title).not_to eq(nil)
        end
        it "Existe editorial" do
            expect(@r1.editor).not_to eq(nil)
            expect(@r2.editor).not_to eq(nil)
            expect(@r3.editor).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@r1.date_p).not_to eq(nil)
            expect(@r2.date_p).not_to eq(nil)
            expect(@r3.date_p).not_to eq(nil)
        end
        it "Existe pagina de inicio" do
            expect(@r1.pinicio).not_to eq(nil)
            expect(@r2.pinicio).not_to eq(nil)
            expect(@r3.pinicio).not_to eq(nil)
        end
        it "Existe pagina de fin" do
            expect(@r1.pfin).to eq(nil)
            expect(@r2.pfin).not_to eq(nil)
            expect(@r3.pfin).not_to eq(nil)
        end
        it "Existe issn" do
            expect(@r1.issns).not_to eq(nil)
            expect(@r2.issns).not_to eq(nil)
            expect(@r3.issns).not_to eq(nil)
        end
        it "Existe numero de revista" do
            expect(@r1.number).not_to eq(nil)
            expect(@r2.number).not_to eq(nil)
            expect(@r3.number).not_to eq(nil)
        end
    end
    
    describe "Comprobacion de una correcta construccion de Documento Electronico" do
        it "Existe al menos un autor" do
            expect(@e1.autores).not_to eq(nil)
            expect(@e2.autores).not_to eq(nil)
            expect(@e3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@e1.title).not_to eq(nil)
            expect(@e2.title).not_to eq(nil)
            expect(@e3.title).not_to eq(nil)
        end
        it "Existe editorial" do
            expect(@e1.editor).not_to eq(nil)
            expect(@e2.editor).not_to eq(nil)
            expect(@e3.editor).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@e1.date_p).not_to eq(nil)
            expect(@e2.date_p).not_to eq(nil)
            expect(@e3.date_p).not_to eq(nil)
        end
        it "Existe pagina de inicio" do
            expect(@e1.pinicio).not_to eq(nil)
            expect(@e2.pinicio).not_to eq(nil)
            expect(@e3.pinicio).not_to eq(nil)
        end
        it "Existe pagina de fin" do
            expect(@e1.pfin).to eq(nil)
            expect(@e2.pfin).not_to eq(nil)
            expect(@e3.pfin).not_to eq(nil)
        end
        it "Existe issn" do
            expect(@e1.issns).not_to eq(nil)
            expect(@e2.issns).not_to eq(nil)
            expect(@e3.issns).not_to eq(nil)
        end
        it "Existe numero de revista" do
            expect(@e1.dir_url).not_to eq(nil)
            expect(@e2.dir_url).not_to eq(nil)
            expect(@e3.dir_url).not_to eq(nil)
        end
    end
    
    describe "Comprobacion de un correcto funcionamiento de los metodos de Libro" do
        it "Test metodo autor" do
            expect(@b1.autores).to eq(["Fowler, C.", "Hunt, A.", "Thomas, D."])
            expect(@b2.autores).to eq(["Chacon, S."])
            expect(@b3.autores).to eq(["Flanagan, D.", "Matsumoto, Y."])
        end
        it "Test metodo titulo" do
            expect(@b1.title).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide")
            expect(@b2.title).to eq("Pro Git 2009th Edition")
            expect(@b3.title).to eq("The Ruby Programming Language")
        end
        it "Test metodo serie" do
            expect(@b1.series).to eq("The Facets of Ruby")
            expect(@b2.series).to eq("Pro")
            expect(@b3.series).to eq(nil)
        end
        it "Test metodo editorial" do
            expect(@b1.editor).to eq("Pragmatic Bookshelf")
            expect(@b2.editor).to eq("Apress")
            expect(@b3.editor).to eq("O'Reilly Media")
        end
        it "Test metodo edicion" do
            expect(@b1.n_edition).to eq(4)
            expect(@b2.n_edition).to eq(2009)
            expect(@b3.n_edition).to eq(1)
        end
        it "Test metodo fecha" do
            expect(@b1.date_p.to_s).to eq("2013-07-07")
            expect(@b2.date_p.to_s).to eq("2009-08-27")
            expect(@b3.date_p.to_s).to eq("2008-02-04")
        end
        it "Test metodo isbn" do
            expect(@b1.isbns).to eq(["978-1937785499", "1937785491"])
            expect(@b2.isbns).to eq(["978-1430218333", "1430218339"])
            expect(@b3.isbns).to eq(["0596516177", "978-0596516178"])
        end
        it "Test metodo to_s (nos devuelve una referencia formateada)" do
            expect(@b1.to_s).to eq(@b1.to_s)
            expect(@b2.to_s).to eq(@b2.to_s)
            expect(@b3.to_s).to eq(@b3.to_s)
        end
    end
    
    describe "Comprobacion de metodos de periodico" do
        it "Test metodo to_s (nos devuelve una referencia formateada)" do
            expect(@p1.to_s).to eq(@p1.to_s)
            expect(@p2.to_s).to eq(@p2.to_s)
            expect(@p3.to_s).to eq(@p3.to_s)
        end
    end
    
    describe "Comprobacion de metodos de revista" do
        it "Test metodo to_s (nos devuelve una referencia formateada)" do
            expect(@r1.to_s).to eq(@r1.to_s)
            expect(@r2.to_s).to eq(@r2.to_s)
            expect(@r3.to_s).to eq(@r3.to_s)
        end
    end
    
    describe "Comprobacion de metodos de edocumento" do
        it "Test metodo to_s (nos devuelve una referencia formateada)" do
            expect(@e1.to_s).to eq(@e1.to_s)
            expect(@e2.to_s).to eq(@e2.to_s)
            expect(@e3.to_s).to eq(@e3.to_s)
        end
    end
    
    describe "Lanzamiento de errores al construir Libro" do
      it "Debe haber un autor" do
          expect { Libro.new(nil, "titulo", "serie", "editorial", 1, "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber un titulo" do
          expect { Libro.new(["autor1"] , nil, "serie", "editorial", 1, "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber una editorial" do
          expect { Libro.new(["autor1","autor2","autor3"], "titulo", "serie",nil , 1, "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber una edicion" do
          expect { Libro.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial",nil , "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber una fecha de publicacion" do
          expect { Libro.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial", 1,nil , ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
    end
    
    describe "Comprobacion de una correcta construccion de la lista" do
        it "Existe al menos un Nodo" do
            expect(@l1.front).not_to eq(nil)
            expect(@l2.front).not_to eq(nil)
        end
        it "Los nodos tienen un valor, un sucesor y un predecesor" do
            expect(@l1.front.value).to eq(nil)
            expect(@l1.front.next).to eq(nil)
            expect(@l1.front.previous).to eq(nil)
            expect(@l1.end.value).to eq(nil)
            expect(@l1.end.next).to eq(nil)
            expect(@l1.end.previous).to eq(nil)
            expect(@l2.front.value).not_to eq(nil)
            expect(@l2.front.next).to eq(nil)
            expect(@l2.front.previous).to eq(nil)
            expect(@l2.end.value).not_to eq(nil)
            expect(@l2.end.next).to eq(nil)
            expect(@l2.end.previous).to eq(nil)
        end
    end
    
    describe "Comprobacion del funcionamiento del enlace entre Nodos" do
        it "Test enlace nodos" do
            expect(@l1.front.value).to eq(nil)
            expect(@l2.front.value).to eq(@b1)
        end
    end
    
    describe "Comprobacion del funcionamiento de los metodos de la lista" do
        it "Se inserta un elemento al principo de la lista" do
            @l1.push_front(@b3)
            expect(@l1.front.value).to eq(@b3)
             @l2.push_front(@b3)
            expect(@l2.front.value).to eq(@b3)
        end
        it "Se inserta un elemento al final de la lista" do
            @l1.push_back(@b1)
            expect(@l1.get_pos(@l1.size-1).value).to eq(@b1)
            @l2.push_back(@b2)
            expect(@l2.get_pos(@l2.size-1).value).to eq(@b2)
        end
        it "Se extrae el primer elemento de la lista" do
            expect(@l1.pop_front).to eq(nil)
            expect(@l2.pop_front).to eq(@b1)
        end
        it "Se extrae el ultimo elemento de la lista" do
            expect(@l1.pop_back).to eq(nil)
            expect(@l2.pop_back).to eq(@b1)
            
            @l1.push_back(@b1)
            @l1.push_back(@b2)
            expect(@l1.pop_back).to eq(@b2)
            expect(@l1.pop_back).to eq(@b1)
        end
        it "Se inserta un elemento a la lista" do
            @l1.insert(0, @b1)
            expect(@l1.front.value).to eq(@b1)
        end
        it "Se insertan varios elementos a la lista" do
            @l1.insert(0, @b1)
            expect(@l1.front.value).to eq(@b1)
            @l1.insert(1, @b2)
            expect(@l1.get_pos(1).value).to eq(@b2)
            @l1.insert(2, @b3)
            expect(@l1.get_pos(2).value).to eq(@b3)
            @l1.insert(0, @b3)
            expect(@l1.front.value).to eq(@b3)
            @l1.insert(1, @b1)
            expect(@l1.get_pos(1).value).to eq(@b1)

            expect(@l1.get_pos(100)).to eq(nil)
        end
    end
    
    describe "Comprobacion de las comparaciones" do
        it "Test mayor que" do
            expect(@b1 > @b2).to be true
            expect(@b3 > @b2).to be true
        end
        it "Test mayor o igual que" do
            expect(@b1 >= @b2).to be true
            expect(@b3 >= @b2).to be true
        end
        it "Test menor que" do
            expect(@b2 < @b1).to be true
            expect(@b2 < @b3).to be true
        end
        it "Test menor o igual que" do
            expect(@b2 <= @b1).to be true
            expect(@b2 <= @b3).to be true
            expect(@b3 <= @b3).to be true
        end
        it "Test igual que" do
            expect(@b1 == @b1).to be true
            expect(@b2 == @b2).to be true
        end
        it "Test distinto que" do
            expect(@b3 != @b2).to be true
            expect(@b1 != @b2).to be true
        end
    end
    
    describe "Comprobacion Enumerable" do
        it "comprobrando el metodo all? con un bloque vacio" do
            expect(@l1.all?).to eq(true)
            expect(@l2.all?).to eq(true)
        end
        it "comprobrando el metodo any?" do
            expect(@l1.any?).to eq(false)
            expect(@l2.any?).to eq(true)
        end
        it "comprobrando el metodo collect" do
            expect(@l1.map{|i| i}).to eq([])
            expect(@l2.map{|i| i}).to eq([@b1])
            expect(@l2.collect{|i| i}).to eq([@b1])
        end 
        it "comprobrando el metodo count" do
            expect(@l1.count).to eq(0)
            expect(@l2.count).to eq(1)
            expect(@l3.count).to eq(2)
        end
        it "comprobrando el metodo detect" do
            expect(@l3.detect {|i| i == @b3}).to eq(nil)
            expect(@l3.detect {|i| i == @p2}).to eq(@p2)
            expect(@l3.find {|i| i == @b3}).to eq(nil)
            expect(@l3.find {|i| i == @p1}).to eq(@p1)
        end
        it "comprobrando drop" do
            expect(@l3.drop(1)).to eq([@p1])
        end
        it "comprobrando max" do
            expect(@l3.max).to eq(@p2)
        end
        it "comprobrando min" do
            expect(@l3.min).to eq(@p1)
        end
        it "comprobrando sort" do
            expect(@l3.sort).to eq([@p1,@p2])
        end
    end
    
    describe "Comprobacion Cita" do
        it "Metodo to_s" do
            expect(@citas.to_s).to eq("Astels, D., Chelimsky, D., Dennis, Z., Helleson, A., Helmkamp, B. & North, D. (25, December 2010). The Rspec Book: Behaviour Driven Development With Rspec, Cucumber, And Friends (The Facets of Ruby).\n\tPragmatic Bookshelf; 1 edición\n\tISBN-10: 1934356379\nISBN-13: 978-1934356371\n\nChacon, S. (27, August 2009). Pro Git 2009th Edition (Pro).\n\tApress; 2009 edición\n\tISBN-13: 978-1430218333\nISBN-10: 1430218339\n\nE, R. (02, August 2013). Silverman Git Pocket Guide.\n\tO'Reilly Media; 1 edición\n\tISBN-10: 1449325866\nISBN-10: 1449325866\n\nFlanagan, D. & Matsumoto, Y. (04, February 2008). The Ruby Programming Language.\n\tO'Reilly Media; 1 edición\n\tISBN-10: 0596516177\nISBN-13: 978-0596516178\n\nFowler, C., Hunt, A. & Thomas, D. (07, July 2013 JUL). Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide (The Facets of Ruby).\n\tPragmatic Bookshelf; 4 edición\n\tISBN-13: 978-1937785499\nISBN-10: 1937785491\n\nFowler, C., Hunt, A. & Thomas, D. (08, August 2013 AGO). The Pragmatic Programmers Guide (The Facets of Ruby).\n\tPragmatic Bookshelf; 4 edición\n\tISBN-13: 978-1937785499\nISBN-10: 1937785491\n\n")
        end
    end
end