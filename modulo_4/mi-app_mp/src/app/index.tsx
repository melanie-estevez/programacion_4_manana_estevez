// app/index.tsx
import React, { ReactNode, useState } from 'react'
import { Modal, Pressable, SafeAreaView, ScrollView, StyleSheet, Text, View } from 'react-native'

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Props tipadas — TarjetaPlato                        │
// │  2  Paso 2  children y composición — Card reutilizable          │
// │  3  Paso 3  Props opcionales y BadgeEstado                      │
// │  4  Paso 4  ScrollView y SafeAreaView                           │
// │  5  Paso 5  Modal de confirmación                               │
// │  6  Paso 6  Pantalla completa — detalle de mesa                 │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 6

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    case 3: return <Paso3 />
    case 4: return <Paso4 />
    case 5: return <Paso5 />
    case 6: return <Paso6 />
    default:
      return (
        <View style={styles.centrado}>
          <Text>Paso {PASO}: crea el componente primero</Text>
        </View>
      )
  }
}

// ─── Paso 1 — Props tipadas ──────────────────────────────────────────

interface TarjetaPlatoProps {
  nombre: string
  categoria: string
  descripcion: string
  precio: number
}

function TarjetaPlato({ nombre, categoria, descripcion, precio }: TarjetaPlatoProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombrePlato}>{nombre}</Text>
      <Text style={styles.datoCategoria}>{categoria} · ${precio.toFixed(2)}</Text>
      <Text style={styles.datoDescripcion}>{descripcion}</Text>
    </View>
  )
}

function Paso1() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.encabezado}>Carta del restaurante</Text>
      <TarjetaPlato
        nombre="Pizza Margarita"
        categoria="Pizzas"
        descripcion="Tomate, mozzarella y albahaca fresca"
        precio={12.5}
      />
      <TarjetaPlato
        nombre="Pasta Carbonara"
        categoria="Pastas"
        descripcion="Huevo, panceta, pecorino y pimienta"
        precio={14.0}
      />
      <TarjetaPlato
        nombre="Ensalada César"
        categoria="Entradas"
        descripcion="Lechuga, pollo, crutones y aderezo césar"
        precio={9.5}
      />
    </View>
  )
}

// ─── Paso 2 — children y composición ────────────────────────────────

interface CardProps {
  titulo: string
  subtitulo?: string
  children: ReactNode
}

function Card({ titulo, subtitulo, children }: CardProps) {
  return (
    <View style={estilos2.card}>
      <View style={estilos2.cardCabecera}>
        <Text style={estilos2.cardTitulo}>{titulo}</Text>
        {subtitulo && (
          <Text style={estilos2.cardSubtitulo}>{subtitulo}</Text>
        )}
      </View>
      <View style={estilos2.cardCuerpo}>{children}</View>
    </View>
  )
}

function FilaInfo({ etiqueta, valor }: { etiqueta: string; valor: string }) {
  return (
    <View style={estilos2.fila}>
      <Text style={estilos2.etiqueta}>{etiqueta}</Text>
      <Text style={estilos2.valor}>{valor}</Text>
    </View>
  )
}

function Paso2() {
  return (
    <View style={estilos2.fondo}>
      <Text style={estilos2.titulo}>Detalle de mesa</Text>

      <Card titulo="Mesa 7" subtitulo="Terraza · 4 personas">
        <FilaInfo etiqueta="Camarero" valor="Ana López" />
        <FilaInfo etiqueta="Hora llegada" valor="19:45" />
        <FilaInfo etiqueta="Pedido" valor="#1042" />
        <FilaInfo etiqueta="Platos" valor="3 ítems" />
        <FilaInfo etiqueta="Total" valor="$36.00" />
      </Card>

      <Card titulo="Pedido actual">
        <FilaInfo etiqueta="Pizza Margarita" valor="× 2" />
        <FilaInfo etiqueta="Ensalada César" valor="× 1" />
        <FilaInfo etiqueta="Agua con gas" valor="× 2" />
      </Card>
    </View>
  )
}

// ─── Paso 3 — Props opcionales y BadgeEstado ─────────────────────────

