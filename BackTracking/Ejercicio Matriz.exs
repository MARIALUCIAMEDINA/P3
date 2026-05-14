defmodule Recorrer do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    recorrer_matriz_diagonal(matriz, 0)
    sumar_diagonal_secundaria(matriz, length(matriz) - 1, 0)
    |> IO.puts()
  end

  def recorrer_matriz_diagonal([], _i) do
    :ok
  end

  def recorrer_matriz_diagonal([fila | resto], i) do
    # Print the diagonal element at column i (if it exists)
    if i < length(fila) do
      IO.write("#{Enum.at(fila, i)} ")
    end
    # Recurse on the rest of the matrix with incremented i
    recorrer_matriz_diagonal(resto, i + 1)
  end

  def sumar_diagonal_secundaria([], _n, _i) do
    0
  end

  def sumar_diagonal_secundaria([fila | resto], n, i) do
    if i < length(fila) do
      # Get the element from the secondary diagonal
      elemento = Enum.at(fila, n - i)
      # Recurse on the rest of the matrix with decremented n and incremented i
      elemento + sumar_diagonal_secundaria(resto, n, i + 1)
    else
      0
    end
  end


end


Recorrer.main()
