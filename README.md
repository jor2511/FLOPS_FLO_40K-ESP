# FLO: Frontline Operations - 40K-ESP

**Versión Actual**: 1.6

Una dinámica misión de operaciones en primera línea para Arma 3 que crea un campo de batalla en evolución con fuerzas OPFOR inteligentes, sistemas logísticos y gestión de guarniciones.

Características
    Sistema de línea de frente dinámica con fuerzas OPFOR inteligentes
    Red avanzada de logística y suministros
    Sistema de gestión de guarniciones
    Mecánicas de recopilación de inteligencia y control de torres de voco
    Gestión automatizada de recursos para fuerzas OPFOR
    Sistema dinámico de generación de vehículos
    Equipamiento y configuraciones de facción personalizables

Instrucciones de Configuración
    Configuración Básica de la Misión
    Descarga los archivos de la misión (ASEGÚRATE DE EXTRAER EL PBO)
    Colócalos en la carpeta de misiones de Arma 3: Documents/Arma 3 (o Otro Perfil)/missions/
    Carga la misión en el editor de Arma 3 para personalizar la configuración


Personalización de Facciones
    Configuración de Fuerzas OPFOR
    
Hay dos formas de crear facciones:

1. Para uso individual o de comunidad:

Se recomienda utilizar los archivos:

    CUSTOM_CIVILIAN_FACTION
    
    CUSTOM_FRIENDLY_FACTION
    
    CUSTOM_ENEMY_FACTION
Para contribuciones en GitHub (uso público):
    Crea un nuevo archivo de facción en Scripts/factions/ (por ejemplo, opf_custom.sqf) con la siguiente estructura:

```sqf
// Vehicle Arrays
East_Ground_Vehicles_Light = [
    "O_MRAP_02_F",
    "O_MRAP_02_hmg_F"
];

East_Ground_Vehicles_Heavy = [
    "O_MBT_02_cannon_F",
    "O_APC_Tracked_02_cannon_F"
];

East_Air_Heli = [
    "O_Heli_Attack_02_F",
    "O_Heli_Light_02_F"
];

// Infantry Arrays
East_Units = [
    "O_Soldier_F",
    "O_Soldier_GL_F",
    "O_Soldier_AR_F"
];

// ... other arrays
```

Configuración de Pilones de Aeronaves AAC
Para configurar los pilones de aeronaves AAC, busca la función llamada fn_AirSupport.sqf.

```sqf
private _pylonMags = [
    "PylonRack_4Rnd_LG_scalpel",  // SCALPEL missiles
    "PylonRack_4Rnd_ACE_Hellfire_AGM114K",  // AGM-114K Hellfire
    "PylonRack_4Rnd_ACE_Hellfire_AGM114N",  // AGM-114N Hellfire
    "PylonRack_12Rnd_ACE_DAGR", // DAGR missiles 12x
    "PylonRack_24Rnd_ACE_DAGR", // DAGR missiles 24x
    "ace_hot_3_PylonRack_3Rnd", // HOT missiles 3x
    "ace_hot_3_PylonRack_4Rnd" // HOT missiles 4x
];
```

Configuración de Artillería
    Configura la munición de artillería en fn_ArtilleryPrep.sqf.

```sqf
private _artilleryMagazines = [
    "32Rnd_155mm_Mo_shells_O",
    "2Rnd_155mm_Mo_Cluster_O"
];
```

### Configuración del Mapa  

La misión utiliza tanto sistemas automáticos como manuales para colocar marcadores en el campo de batalla. Tienes dos opciones:  

#### Opción 1: Sistema de Marcadores Automático  
La misión incluye un sistema automático de marcadores (`init_Markers.sqf`) que:  
1. Coloca marcadores basados en características y objetos del mapa.  
2. Ajusta la densidad de marcadores según el parámetro `EnemyPrec`.  
3. Identifica y marca automáticamente:  
   - Torres de Vox (`loc_Transmitter`) cerca de `LocationEvacPoint_F`.  
   - Ubicaciones de apoyo (`o_support`) cerca de fábricas y estructuras militares.  
   - Instalaciones (`o_installation`, `n_installation`) en ciudades y capitales.  
   - Barracones (`loc_Ruin`) cerca de edificios militares.  
   - Sitios de Auspex (`loc_Power`) cerca de estructuras de auspex.  
   - Posiciones antiaéreas (`o_antiair`) en terreno elevado.  
   - Posiciones de infantería (`o_inf`) en aldeas.

