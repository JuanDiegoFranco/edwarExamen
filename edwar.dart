import 'dart:io';

void main() {
  bool conti = true;
  List<Map<String, dynamic>> productos = [];

  String leerTexto(String mensaje) {
    String? valor;
    do {
      print(mensaje);
      valor = stdin.readLineSync();
      if (valor == null || valor.trim().isEmpty) {
        print("malo mi viejo");
      }
    } while (valor == null || valor.trim().isEmpty);
    return valor.trim();
  }

  int leerEntero(String mensaje) {
    int? valor;
    do {
      print(mensaje);
      String? entrada = stdin.readLineSync();
      valor = int.tryParse(entrada ?? "");
      if (valor == null) {
        print("malo");
      }
    } while (valor == null);
    return valor;
  }

  double leerDecimal(String mensaje) {
    double? valor;
    do {
      print(mensaje);
      String? entrada = stdin.readLineSync();
      valor = double.tryParse(entrada ?? "");
      if (valor == null) {
        print("malo");
      }
    } while (valor == null);
    return valor;
  }

  void agregarProducto() {
    String nombre = leerTexto("Ingrese el nombre del producto:");
    int cantidad = leerEntero("Ingrese la cantidad del producto:");
    double precio = leerDecimal("Ingrese el precio del producto:");

    productos.add({
      'nombre': nombre,
      'cantidad': cantidad,
      'precio': precio
    });
    print("Melo");
  }

  void listarProductos() {
    if (productos.isEmpty) {
      print("Vacío no hay productos");
      return;
    }
    print("Productos que hay en el momento::");
    for (var i = 0; i < productos.length; i++) {
      print("Producto ${i + 1}:");
      print(
          "Nombre: ${productos[i]['nombre']}, Cantidad: ${productos[i]['cantidad']}, Precio: ${productos[i]['precio']}");
    }
  }

  void eliminarProducto() {
    if (productos.isEmpty) {
      print("Vacío no hay productos");
      return;
    }
    listarProductos();
    int numero = leerEntero("DIGITE el numero del producto que quiere eliminar") - 1;
    if (numero < 0 || numero >= productos.length) {
      print("esta malo");
      return;
    }
    productos.removeAt(numero);
    print("ya se eliminó el producto gracias");
  }

  void actualizarProducto() {
    if (productos.isEmpty) {
      print("Vacío no hay productos");
      return;
    }

    listarProductos();
    int numero2 = leerEntero("DIGITE el numero del producto que quiere ACTUALIZAR") - 1;

    if (numero2 < 0 || numero2 >= productos.length) {
      print("esta malo");
      return;
    }

    // Obtener el producto actual
    var producto = productos[numero2];

    print("Ingrese los nuevos datos del producto");

    print("Nombre actual: ${producto['nombre']}");
    String? nuevoNombre = stdin.readLineSync();
    if (nuevoNombre == null || nuevoNombre.trim().isEmpty) {
      nuevoNombre = producto['nombre'];
    }

    print("Cantidad actual: ${producto['cantidad']}");
    String? entradaCantidad = stdin.readLineSync();
    int nuevaCantidad;
    if (entradaCantidad == null || entradaCantidad.trim().isEmpty) {
      nuevaCantidad = producto['cantidad'];
    } else {
      nuevaCantidad = int.tryParse(entradaCantidad) ?? producto['cantidad'];
    }

    print("Precio actual: ${producto['precio']}");
    String? entradaPrecio = stdin.readLineSync();
    double nuevoPrecio;
    if (entradaPrecio == null || entradaPrecio.trim().isEmpty) {
      nuevoPrecio = producto['precio'];
    } else {
      nuevoPrecio = double.tryParse(entradaPrecio) ?? producto['precio'];
    }

    productos[numero2] = {
      'nombre': nuevoNombre,
      'cantidad': nuevaCantidad,
      'precio': nuevoPrecio
    };

    print("ya melooooooo");
  }

  while (conti) {
    print("Seleccione una opción:");
    print("Agregar productos - 1");
    print("Listar productos - 2");
    print("Actualizar productos - 3");
    print("Eliminar productos - 4");
    print("Salir - 5");
    String opcion = leerTexto("Digite su opción:");

    switch (opcion) {
      case "1":
        agregarProducto();
        break;
      case "2":
        listarProductos();
        break;
      case "3":
        actualizarProducto();
        break;
      case "4":
        eliminarProducto();
        break;
      case "5":
        conti = false;
        print("Chaoooooooooooooooooooooo");
        break;
      default:
        print("Error pa la casa");
    }
  }
}