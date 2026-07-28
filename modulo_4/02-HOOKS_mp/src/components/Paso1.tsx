// Paso 1 — useState: reintentos de envío de pedido a cocina
import { useState } from 'react'
import { Pressable, StyleSheet, Text, View } from 'react-native'

export default function Paso1() {
  const [intentos, setIntentos] = useState<number>(0)
  const [confirmado, setConfirmado] = useState<boolean>(false)

  function manejarReintento() {
    if (confirmado) return
    setIntentos(intentos + 1)
    // Simula éxito al tercer intento
    if (intentos >= 3) {
      setConfirmado(true)
    }
  }

  function reiniciar() {
    setIntentos(0)
    setConfirmado(false)
  }

  const estadoTexto = confirmado
    ? '✓ Pedido aceptado en cocina'
    : `Intento ${intentos} de 3: cocina no responde`

  const colorEstado = confirmado ? '#2e7d32' : '#c62828'

  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Envío de pedido a cocina</Text>

      <View style={[styles.tarjeta, { borderColor: colorEstado }]}>
        <Text style={[styles.estado, { color: colorEstado }]}>
          {estadoTexto}
        </Text>
        <Text style={styles.detalle}>Mesa 7 · Pizza Margarita × 2</Text>
      </View>

      <Pressable
        style={({ pressed }) => [
          styles.boton,
          confirmado ? styles.botonDeshabilitado : styles.botonActivo,
          pressed && !confirmado && { opacity: 0.75 },
        ]}
        onPress={manejarReintento}
        disabled={confirmado}
      >
        <Text style={styles.textoBoton}>
          {confirmado ? 'Pedido confirmado' : 'Reintentar envío'}
        </Text>
      </Pressable>

      <Pressable style={styles.botonSecundario} onPress={reiniciar}>
        <Text style={styles.textoSecundario}>Reiniciar simulación</Text>
      </Pressable>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    backgroundColor: '#faf6f1',
    gap: 16,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#3e2723',
  },
  tarjeta: {
    width: '100%',
    padding: 16,
    borderRadius: 10,
    borderWidth: 2,
    backgroundColor: '#fff',
    gap: 6,
  },
  estado: {
    fontSize: 15,
    fontWeight: '600',
  },
  detalle: {
    fontSize: 13,
    color: '#666',
  },
  boton: {
    width: '100%',
    paddingVertical: 14,
    borderRadius: 8,
    alignItems: 'center',
  },
  botonActivo: {
    backgroundColor: '#bf360c',
  },
  botonDeshabilitado: {
    backgroundColor: '#a5d6a7',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 15,
  },
  botonSecundario: {
    paddingVertical: 10,
  },
  textoSecundario: {
    color: '#bf360c',
    fontSize: 14,
  },
})