Características clave del sistema automático:  
- Se centra en los objetos `LocationEvacPoint_F`.  
- Utiliza características del terreno, como montañas, para la colocación.  
- Mantiene distancias mínimas entre los marcadores.  
- Ajusta la densidad de los marcadores según el tamaño del mapa.  
- Coloca automáticamente infraestructura militar.

#### Consejos para la conversión de mapas
Al convertir la misión a un nuevo mapa:

#### 1. Ajustar la presencia enemiga:
- La escala predeterminada se basa en el tamaño del mapa: `worldSize / 2` (esto determina cuán denso será el mapa con objetivos, además del % de mapa jugable en el Menú de Diálogo).
- Edita el parámetro `EnemyPrec` para controlar la densidad general de los enemigos (valores más altos = menos marcadores).

#### 2. Configuración de infraestructura y sistema de marcadores
La misión utiliza `init_Markers.sqf` para colocar automáticamente los objetivos estratégicos basados en las características del mapa y los objetos colocados en el editor.

##### Objetos de marcador de ubicación  
Coloca los siguientes objetos en el editor para ayudar al sistema de marcadores a crear objetivos:

| Tipo de Objetivo               | Propósito                       | Tipo de Marcador  | Notas                                           |
|--------------------------------|---------------------------------|-------------------|-------------------------------------------------|
| `LocationEvacPoint_F`          | Puntos Claves de Distribución   | Varios            | Punto de referencia para los demás puntos       |
| `LocationBase_F`               | Bases Militares                 | `n_support`       | Instalaciones militares principales             |
| `LocationFOB_F`                | Bases de Operaciones Avanzadas  | `o_support`       | Cerca de puestos enemigos FOB                   |
| `LocationResupplyPoint_F`      | Fábricas o Puntos Logísticos    | `o_support`       | Zonas industriales/composiciones del estilo     |
| `LocationCamp_F`               | Barracones                      | `loc_Ruin`        | Barracones militares/composiciones del estilo   |
| `LocationCityCapital_F`        | Ciudades Capitales              | `n_installation`  | Grandes centros urbanos                         |
| `LocationCity_F`               | Ciudades                        | `o_installation`  | Centros urbanos                                 |
| `LocationVillage_F`            | Aldeas                          | `o_inf`           | Posiciones de infantería insurgente             |

##### Usando Nombres de Variable
También puedes usar objetos de Lógica con nombres de variables específicos:

| Nombre de la variable | Crea                        | Ejemplo de uso                        |
|-----------------------|-----------------------------|---------------------------------------|
| `"RadioTower"`        | Torres de voco              | Colócalas en terrenos elevados        |
| `"ResupplyPoint"`     | Puntos de suministro        | Colócalos en áreas industriales       |
| `"FOB"`               | Bases avanzadas             | Colócalas en ubicaciones estratégicas |
| `"BaseLocation"`      | Bases militares             | Alternativa a LocationBase_F          |
| `"Capital"`           | Marcadores de capital       | Alternativa a LocationCityCapital_F   |
| `"City"`              | Marcadores de ciudad        | Alternativa a LocationCity_F          |
| `"Village"`           | Marcadores de pueblo        | Alternativa a LocationVillage_F       |
| `"Barracks"`          | Marcadores de cuarteles     | Colócalos cerca de áreas militares    |
| `"RadarS"`            | Estaciones de auspex        | Colócalas en terrenos elevados        |
| `"AASite"`            | Posiciones de defensa aérea | Colócalas en cumbres de montañas      |

##### Detección de Objetos Físicos y Sistema de Variables  
El script depende principalmente de los objetos de ubicación y variables en lugar de detectar estructuras físicas. Aquí tienes una explicación más precisa de cómo funciona:

1. **Objetos de Ubicación**: El script primero intenta encontrar objetos de tipo ubicación específicos como `LocationBase_F`, `LocationCity_F`, etc.

2. **Objetos con Etiquetas de Variables**: Si no se encuentran objetos de ubicación, busca objetos (generalmente de Lógica) con nombres de variables específicos (por ejemplo, "RadioTower", "FOB").

3. **Mecanismo de Respaldo**: Si no se encuentran ninguno de estos, para la mayoría de los tipos de marcadores hará lo siguiente:
   - Encontrará una ubicación cercana en una montaña
   - Creará un marcador allí
   - Para las torres de radio específicamente, también creará un objeto de torre física.
  
El script **no** detecta automáticamente estructuras físicas como edificios de cuarteles o instalaciones de radar por defecto. En su lugar, necesitas:

- Colocar los objetos de ubicación apropiados (`LocationBase_F`, etc.)
- O agregar variables a los objetos (incluidos los objetos Lógicos)
- O dejar que el script utilice sus mecanismos de respaldo (generalmente colocando los marcadores en montañas)

Por ejemplo, colocar un `Land_Radar_F` por sí solo no creará automáticamente un marcador de auspex, a menos que:
- Le agregues la variable "RadarS", O
- Coloque un `LocationEvacPoint_F` cerca que lo utilice como punto de referencia

##### Buenas prácticas para la configuración de marcadores

1. **Comienza con los objetos `LocationEvacPoint_F`:**
   - Colócalos en puntos estratégicos clave alrededor del mapa
   - Actúan como puntos de referencia para colocar otros marcadores
   - Deben distribuirse de manera uniforme, evita agruparlos.

2. **Agrega objetos de ubicación especializados:**
   - Coloca `LocationBase_F` en las principales instalaciones militares.
   - Coloca `LocationCity_F` o `LocationCityCapital_F` en los centros urbanos.
   - Coloca `LocationFOB_F` en puntos militares estratégicos menores.
   - Coloca `LocationCamp_F` para instalaciones militares más pequeñas.

3. **Agrega estructuras físicas:**
   - Coloca torres de radio en terrenos elevados.
   - Agrega estructuras militares para darle más detalle al mapa.
   - Usa las características del terreno a tu favor (montañas para AA, etc.).

4. **Ajusta con marcadores Lógicos:**
   - Usa objetos Lógicos con variables para agregar marcadores específicos.
   - Útil para agregar posiciones exactas que no correspondan a estructuras físicas.

5. **Ajusta la posición segura para mapas con agua:**
   - Para mapas con mucha agua, el script usa `BIS_fnc_findSafePos` para asegurarse de que los marcadores estén en tierra firme.
   - El radio seguro predeterminado está establecido, pero puede ajustarse según la topografía específica del mapa.

##### Control de Densidad de Marcadores

El script escala automáticamente la densidad de los marcadores en función de:
- El parámetro global `EnemyPrec` (accesible en la configuración de la misión)
- El tamaño del mapa (calculado a partir de `worldSize`)
- Los factores de división para cada tipo de marcador

Para agregar más marcadores de un tipo específico, puedes:
1. Colocar más objetos del tipo correspondiente
2. Ajustar el factor de división en el script (más pequeño = más marcadores)
3. Reducir el parámetro `EnemyPrec`

##### Solución de Problemas Comunes

- **No aparecen marcadores**: Asegúrate de haber colocado los objetos `LocationEvacPoint_F`
- **Marcadores en el agua**: Verifica el parámetro `_useSafePos` y aumenta `_safeRadius`
- **Demasiados/pocos marcadores**: Ajusta `EnemyPrec` o coloca más/menos objetos de ubicación
- **Faltan tipos específicos de marcadores**: Asegúrate de haber colocado los objetos de ubicación correspondientes

