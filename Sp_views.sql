DELIMITER $$

-- SP - COMPLETADA
CREATE PROCEDURE sp_verificarFechaFin(
  IN p_fecha_inicio DATETIME,
  IN p_fecha_fin DATETIME,
  OUT p_fecha_valida BOOLEAN
)
BEGIN
  IF p_fecha_fin < p_fecha_inicio THEN 
    SET p_fecha_valida = FALSE;
  ELSE
    SET p_fecha_valida = TRUE;
  END IF;
END$$


DELIMITER;

-- VIEW - COMPLETADA
CREATE VIEW expedienteEstadoActual as 
SELECT ee.id_epe, ee.id_eto, ee.observacion, ed.nombre, 
       CONCAT(ee.fecha, ' ', ee.hora) AS fecha_hora
FROM expediente_estado ee, estado ed, expediente e
WHERE ee.id_eto = ed.id_eto 
  AND e.id_epe = ee.id_epe
  AND CONCAT(ee.fecha, ' ', ee.hora) = (
      SELECT MAX(CONCAT(ee2.fecha, ' ', ee2.hora))
      FROM expediente_estado ee2
      WHERE ee2.id_epe = ee.id_epe
  )
ORDER BY ee.id_epe;


-- VIEW  - COMPLETADA
CREATE VIEW expedienteAbogadoActual as
SELECT e.id_epe, e.asunto, CONCAT(a.nombre, " ", a.apellido_paterno, " ", a.apellido_materno) as nombre_abogado
FROM expediente e
INNER JOIN abogado_expediente ae 
  ON ae.id_epe = e.id_epe
INNER JOIN abogado a 
  ON a.id_abo = ae.id_abo
WHERE ae.id_aee = (
  SELECT ae2.id_aee
  FROM abogado_expediente ae2
  WHERE ae2.id_epe = e.id_epe
  ORDER BY ae2.fecha_asignacion DESC, ae2.hora_asignacion DESC
  LIMIT 1
);

-- TIRGGER -COMPLETADA
-- Cambiar abogado
DELIMITER $$

CREATE TRIGGER before_cambiar_abogado
BEFORE INSERT ON abogado_expediente
FOR EACH ROW
BEGIN
  DECLARE v_id_aee_anterior INT;

  SELECT ae.id_aee INTO v_id_aee_anterior
  FROM abogado_expediente AS ae
  WHERE ae.id_epe = NEW.id_epe 
    AND ae.fecha_termino IS NULL
  ORDER BY ae.fecha_asignacion DESC, ae.hora_asignacion DESC
  LIMIT 1;

  IF v_id_aee_anterior IS NOT NULL THEN
    UPDATE abogado_expediente 
    SET fecha_termino = CURRENT_DATE(),
        hora_termino = CURRENT_TIME()
    WHERE id_aee = v_id_aee_anterior;
  END IF;
END;


-- SP CREAR EXPEDIENTE - COMPLETADA
CREATE PROCEDURE sp_crear_expediente(
  IN p_id_cte INT,
  IN p_id_tco INT,
  IN p_asunto VARCHAR(35),
  IN p_tipo_participacion_cliente VARCHAR(15),
  IN p_observacion VARCHAR(50)
)
BEGIN
  DECLARE v_id_epe INT;

  INSERT INTO expediente(asunto, tipo_participacion_cliente, fecha_inicio, id_cte, id_tco)
  VALUES(p_asunto, p_tipo_participacion_cliente, CURRENT_DATE(), p_id_cte, p_id_tco );

  SET v_id_epe = LAST_INSERT_ID();

  INSERT INTO expediente_estado(id_epe,id_eto, fecha, hora, observacion)
  VALUES(v_id_epe,2, CURRENT_DATE(), CURRENT_TIME(), p_observacion);
  
END$$

CREATE PROCEDURE sp_modificar_expediente(
  IN p_id_epe INT,
  IN p_asunto VARCHAR(50),
  IN p_tipo_participacion_cliente VARCHAR(15),
  IN p_fecha_inicio DATETIME,
  IN p_fecha_fin DATETIME,
  IN p_id_cte INT,
  IN p_id_tco INT
)
BEGIN
  DECLARE v_fechas_correctas BOOLEAN;
  CALL sp_verificarFechaFin(p_fecha_inicio, p_fecha_fin, @resultado_fecha);
  SET v_fechas_correctas = @resultado_fecha;

  IF v_fechas_correctas THEN
    UPDATE expediente 
    SET 
      asunto = p_asunto, 
      tipo_participacion_cliente = p_tipo_participacion_cliente,
      fecha_inicio = p_fecha_inicio,
      fecha_fin = p_fecha_fin,
      id_cte = p_id_cte,
      id_tco = p_id_tco
    WHERE id_epe = p_id_epe;
  END IF;
END$$
DELIMITER ;

