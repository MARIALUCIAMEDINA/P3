defmodule Util do

  def ingresar(mensaje, :entero),
    do: ingresar(mensaje, &String.to_integer/1, :entero)

  def ingresar(mensaje, :real),
    do: ingresar(mensaje, &String.to_float/1, :real)

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  defp ingresar(mensaje, parser, tipo_dato) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        IO.puts("Error: El valor ingresado no es un #{tipo_dato}. Por favor, intente nuevamente.")
        mensaje
        |> ingresar(parser, tipo_dato)
    end
  end

 def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

end
