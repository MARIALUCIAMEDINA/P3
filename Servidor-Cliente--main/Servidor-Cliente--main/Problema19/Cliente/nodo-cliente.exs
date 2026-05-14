Code.require_file("util.ex")

defmodule NodoCliente do
  @nombre_servicio_local :servicio_respuesta
  @servicio_local {@nombre_servicio_local, :"nodocliente@172.20.10.2"}
  @nodo_remoto :"nodoservidor@172.20.10.3"
  @servicio_remoto {:servicio_cadenas, @nodo_remoto}

  @mensajes [
    {:mayusculas, "Juan"},
    {:mayusculas, "Ana"},
    {:minusculas, "Diana"},
    {&String.reverse/1, "Julián"},
    :fin
  ]

  def main() do
    Util.mostrar_mensaje("PROCESO PRINCIPAL")

    registrar_servicio(@nombre_servicio_local)

    establecer_conexion(@nodo_remoto)
    |> iniciar_produccion()
  end

  defp registrar_servicio(nombre),
    do: Process.register(self(), nombre)

  defp establecer_conexion(nodo),
    do: Node.connect(nodo)

  defp iniciar_produccion(false),
    do: Util.mostrar_error("No se pudo conectar")

  defp iniciar_produccion(true) do
    enviar_mensajes()
    recibir_respuestas()
  end

  defp enviar_mensajes() do
    Enum.each(@mensajes, &enviar_mensaje/1)
  end

  defp enviar_mensaje(mensaje) do
    send(@servicio_remoto, {@servicio_local, mensaje})
  end

  defp recibir_respuestas() do
    receive do
      :fin ->
        :ok

      respuesta ->
        Util.mostrar_mensaje("-> #{respuesta}")
        recibir_respuestas()
    end
  end
end

NodoCliente.main()
