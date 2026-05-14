defmodule Restaurante do

  # --- Proceso: Cocina ---
  def cocina do
    receive do
      {:orden, plato, mesero_pid} ->
        IO.puts("  🍳 Cocina: preparando '#{plato}'...")
        Process.sleep(800)
        send(mesero_pid, {:plato_listo, plato})
        cocina()
    end
  end

  # --- Proceso: Mesero ---
  def mesero(cocina_pid, cliente_pid) do
    receive do
      {:pedido, plato} ->
        IO.puts("  👨‍🍳 Mesero: recibí '#{plato}', avisando a cocina...")
        send(cocina_pid, {:orden, plato, self()})

        receive do
          {:plato_listo, plato} ->
            IO.puts("  🛎️  Mesero: listo, entregando '#{plato}'.")
            send(cliente_pid, {:entregado, plato})
        end

        mesero(cocina_pid, cliente_pid)
    end
  end

  # --- Función principal ---
  def abrir do
    IO.puts("\n🍽️  ¡Bienvenido al Restaurante Elixir!")
    IO.puts("   Escribe un plato y presiona Enter.")
    IO.puts("   Escribe 'salir' para cerrar.\n")

    cocina_pid = spawn(__MODULE__, :cocina, [])
    mesero_pid = spawn(__MODULE__, :mesero, [cocina_pid, self()])

    # Inicia el loop de lectura
    pedir(mesero_pid)
  end

  # --- Loop de consola ---
  defp pedir(mesero_pid) do
    # Lee lo que escribe el usuario
    entrada = IO.gets("👤 ¿Qué deseas pedir? ") |> String.trim()

    case entrada do
      "salir" ->
        IO.puts("\n👋 ¡Hasta pronto! Cerrando restaurante...\n")

      "" ->
        # Si no escribió nada, vuelve a preguntar
        IO.puts("  ⚠️  Escribe un plato o 'salir'.")
        pedir(mesero_pid)

      plato ->
        # Manda el pedido al mesero
        send(mesero_pid, {:pedido, plato})

        # Espera a que llegue el plato
        receive do
          {:entregado, plato} ->
            IO.puts("  ✅ ¡Aquí está tu #{plato}! Buen provecho.\n")
        end

        # Vuelve a preguntar
        pedir(mesero_pid)
    end
  end

end

Restaurante.abrir()