type EstadoMesa = 'libre' | 'ocupada' | 'esperando' | 'cuenta'

interface BadgeEstadoProps {
  estado: EstadoMesa
  tamaño?: number
  mostrarIcono?: boolean
}

const COLOR_ESTADO: Record<EstadoMesa, { fondo: string; texto: string }> = {
  libre:     { fondo: '#e8f5e9', texto: '#2e7d32' },
  ocupada:   { fondo: '#fff3e0', texto: '#e65100' },
  esperando: { fondo: '#fff8e1', texto: '#f57f17' },
  cuenta:    { fondo: '#fce4ec', texto: '#c62828' },
}

const ICONO_ESTADO: Record<EstadoMesa, string> = {
  libre:     '●',
  ocupada:   '◐',
  esperando: '○',
  cuenta:    '✕',
}

function BadgeEstado({
  estado,
  tamaño = 12,
  mostrarIcono = false,
}: BadgeEstadoProps) {
  const colores = COLOR_ESTADO[estado]
  return (
    <View style={[estilos3.badge, { backgroundColor: colores.fondo }]}>
      {mostrarIcono && (
        <Text style={[estilos3.icono, { color: colores.texto, fontSize: tamaño }]}>
          {ICONO_ESTADO[estado]}{' '}
        </Text>
      )}
      <Text style={[estilos3.textoBadge, { color: colores.texto, fontSize: tamaño }]}>
        {estado.toUpperCase()}
      </Text>
    </View>
  )
}

interface FilaMesaProps {
  nombre: string
  zona: string
  estado: EstadoMesa
  minutos?: number
}

function FilaMesa({ nombre, zona, estado, minutos }: FilaMesaProps) {
  return (
    <View style={estilos3.fila}>
      <View style={estilos3.infoIzq}>
        <Text style={estilos3.nombreMesa}>{nombre}</Text>
        <Text style={estilos3.zonaTexto}>{zona}</Text>
      </View>
      <View style={estilos3.infoDer}>
        {minutos !== undefined && (
          <Text style={estilos3.minutos}>{minutos} min</Text>
        )}
        <BadgeEstado estado={estado} mostrarIcono tamaño={11} />
      </View>
    </View>
  )
}

function Paso3() {
  return (
    <View style={estilos3.fondo}>
      <Text style={estilos3.titulo}>Estado de las mesas</Text>
      <FilaMesa nombre="Mesa 1"  zona="Salón"   estado="libre"                    />
      <FilaMesa nombre="Mesa 3"  zona="Salón"   estado="ocupada"   minutos={25}   />
      <FilaMesa nombre="Mesa 5"  zona="Terraza" estado="esperando" minutos={12}   />
      <FilaMesa nombre="Mesa 7"  zona="Terraza" estado="cuenta"                   />
      <FilaMesa nombre="Mesa 9"  zona="Barra"   estado="ocupada"   minutos={40}   />
    </View>
  )
}

// ─── Paso 4 — ScrollView y SafeAreaView ──────────────────────────────

const PEDIDOS_DEMO = [
  { id: '1',  mesa: 'Mesa 1',  plato: 'Pizza Margarita',    cocina: 80, tiempo: 12 },
  { id: '2',  mesa: 'Mesa 2',  plato: 'Pasta Carbonara',    cocina: 45, tiempo: 8  },
  { id: '3',  mesa: 'Mesa 3',  plato: 'Ensalada César',     cocina: 20, tiempo: 5  },
  { id: '4',  mesa: 'Mesa 4',  plato: 'Risotto funghi',     cocina: 90, tiempo: 18 },
  { id: '5',  mesa: 'Mesa 5',  plato: 'Tiramisú',           cocina: 10, tiempo: 3  },
  { id: '6',  mesa: 'Mesa 6',  plato: 'Lasagna boloñesa',   cocina: 70, tiempo: 15 },
  { id: '7',  mesa: 'Mesa 7',  plato: 'Pizza 4 quesos',     cocina: 55, tiempo: 10 },
  { id: '8',  mesa: 'Mesa 8',  plato: 'Sopa del día',       cocina: 30, tiempo: 6  },
  { id: '9',  mesa: 'Mesa 9',  plato: 'Filete a la brasa',  cocina: 95, tiempo: 22 },
  { id: '10', mesa: 'Mesa 10', plato: 'Bruschetta',         cocina: 15, tiempo: 4  },
  { id: '11', mesa: 'Mesa 11', plato: 'Gelato artesanal',   cocina: 5,  tiempo: 2  },
  { id: '12', mesa: 'Mesa 12', plato: 'Paella mixta',       cocina: 85, tiempo: 25 },
]