#### 3. Posiciones de aparición:
- Las posiciones de aparición se seleccionarán cuando te unas por primera vez a la misión como Comandante de la Compañía. Se te presentará un Menú de Diálogo en el cual podrás seleccionar Facción, Niveles de agresión inicial, Relaciones iniciales con los civiles y más.

## Consejos de Personalización

### Sistema de Recursos
- Ajusta la generación de recursos de OPFOR en `Functions/Logistics/fn_opforResources.sqf`

### Sistema de Inteligencia
- Modifica las tasas de descomposición y los bonos de inteligencia en `Functions/Logistics/fn_intelSystem.sqf`
- Ajusta los beneficios de las torres de radio en el sistema de inteligencia

### Configuración de Rendimiento
- Configura la distancia de visión en `initServer.sqf`
- Ajusta los rangos de aparición dinámica en el administrador de guarnición

### Personalización del Arsenal
La misión utiliza un sistema de arsenal restringido (`fn_restrictedArsenal.sqf`) que funciona tanto con los arsenales de ACE como con los arsenales básicos. Puede ser desactivado o activado en los Parámetros del Lobby antes de comenzar la misión. Puedes personalizar el equipo disponible en las siguientes categorías:

#### Armas y Accesorios
```sqf
// Modify these arrays in fn_restrictedArsenal.sqf
private _rifles = [
    "arifle_MX_F",
    "arifle_MXC_F",
    // ... add or remove weapons
];

private _launchers = [
    "launch_B_Titan_F",
    // ... add or remove launchers
];

private _attachments = [
    "optic_Hamr",
    "acc_flashlight",
    // ... add or remove attachments
];
```

#### Equipamento
```sqf
private _uniforms = [
    "U_B_CombatUniform_mcam",
    // ... add or remove uniforms
];

private _vests = [
    "V_PlateCarrier1_rgr",
    // ... add or remove vests
];

private _headgear = [
    "H_HelmetB",
    // ... add or remove headgear
];

private _backpacks = [
    "B_AssaultPack_mcamo",
    // ... add or remove backpacks
];
```

#### Objetos y Equipamento
```sqf
private _medicalItems = [
    "kat_AFAK",
    // ... add or remove medical items
];

private _toolItems = [
    "ACE_CableTie",
    // ... add or remove tools
];

private _navigationItems = [
    "ItemMap",
    "ItemGPS",
    // ... add or remove navigation items
];
```

#### Municiones y Explosivos
```sqf
private _magazines = [
    "30Rnd_65x39_caseless_mag",
    // ... add or remove magazines
];

private _grenades = [
    "HandGrenade",
    "SmokeShell",
    // ... add or remove grenades
];
```

#### Notas de Implementación:
1. El sistema de arsenal automáticamente:
   - Funciona tanto con los arsenales de ACE como con los arsenales básicos
   - Se aplica a todas las cajas de arsenal, FOBs y OPs
   - Se actualiza dinámicamente cuando se crean nuevos FOBs/OPs

2. Compatibilidad con Mods:
   - Soporta artículos y equipo médico de ACE
   - Compatible con sistemas de radio TFAR
   - Funciona con artículos del sistema médico avanzado KAT
   - Soporta artículos de mods personalizados (solo agrega sus nombres de clase)

3. Para agregar nuevos artículos:
   - Encuentra la categoría correspondiente en `fn_restrictedArsenal.sqf`
   - Agrega el nombre de clase al array correspondiente
   - Los artículos estarán disponibles en todos los arsenales automáticamente

4. Optimización de Rendimiento:
   - Las restricciones del arsenal se aplican solo una vez por caja
   - Usa controladores de eventos eficientes para gestionar actualizaciones
   - Previene inicializaciones duplicadas

## Contribuciones

Siéntete libre de contribuir con mejoras o reportar problemas en nuestro repositorio de GitHub.

## Licencia

Esta misión está disponible bajo la GNU GENERAL PUBLIC LICENSE.

## Créditos

- Creado por Frontline Operations Development Group
- Un agradecimiento especial a los primeros colaboradores por su apoyo durante años literales.
- Este fork concreto es propiedad del clan 40K-ESP quien ha iberizado y modificado el código a su gusto
