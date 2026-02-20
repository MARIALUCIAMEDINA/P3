defmodule Util do
  def mostrar_mensaje(mensaje) do
    System.cmd("Java",["-cp", ".","Mensaje", mensaje])
  end
end