interface BarraUsoProps {
  porcentaje: number
  etiqueta: string
}

function BarraUso({ porcentaje, etiqueta }: BarraUsoProps) {
  const color = porcentaje > 85 ? '#c62828'
              : porcentaje > 60 ? '#f57f17'
              : '#2e7d32'
  return (
    <View style={estilos4.barraFila}>
      <Text style={estilos4.barraEtiqueta}>{etiqueta}</Text>
      <View style={estilos4.barraFondo}>
        <View style={[estilos4.barraRelleno, { width: `${porcentaje}%` as any, backgroundColor: color }]} />
      </View>
      <Text style={[estilos4.barraPct, { color }]}>{porcentaje}%</Text>
    </View>
  )
}

function TarjetaPedido({ mesa, plato, cocina, tiempo }: typeof PEDIDOS_DEMO[0]) {
  return (
    <View style={estilos4.nodo}>
      <View style={estilos4.nodoEncabezado}>
        <Text style={estilos4.nodoNombre}>{mesa}</Text>
        <Text style={estilos4.nodoIp}>{tiempo} min</Text>
      </View>
      <Text style={estilos4.nodoOs}>{plato}</Text>
      <BarraUso porcentaje={cocina} etiqueta="Prep" />
    </View>
  )
}

function Paso4() {
  return (
    <SafeAreaView style={estilos4.safeArea}>
      <View style={estilos4.header}>
        <Text style={estilos4.headerTitulo}>Pedidos en cocina</Text>
        <Text style={estilos4.headerSub}>{PEDIDOS_DEMO.length} pedidos activos</Text>
      </View>
      <ScrollView
        style={estilos4.scroll}
        contentContainerStyle={estilos4.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        {PEDIDOS_DEMO.map((pedido) => (
          <TarjetaPedido key={pedido.id} {...pedido} />
        ))}
      </ScrollView>
    </SafeAreaView>
  )
}

// ─── Paso 5 — Modal de confirmación ──────────────────────────────────

interface ModalConfirmProps {
  visible: boolean
  titulo: string
  mensaje: string
  etiquetaConfirmar?: string
  etiquetaCancelar?: string
  onConfirmar: () => void
  onCancelar: () => void
}

function ModalConfirm({
  visible,
  titulo,
  mensaje,
  etiquetaConfirmar = 'Confirmar',
  etiquetaCancelar = 'Cancelar',
  onConfirmar,
  onCancelar,
}: ModalConfirmProps) {
  return (
    <Modal
      visible={visible}
      transparent
      animationType="fade"
      onRequestClose={onCancelar}
    >
      <Pressable style={estilos5.fondo} onPress={onCancelar}>
        <Pressable style={estilos5.dialogo} onPress={() => {}}>
          <Text style={estilos5.dialogoTitulo}>{titulo}</Text>
          <Text style={estilos5.dialogoMensaje}>{mensaje}</Text>
          <View style={estilos5.botones}>
            <Pressable
              style={[estilos5.boton, estilos5.botonCancelar]}
              onPress={onCancelar}
            >
              <Text style={estilos5.textoCancelar}>{etiquetaCancelar}</Text>
            </Pressable>
            <Pressable
              style={[estilos5.boton, estilos5.botonConfirmar]}
              onPress={onConfirmar}
            >
              <Text style={estilos5.textoConfirmar}>{etiquetaConfirmar}</Text>
            </Pressable>
          </View>
        </Pressable>
      </Pressable>
    </Modal>
  )
}

function Paso5() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionEjecutada, setAccionEjecutada] = useState<string | null>(null)

  return (
    <SafeAreaView style={estilos5.safeArea}>
      <Text style={estilos5.titulo}>Gestión de mesa</Text>
      <Text style={estilos5.subtitulo}>Mesa 7 · Terraza · Pedido #1042</Text>

      <View style={estilos5.acciones}>
        <Pressable
          style={estilos5.botonAccion}
          onPress={() => {
            setAccionEjecutada(null)
            setModalVisible(true)
          }}
        >
          <Text style={estilos5.textoAccion}>Cancelar pedido</Text>
        </Pressable>
      </View>

      {accionEjecutada && (
        <View style={estilos5.resultado}>
          <Text style={estilos5.textoResultado}>{accionEjecutada}</Text>
        </View>
      )}

      <ModalConfirm
        visible={modalVisible}
        titulo="Cancelar pedido"
        mensaje={`¿Confirmas cancelar el pedido de Mesa 7?\nLos platos en preparación se descartarán.`}
        etiquetaConfirmar="Cancelar pedido"
        onConfirmar={() => {
          setModalVisible(false)
          setAccionEjecutada('Pedido #1042 cancelado a las ' + new Date().toLocaleTimeString())
        }}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  )
}

