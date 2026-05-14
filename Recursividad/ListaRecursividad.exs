defmodule Lista do

  def imprimir([]) do #Caso base
    :ok
  end

  def imprimir([cabeza | cola]) do
    IO.puts(cabeza)
    imprimir(cola)
  end

end
Lista.imprimir([10, 20, 30])
