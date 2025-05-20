# DOCUMENTACIÓN

#### Nomenclatura

SP - Procedimiento Almacenado

V - View

T - Trigger

## SP - 1 Verificar fecha fin

_sp_verificarFechaFin_

Verifica que la **fecha de inicio y fin sean coherentes**, es decir, fecha fin no sea anterior a fecha inicio y viceversa.

Recibe tres parametros dos de entrada y uno de salida:

- p_fecha_inicio de tipo DATETIME.
- p_fecha_fin de tipo DATETIME.
- p_fecha_valida de tipo BOOLEAN y es el parámetro de salida.

## V - 1 Expediente estado actual

_expedienteEstadoActual_ - _Join Interno_

Muestra el último estado actual del expediente en la tabla expediente estado.

Union de tres tablas, las cuales son: `expediente_estado`, `estado`, `expediente`. Se muestra el **id del expediente**, **id del estado**, **observacion del expediente**, **estado del expediente**, **fecha y hora** del expediente.

Explicacion del query:

- Se seleccionan las tres tablas, la relación recae en el `id_eto` y `id_epe`.
- La última condicion, donde esta concatenada la fecha y hora, se obtiene el último estado del expediente. Se compara la fecha del primer select con la fecha máxima (subconsulta) que tenga el mismo `id_epe`.

## V - 2 Abogado actual del expediente

_expedienteAbogadoActual_ - _Joins externos_

Muestra el **abogado** que se encarga **actualmente del expediente.**

Se muestra el id del expediente, asunto y se concatena el nombre completo del abogado.

Se unen tres tablas, como lo son: **expediente, abogado_expediente y abogado.**

Explicación del query:

- Se unen **tres tablas** `INNER JOIN`, la relación se basa en el id del expediente `id_epe` y el id del abogado `id_abo`.
- Para el condicional se hace una **subconsulta**, que se base en obtener el mismo id de la tabla `abogado_expediente`, su primary key. Se encarga de encontrar el abogado actual del expediente.
  - **Se obtienen todos los abogados** relacionados al expediente; comparando el id del expediente del primer query con la subconsulta. `ae2.id_epe = e.id_epe`
  - Posteriormente se **ordenan de manera descendente** tanto la fecha como la hora, obteniendo así el **abogado más reciente al expediente**.

## T - 1 cambiar abogado de un expediente

_before_cambiar_abogado_

Un **trigger** que da de baja al abogado anterior para poder actualizar el actual en la tabla `abogado_expediente`.

Se declara una variable `v_id_aee_anterior` dentro del trigger de tipo entero, que almacenara el `id_aee` del expediente que tiene al abogado anterior activo.

Se hace la consulta procurando que la `fecha_termino` sea nula, que indicaria que es el abogado activo, se ordena de manera descendente la fecha y hora; posteriormente se inserta el valor en la variable `v_id_aee_anterior`

Si se econtro un id_aee válido, se actualizan los campos de fecha_termino y hora_termino de ese id_aee, indicando que se dio de baja a ese abogado.

## SP - 2 Crear expediente

Se crea este SP para controlar la seguridad de las tablas.
Así no se tiene contacto directo con las tablas.

Recibe cinco parámetros, que son: `p_id_cte`, `p_id_tco`, `p_asunto`, ` p_tipo_participacion_cliente`, `p_observacion`.

Se declara una bariable `v_id_epe` de tipo entera que almacena el id del expediente insertado, para que, posteriormente se utiliza para insertar en la tabla `expediente_estado`.

- Se utiliza la función `LAST_INSERT_ID()` para obtener el id.

**Para crear un expediente**, se necesita insertar los parametros en la tabla expediente.

- Se insertan los paŕametros `asunto, tipo_participacion_cliente, fecha_inicio, id_cte, id_tco` en la **tabla expediente**. Automaticamente se inserta la fecha actual con la función `CURRENT_DATE()`;

  ```sql
  INSERT INTO expediente(asunto, tipo_participacion_cliente, fecha_inicio, id_cte, id_tco)
  VALUES(p_asunto, p_tipo_participacion_cliente, CURRENT_DATE(), p_id_cte, p_id_tco );
  ```

- Se inserta el estado actual del expediente en la tabla expediente_estado.

  - Por defecto se declara el expediente como en trámite, que corresponde al estado con el `id_eto = 2`.
  - Igualmente se utiliza la funcion `CURRENT_DATE()` y `CURRENT_TIME()` para obtener la fecha y hora actual

  ```sql
  INSERT INTO expediente_estado(id_epe,id_eto, fecha, hora, observacion)
  VALUES(v_id_epe,2, CURRENT_DATE(), CURRENT_TIME(), p_observacion);
  ```

## SP - 3 Modificar expediente

SP que solo modifica el expediente, solo y únicamente la tabla expediente.

Se reciben siete parámetros, que son: `p_id_epe`, `p_asunto`, `p_tipo_participacion_cliente`, `p_fecha_inicio`, `p_fecha_fin`, `p_id_cte`, `p_id_tco`.

Se declara una **variable** de tipo boolean `v_fechas_correctas` que será la que reciba el valor de otro SP que validará las fechas `sp_verificarFechaFin`.

Explicacion del sp:

- Primero se evalúa si la fecha de inicio y la fecha de fin son válidas, se consiga llamando al SP `sp_verificarFechaFin`
  - Se pasan los parametros `p_fecha_inicio`, `p_fecha_fin` y una variable de sesión `@resultado_fecha`
- El resultado del sp se guarda en la variable `v_fechas_correctas`.
- Si el resultado es `TRUE` en la variable, entonces se actualiza la tabla expediente.
  - Se asignan los parametros del SP a cada cambo de expediente.