// ─── Paso 6 — Pantalla completa ──────────────────────────────────────

interface AccionProps {
  etiqueta: string
  color: string
  onPress: () => void
}

function BotonAccion({ etiqueta, color, onPress }: AccionProps) {
  return (
    <Pressable
      style={({ pressed }) => [
        estilos6.botonAccion,
        { backgroundColor: color },
        pressed && { opacity: 0.75 },
      ]}
      onPress={onPress}
    >
      <Text style={estilos6.textoBotonAccion}>{etiqueta}</Text>
    </Pressable>
  )
}

function Paso6() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionPendiente, setAccionPendiente] = useState<string>('')
  const [log, setLog] = useState<string[]>([])

  function pedirConfirmacion(accion: string) {
    setAccionPendiente(accion)
    setModalVisible(true)
  }

  function ejecutarAccion() {
    const entrada = `[${new Date().toLocaleTimeString()}] ${accionPendiente} en Mesa 7`
    setLog((prev) => [entrada, ...prev])
    setModalVisible(false)
  }

  return (
    <SafeAreaView style={estilos6.safeArea}>
      <View style={estilos6.cabecera}>
        <View>
          <Text style={estilos6.cabNombre}>Mesa 7</Text>
          <Text style={estilos6.cabIp}>Terraza · 4 personas · Pedido #1042</Text>
        </View>
        <BadgeEstado estado="ocupada" mostrarIcono tamaño={12} />
      </View>

      <ScrollView
        contentContainerStyle={estilos6.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        <Card titulo="Resumen del pedido" subtitulo="Última actualización: hace 2 min">
          <FilaInfo etiqueta="Pizza Margarita" valor="× 2 · $25.00" />
          <FilaInfo etiqueta="Ensalada César" valor="× 1 · $9.50" />
          <FilaInfo etiqueta="Agua con gas" valor="× 2 · $4.00" />
          <FilaInfo etiqueta="Subtotal" valor="$38.50" />
          <FilaInfo etiqueta="Tiempo en mesa" valor="32 minutos" />
        </Card>

        <Card titulo="Detalle de la mesa">
          <FilaInfo etiqueta="Zona" valor="Terraza" />
          <FilaInfo etiqueta="Camarero" valor="Ana López" />
          <FilaInfo etiqueta="Hora llegada" valor="19:45" />
          <FilaInfo etiqueta="Reservada" valor="Sí · a nombre de Carlos" />
          <FilaInfo etiqueta="Notas" valor="Sin gluten en la pizza" />
        </Card>

        <Card titulo="Acciones">
          <View style={estilos6.gridAcciones}>
            <BotonAccion
              etiqueta="Agregar plato"
              color="#bf360c"
              onPress={() => pedirConfirmacion('Agregar plato')}
            />
            <BotonAccion
              etiqueta="Pedir cuenta"
              color="#b71c1c"
              onPress={() => pedirConfirmacion('Pedir cuenta')}
            />
            <BotonAccion
              etiqueta="Llamar cocina"
              color="#2e7d32"
              onPress={() => pedirConfirmacion('Llamar cocina')}
            />
            <BotonAccion
              etiqueta="Liberar mesa"
              color="#6a1b9a"
              onPress={() => pedirConfirmacion('Liberar mesa')}
            />
          </View>
        </Card>

        {log.length > 0 && (
          <Card titulo="Actividad reciente">
            {log.map((entrada, i) => (
              <Text key={i} style={estilos6.entradaLog}>{entrada}</Text>
            ))}
          </Card>
        )}
      </ScrollView>

      <ModalConfirm
        visible={modalVisible}
        titulo={`Confirmar: ${accionPendiente}`}
        mensaje={`¿Ejecutar "${accionPendiente}" en Mesa 7?\nEsta acción afectará el servicio.`}
        etiquetaConfirmar="Ejecutar"
        onConfirmar={ejecutarAccion}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  )
}

