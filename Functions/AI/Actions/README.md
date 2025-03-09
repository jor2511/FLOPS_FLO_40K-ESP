# Acciones de Waypoints de Fuerzas de Tarea

Este directorio contiene un conjunto de funciones para gestionar los waypoints y comportamientos de las unidades AI en el marco de la misión FLO.

## Funciones Principales

### `FLO_fnc_addWaypoint`
La función base para agregar waypoints a un grupo. Todas las demás funciones de waypoint se basan en esta.

### `FLO_fnc_getTargetType`
Clasifica las unidades y vehículos en tipos (MAN, CAR, ARMOR, HELI, etc.) para determinar comportamientos apropiados.

## Funciones de Acción en Área

Estas funciones se utilizan para asignar tareas específicas a los grupos dentro de un área:

### `FLO_fnc_attackArea`
Asigna un grupo para atacar un área específica. El comportamiento varía según el tipo de unidad:
- La infantería se moverá al área y ejecutará un ataque (taskAttack).
- Los aviones realizarán misiones de búsqueda y destrucción, y luego aterrizarán.
- Los vehículos realizarán misiones de búsqueda y destrucción.

### `FLO_fnc_defendArea`
Asigna un grupo para defender una área específica:
- La infantería guarnecerá edificios y usará armas estáticas.
- Los aviones patrullarán y aterrizarán al finalizar la misión.
- Los vehículos realizarán seguridad perimetral.

### `FLO_fnc_patrolArea`
Asigna un grupo para patrullar una área específica:
- La infantería realizará patrullas aleatorias y buscará en las cercanías.
- Los aviones volarán entre puntos generados aleatoriamente.
- Los vehículos patrullarán una área más amplia.

### `FLO_fnc_reconArea`
Asigna un grupo para realizar reconocimiento en un área específica:
- La infantería usará movimiento sigiloso y reportará contactos enemigos.
- Los aviones realizarán vigilancia a gran altitud.
- Los vehículos realizarán inspecciones perimetrales más amplias.

## Funciones de Tareas

Estas son funciones de nivel inferior que implementan comportamientos tácticos específicos:

### `FLO_fnc_taskAttack`
Ordena a un grupo atacar una posición específica utilizando tácticas de búsqueda y destrucción.

### `FLO_fnc_taskDefend`
Ordena a un grupo defender una posición mediante el uso de armas estáticas, ocupando edificios y patrullando.

### `FLO_fnc_taskPatrol`
Crea un patrón de waypoints para que un grupo patrulle alrededor de una posición central.

### `FLO_fnc_reconAreaAction`
Se llama cuando una unidad llega a un waypoint de reconocimiento para reportar la presencia de enemigos al comandante AI.

## Ejemplo de Uso

```sqf
// Grupo atacando un área
[_myGroup, _targetPosition] call FLO_fnc_attackArea;

// Grupo defendiendo una posición
[_myGroup, _objectivePosition] call FLO_fnc_defendArea;

// Grupo patrullando con un radio de 500m
[_myGroup, _patrolCenter, 500] call FLO_fnc_patrolArea;

// Grupo realizando reconocimiento
[_myGroup, _reconPosition] call FLO_fnc_reconArea;
```
