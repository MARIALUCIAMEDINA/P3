defmodule OperacionesMapas do

  def ejecutar do
    acceso()
    agregar()
    actualizar()
    eliminar()
    verificar()
    claves()
    valores()
  end

  # 1 Acceder a valores
  def acceso do
    IO.puts("\n ACCESO")
    mapa = %{nombre: "Maria", edad: 20}

    IO.puts("Nombre: #{mapa.nombre}")
    IO.puts("Edad: #{mapa[:edad]}")
  end

  # 2️ Agregar elemento
  def agregar do
    IO.puts("\n AGREGAR")
    mapa = %{nombre: "Maria"}

    nuevo = Map.put(mapa, :edad, 20)
    IO.inspect(nuevo)
  end

  # 3️ Actualizar elemento
  def actualizar do
    IO.puts("\n ACTUALIZAR")
    mapa = %{nombre: "Maria", edad: 20}

    actualizado = %{mapa | edad: 21}
    IO.inspect(actualizado)
  end

  # 4️ Eliminar clave
  def eliminar do
    IO.puts("\n ELIMINAR")
    mapa = %{nombre: "Maria", edad: 20}

    sin_edad = Map.delete(mapa, :edad)
    IO.inspect(sin_edad)
  end

  # 5️ Verificar clave
  def verificar do
    IO.puts("\n VERIFICAR")
    mapa = %{nombre: "Maria", edad: 20}

    IO.puts("¿Tiene edad? #{Map.has_key?(mapa, :edad)}")
  end

  # 6️ Obtener claves
  def claves do
    IO.puts("\n CLAVES")
    mapa = %{nombre: "Maria", edad: 20}

    IO.inspect(Map.keys(mapa))
  end

  # 7️ Obtener valores
  def valores do
    IO.puts("\n VALORES")
    mapa = %{nombre: "Maria", edad: 20}

    IO.inspect(Map.values(mapa))
  end

end

OperacionesMapas.ejecutar()