// ─── Estilos ─────────────────────────────────────────────────────────

const styles = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#faf6f1',
    padding: 20,
    paddingTop: 60,
    gap: 12,
  },
  centrado: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  encabezado: {
    fontSize: 20,
    fontWeight: '700',
    color: '#3e2723',
    marginBottom: 4,
  },
  tarjeta: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    padding: 16,
    gap: 4,
    shadowColor: '#000',
    shadowOpacity: 0.06,
    shadowRadius: 4,
    shadowOffset: { width: 0, height: 2 },
    elevation: 2,
  },
  nombrePlato: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1a1a1a',
  },
  datoCategoria: {
    fontSize: 13,
    color: '#bf360c',
    fontFamily: 'monospace',
  },
  datoDescripcion: {
    fontSize: 12,
    color: '#757575',
  },
})

const estilos2 = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#faf6f1',
    padding: 20,
    paddingTop: 60,
    gap: 16,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#3e2723',
  },
  card: {
    backgroundColor: '#ffffff',
    borderRadius: 12,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOpacity: 0.07,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
    elevation: 3,
  },
  cardCabecera: {
    backgroundColor: '#bf360c',
    paddingHorizontal: 16,
    paddingVertical: 12,
    gap: 2,
  },
  cardTitulo: {
    fontSize: 16,
    fontWeight: '700',
    color: '#ffffff',
  },
  cardSubtitulo: {
    fontSize: 12,
    color: '#ffccbc',
  },
  cardCuerpo: {
    padding: 12,
    gap: 8,
  },
  fila: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  etiqueta: {
    fontSize: 13,
    color: '#546e7a',
    fontWeight: '500',
  },
  valor: {
    fontSize: 13,
    color: '#1a1a1a',
    fontFamily: 'monospace',
  },
})

const estilos3 = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#faf6f1',
    padding: 20,
    paddingTop: 60,
    gap: 8,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#3e2723',
    marginBottom: 8,
  },
  fila: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    paddingHorizontal: 16,
    paddingVertical: 14,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOpacity: 0.05,
    shadowRadius: 3,
    shadowOffset: { width: 0, height: 1 },
    elevation: 1,
  },
  infoIzq: { gap: 2 },
  infoDer: { alignItems: 'flex-end', gap: 4 },
  nombreMesa: { fontSize: 14, fontWeight: '600', color: '#1a1a1a' },
  zonaTexto: { fontSize: 12, color: '#90a4ae', fontFamily: 'monospace' },
  minutos: { fontSize: 11, color: '#546e7a' },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 4,
    paddingHorizontal: 6,
    paddingVertical: 2,
  },
  icono: { fontWeight: '700' },
  textoBadge: { fontWeight: '600' },
})

