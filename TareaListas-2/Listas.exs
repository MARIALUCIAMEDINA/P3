defmodule ListaPrograma do

  # ---------------- MAIN ----------------
  def main do
    Util.mostrar_mensaje("=== PROGRAMA DE MANIPULACIÓN DE LISTAS ===")
    menu([])
  end

  # ---------------- MENÚ ----------------
  def menu(lista) do
    opcion =
      """
      -------- MENÚ --------
      1. Agregar número
      2. Mostrar lista
      3. Buscar número
      4. Eliminar número
      5. Sumar lista
      6. Número mayor
      7. Salir
      """
      |> Util.ingresar(:entero)

    case opcion do
      1 ->
        numero = Util.ingresar("Ingrese el número a agregar: ", :entero)
        nueva_lista = agregar(lista, numero)
        menu(nueva_lista)

      2 ->
        mostrar_resultado(mostrar(lista))
        menu(lista)

      3 ->
        numero = Util.ingresar("Ingrese el número a buscar: ", :entero)
        mostrar_resultado(buscar(lista, numero))
        menu(lista)

      4 ->
        numero = Util.ingresar("Ingrese el número a eliminar: ", :entero)
        nueva_lista = eliminar(lista, numero)
        menu(nueva_lista)

      5 ->
        mostrar_resultado(sumar(lista))
        menu(lista)

      6 ->
        mostrar_resultado(mayor(lista))
        menu(lista)

      7 ->
        Util.mostrar_mensaje("Programa finalizado.")

      _ ->
        Util.mostrar_error("Opción inválida")
        menu(lista)
    end
  end

  # ---------------- FUNCIONES ----------------

  # Agregar
  def agregar(lista, numero) do
    nueva_lista = lista ++ [numero]
    Util.mostrar_mensaje("Número agregado correctamente.")
    nueva_lista
  end

  # Mostrar
  def mostrar([]), do: {:error, "La lista está vacía"}
  def mostrar(lista), do: {:ok, "Lista actual: #{inspect(lista)}"}

  # Buscar
  def buscar([], _numero), do: {:error, "Número no encontrado"}

  def buscar([head | tail], numero) do
    if head == numero do
      {:ok, "El número #{numero} sí está en la lista"}
    else
      buscar(tail, numero)
    end
  end

  # Eliminar (elimina la primera aparición)
  def eliminar([], _numero) do
    Util.mostrar_error("Número no encontrado")
    []
  end

  def eliminar([head | tail], numero) do
    if head == numero do
      Util.mostrar_mensaje("Número eliminado correctamente.")
      tail
    else
      [head | eliminar(tail, numero)]
    end
  end

  # Sumar
  def sumar([]), do: {:error, "La lista está vacía"}
  def sumar(lista), do: {:ok, "La suma es: #{Enum.sum(lista)}"}

  # Mayor
  def mayor([]), do: {:error, "La lista está vacía"}
  def mayor(lista), do: {:ok, "El número mayor es: #{Enum.max(lista)}"}

  # Mostrar resultado
  def mostrar_resultado({:ok, mensaje}) do
    Util.mostrar_mensaje(mensaje)
  end

  def mostrar_resultado({:error, mensaje}) do
    Util.mostrar_error(mensaje)
  end

end

ListaPrograma.main()
