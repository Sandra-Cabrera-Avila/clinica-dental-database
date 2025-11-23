-- Listar pacientes con su última cita
SELECT p.nombres, p.apellidos, c.fecha_cita, c.estado
FROM pacientes p
JOIN citas c ON p.id_paciente = c.id_paciente
ORDER BY c.fecha_cita DESC;

-- Historial de tratamientos por paciente
SELECT p.nombres, t.nombre AS tratamiento, h.fecha
FROM historial_tratamientos h
JOIN pacientes p ON h.id_paciente = p.id_paciente
JOIN tratamientos t ON h.id_tratamiento = t.id_tratamiento;

-- Total pagado por cada paciente
SELECT p.nombres, SUM(pa.monto) AS total_pagado
FROM pagos pa
JOIN pacientes p ON pa.id_paciente = p.id_paciente
GROUP BY p.id_paciente;