const estilos4 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#2c1810',
  },
  header: {
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#4e342e',
  },
  headerTitulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#ffccbc',
  },
  headerSub: {
    fontSize: 12,
    color: '#a1887f',
    marginTop: 2,
  },
  scroll: { flex: 1 },
  scrollContenido: {
    padding: 16,
    gap: 10,
    paddingBottom: 40,
  },
  nodo: {
    backgroundColor: '#3e2723',
    borderRadius: 10,
    padding: 14,
    gap: 8,
    borderWidth: 1,
    borderColor: '#5d4037',
  },
  nodoEncabezado: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'baseline',
  },
  nodoNombre: {
    fontSize: 14,
    fontWeight: '700',
    color: '#ffccbc',
  },
  nodoIp: {
    fontSize: 12,
    color: '#ffab91',
    fontFamily: 'monospace',
  },
  nodoOs: {
    fontSize: 11,
    color: '#a1887f',
    marginBottom: 2,
  },
  barraFila: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  barraEtiqueta: {
    fontSize: 11,
    color: '#a1887f',
    width: 28,
  },
  barraFondo: {
    flex: 1,
    height: 4,
    backgroundColor: '#5d4037',
    borderRadius: 2,
    overflow: 'hidden',
  },
  barraRelleno: {
    height: '100%',
    borderRadius: 2,
  },
  barraPct: {
    fontSize: 11,
    fontWeight: '600',
    width: 34,
    textAlign: 'right',
  },
})

const estilos5 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#faf6f1',
    padding: 24,
    paddingTop: 60,
  },
  titulo: {
    fontSize: 22,
    fontWeight: '700',
    color: '#3e2723',
  },
  subtitulo: {
    fontSize: 14,
    color: '#546e7a',
    marginTop: 4,
    marginBottom: 32,
    fontFamily: 'monospace',
  },
  acciones: { gap: 12 },
  botonAccion: {
    backgroundColor: '#b71c1c',
    borderRadius: 10,
    paddingVertical: 14,
    alignItems: 'center',
  },
  textoAccion: {
    color: '#fff',
    fontWeight: '700',
    fontSize: 15,
  },
  resultado: {
    marginTop: 24,
    backgroundColor: '#e8f5e9',
    borderRadius: 8,
    padding: 14,
  },
  textoResultado: {
    color: '#2e7d32',
    fontSize: 13,
    fontFamily: 'monospace',
  },
  fondo: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.55)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  dialogo: {
    backgroundColor: '#ffffff',
    borderRadius: 16,
    padding: 24,
    width: '85%',
    gap: 12,
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 12,
    shadowOffset: { width: 0, height: 6 },
    elevation: 10,
  },
  dialogoTitulo: {
    fontSize: 17,
    fontWeight: '700',
    color: '#1a1a1a',
  },
  dialogoMensaje: {
    fontSize: 14,
    color: '#546e7a',
    lineHeight: 20,
  },
  botones: {
    flexDirection: 'row',
    gap: 10,
    marginTop: 4,
  },
  boton: {
    flex: 1,
    borderRadius: 8,
    paddingVertical: 12,
    alignItems: 'center',
  },
  botonCancelar: {
    backgroundColor: '#f5f5f5',
  },
  botonConfirmar: {
    backgroundColor: '#b71c1c',
  },
  textoCancelar: {
    color: '#424242',
    fontWeight: '600',
    fontSize: 14,
  },
  textoConfirmar: {
    color: '#ffffff',
    fontWeight: '700',
    fontSize: 14,
  },
})

const estilos6 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#faf6f1',
  },
  cabecera: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingVertical: 14,
    backgroundColor: '#ffffff',
    borderBottomWidth: 1,
    borderBottomColor: '#efebe9',
  },
  cabNombre: {
    fontSize: 18,
    fontWeight: '700',
    color: '#3e2723',
  },
  cabIp: {
    fontSize: 12,
    color: '#78909c',
    fontFamily: 'monospace',
    marginTop: 2,
  },
  scrollContenido: {
    padding: 16,
    gap: 14,
    paddingBottom: 40,
  },
  gridAcciones: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 10,
  },
  botonAccion: {
    borderRadius: 8,
    paddingVertical: 10,
    paddingHorizontal: 16,
    minWidth: '45%',
    alignItems: 'center',
  },
  textoBotonAccion: {
    color: '#ffffff',
    fontWeight: '600',
    fontSize: 14,
  },
  entradaLog: {
    fontSize: 11,
    color: '#2e7d32',
    fontFamily: 'monospace',
    lineHeight: 18,
  },
})
