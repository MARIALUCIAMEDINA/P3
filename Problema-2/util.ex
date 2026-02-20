@moduledoc"""
Módulo con funciones que se reutilizan
- autor: María Lucia.
- fecha: 12/02/2026
- licencia: GNU GPL v3
"""
defmodule Util do
  def mostrar_mensaje(mensaje) do
    mensaje
  |>IO.puts()
  end
end
  defp ingresar_texto(mensaje) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end
