# Comandante AI y Sistema de Fuerzas de Tarea

## Visión General
Este directorio contiene el sistema del Comandante AI y funciones relacionadas para controlar las fuerzas OPFOR en la misión FLO. El sistema gestiona fuerzas de tarea, integración de guarniciones y operaciones tácticas basadas en la situación actual en el campo de batalla.

## Componentes Clave

### Comandante AI (`fn_aiCommander.sqf`)
El sistema central de control AI que:
- Gestiona puestos avanzados y guarniciones
- Evalúa amenazas y adapta los modos de operación (ATACAR, DEFENDER, ESCARAMUZA)
- Despliega fuerzas de tarea para diversas misiones
- Procesa informes de reconocimiento
- Coordina operaciones combinadas de infantería y vehículos

### Acciones de Waypoint (`Actions/`)
Una suite de funciones que proporciona comportamientos tácticos para los grupos:
- `fn_attackArea.sqf`: Asigna comportamientos de ataque basados en el tipo de unidad y apoyo disponible
- `fn_defendArea.sqf`: Asigna comportamientos de defensa, incluyendo guarnicionar edificios
- `fn_patrolArea.sqf`: Crea patrones de patrullaje alrededor de una área designada
- `fn_reconArea.sqf`: Asigna comportamientos de reconocimiento para recopilar inteligencia
- `fn_reconAreaAction.sqf`: Maneja el reporte de inteligencia de vuelta al Comandante AI

### Integración de Vehículos
El sistema integra vehículos e infantería en grupos separados para un control máximo:
- Los vehículos son analizados usando `_evaluateVehicleCapabilities` para determinar sus roles óptimos
- Cada tipo de vehículo (Tanque, APC, MRAP, etc.) recibe comportamientos tácticos apropiados
- Los grupos de infantería y vehículos son coordinados para trabajar juntos a través de referencias de grupo vinculadas
- Los grupos de vehículos adaptan su comportamiento según el tipo de vehículo y la infantería que apoyan
- Los tipos de vehículos se extraen dinámicamente de los arrays en el archivo `CUSTOM_ENEMY_FACTION.sqf`:
  - `East_Ground_Vehicles_Heavy`: Tanques y APCs pesados para operaciones anti-vehículos
  - `East_Ground_Vehicles_Light`: APCs ligeros, MRAPs y vehículos armados
  - `East_Ground_Vehicles_Ambient`: Vehículos tipo civil y vehículos ambientales
  - `East_Ground_Transport`: Camiones de transporte y vehículos no armados
  - `East_Air_Transport`, `East_Air_Heli`, `East_Air_Jet`: Para operaciones aéreas

### Sistema de Integración de Guarniciones (`fn_taskForceGarrisonIntegration.sqf`)
Un sistema integral que conecta las fuerzas de tarea con las guarniciones de los puestos avanzados:
- Permite a las fuerzas de tarea extraer unidades de las guarniciones mediante `_pullUnitsFromGarrison`
- Retorna las unidades sobrevivientes a las guarniciones después de las operaciones mediante `_returnUnitsToGarrison`
- Nuevos métodos de gestión de vehículos:
  - `_pullVehicleFromGarrison`: Adquiere vehículos de una guarnición o los genera nuevos
  - `_returnVehicleToGarrison`: Retorna vehículos a los puestos avanzados de guarnición
  - `_addVehicleToGarrison`: Agrega nuevos vehículos a las guarniciones de los puestos avanzados
- Selección inteligente de tipos de vehículos basada en las necesidades de la misión y la composición enemiga

### Sistema de Fuerzas de Tarea
El sistema de despliegue de fuerzas de tarea ahora incluye:
- Operaciones de armas combinadas con apoyo de infantería y vehículos
- Selección de tipos de vehículos apropiados basada en la misión y la composición enemiga
- Waypoints coordinados que aseguran que los vehículos y la infantería trabajen juntos de manera efectiva
- Capacidades de reporte para las unidades de reconocimiento para proporcionar inteligencia de vuelta al comandante

## Uso

### Desplegar el Comandante AI
El Comandante AI está diseñado para ser inicializado al inicio de la misión:

```sqf
private _commander = call FLO_fnc_aiCommander;
```

### Trabajar con las Fuerzas de Tarea
Las fuerzas de tarea son desplegadas automáticamente por el Comandante AI, pero también se pueden crear manualmente:

```sqf
// Ejemplo de crear manualmente una fuerza de tarea con apoyo de vehículos
private _infantryGroup = [_position, _side, _infantryUnits] call BIS_fnc_spawnGroup;
private _vehicleGroup = [_position, _side, _vehicleType] call BIS_fnc_spawnGroup;

// Asignar acciones coordinadas
[_infantryGroup, _targetPosition, "ATTACK", _vehicleGroup] call FLO_fnc_attackArea;
[_vehicleGroup, _targetPosition, "ATTACK", _infantryGroup] call FLO_fnc_attackArea;
```

### Trabajar con Vehículos de Guarnición
El sistema de integración de guarniciones proporciona métodos para la gestión de vehículos:

```sqf
// Inicializar el sistema de integración de guarniciones
FLO_TaskForce_Garrison_Integration = call FLO_fnc_taskForceGarrisonIntegration;

// Agregar vehículos a una guarnición
FLO_TaskForce_Garrison_Integration call ["_addVehicleToGarrison", ["marker_outpost_1", "I_MRAP_03_hmg_F", 2]];

// Extraer un vehículo para una fuerza de tarea
private _vehicle = FLO_TaskForce_Garrison_Integration call ["_pullVehicleFromGarrison", ["marker_outpost_1", ["MRAP", "Car"], ["I_MRAP_03_hmg_F"], "TF_123"]];

// Retornar un vehículo a una guarnición
FLO_TaskForce_Garrison_Integration call ["_returnVehicleToGarrison", [_vehicle, "marker_outpost_1"]];
```

### Personalizar la Selección de Vehículos
El sistema utiliza los arrays de vehículos del archivo `CUSTOM_ENEMY_FACTION.sqf` para seleccionar los vehículos apropiados:

```sqf
// Ejemplo de seleccionar manualmente un tipo de vehículo basado en las necesidades de la operación
private _vehicleType = "";
if (_needAntiArmor) then {
    _vehicleType = selectRandom East_Ground_Vehicles_Heavy;
} else {
    if (_needPatrol) then {
        _vehicleType = selectRandom East_Ground_Vehicles_Light;
    } else {
        _vehicleType = selectRandom East_Ground_Transport;
    };
};
```

## Notas de Desarrollo
- Análisis de capacidades de vehículos basado en las banderas de uso de munición de la AI desde los archivos de configuración
- Los ajustes de formación y velocidad están adaptados a cada tipo de vehículo
- Los waypoints utilizan posicionamiento táctico apropiado para cada tipo de unidad
- Las operaciones de sigilo vs. combate se manejan de manera diferente para diferentes composiciones de unidades
- El sistema se adapta automáticamente a los vehículos definidos en el archivo de facción
