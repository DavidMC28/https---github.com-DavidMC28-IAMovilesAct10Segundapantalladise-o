import 'package:flutter/material.dart';

void main() {
  runApp(const MiPerfilApp());
}

class MiPerfilApp extends StatelessWidget {
  const MiPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantalla de Perfil - David Macias',
      theme: ThemeData(
        primaryColor: const Color(0xFFC0D6E4),
      ),
      home: const PantallaPerfil(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    // Definición de colores según tu dibujo
    const Color colorAzulClaro = Color(0xFFC0D6E4); 
    const Color colorAmarillo = Color(0xFFFFEB3B); 
    const Color colorBordeVerde = Color(0xFFB2DFDB); 
    
    final TextStyle estiloTextoItem = TextStyle(
      fontSize: 18,
      color: Colors.black.withAlpha(178),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER (Azul Claro) ---
            Container(
              height: 140,
              width: double.infinity,
              color: colorAzulClaro,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Text(
                      'Perfil',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withAlpha(153),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 20,
                    child: Icon(
                      Icons.person_outline,
                      size: 80,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),

            // --- LÍNEA AMARILLA SUPERIOR ---
            Container(
              height: 10,
              width: double.infinity,
              color: colorAmarillo,
            ),

            // --- CUERPO PRINCIPAL ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Usuario con Cupones abajo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: colorBordeVerde, width: 3),
                              ),
                              child: const Icon(Icons.person_outline, size: 35),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '0\ncupones',
                              textAlign: TextAlign.center,
                              style: estiloTextoItem,
                            ),
                          ],
                        ),
                        const Icon(Icons.edit, color: colorAmarillo, size: 30),
                      ],
                    ),
                    
                    const SizedBox(height: 30),

                    // Lista de opciones
                    _construirItem(Icons.storefront_outlined, 'Pagos y compras', estiloTextoItem),
                    _construirItem(Icons.settings_outlined, 'Ajustes', estiloTextoItem),
                    _construirItem(
                      Icons.navigation_outlined, 
                      'Ubicacion', 
                      estiloTextoItem, 
                      esTriangulo: true
                    ),
                    _construirItem(Icons.dark_mode_outlined, 'tema', estiloTextoItem),
                  ],
                ),
              ),
            ),

            // --- LÍNEA AMARILLA INFERIOR ---
            Container(
              height: 18,
              width: double.infinity,
              color: colorAmarillo,
            ),

            // --- FOOTER CON FONDO AZUL ---
            Container(
              width: double.infinity,
              color: colorAzulClaro, // Mismo color que el header
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'David Macias 6-I',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withAlpha(153),
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para las filas de la lista
  Widget _construirItem(IconData icono, String texto, TextStyle estilo, {bool esTriangulo = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          esTriangulo 
            ? Transform.rotate(angle: 0.5, child: Icon(icono, size: 28)) 
            : Icon(icono, size: 28),
          const SizedBox(width: 20),
          Flexible(
            child: Text(texto, style: estilo),
          ),
        ],
      ),
    );
  }
}