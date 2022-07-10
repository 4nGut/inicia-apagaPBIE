# Uso de Azure Automation para el apagado y encendido automático de Power BI Embedded

## Qué pasos realizaremos

### Prerrequisitos
Previo a cualquier configuración necesitaremos acceso a una suscripción de Azure en donde tengamos los privilegios suficientes para realizar las tareas siguientes y un servicio de Power BI Embedded dado de alta, para fines de la demostración estaremos utilizando el rol de contribuidor, sin embargo, para ambientes con restricciones es posible realizar las actividades con permisos granulares, la configuración de dichos permisos y del componente de Power BI Embedded se encuentran fuera del alcance de este documento.
### Pasos para la configuración de Azure Automation Account
1.	Generar una nueva Azure Automation Account desde el portal con una identidad administrada asignada por el sistema
2.  Actualizar los módulos Az.Accounts y Az.PowerBIEmbeddedCapacity
3.	Dentro del componente Automation Account generar las siguientes 4 variables:
    1.	pbie asignándole el nombre del recurso Power BI Embedded
    2.	pbierg asignándole el nombre del grupo de recursos al que pertenece el recurso Power BI Embedded
    3.	TenantID asignándole el identificador de nuestro tenant de Azure
    4.	SubscriptionID asignándole el identificador de la suscripción de Azure que utilizaremos
4.	Generar Schedules para el arranque y apagado del servicio Power BI Embedded, por ejemplo, si queremos que el servicio se encuentre disponible de Lunes a Viernes de 8am a 7pm, generamos un Schedule para el encendido que inicie todos los días a las 7:50am validando la zona horaria, seleccionando recurrencia semanal y seleccionando los días de Lunes a Viernes, esta agenda se asignará al script de inicio del servicio que configuraremos posteriormente; para el apagado del servicio generamos otra agenda pero ahora a las 7:10pm, validamos nuestro huso horario, seleccionamos recurrencia semanal y seleccionamos los días de Lunes a Viernes
5.	A nivel de la suscripción asignar el rol de contribuidor a la cuenta administrada de nuestro Automation Account
6.	Descargar de github los scripts Start-PBIE y Stop-PBIE para el encendido y apagado del servicio Power BI Embedded respectivamente
7.	Por cada uno de los scripts generar un Runbook, copiar o importar el código de los scripts descargados previamente y validar que efectivamente el servicio de Power BI Embedded es afectado por éstos
8.	Una vez validado el funcionamiento de los scripts, el último paso es configurar a cada Runbook la agenda adecuada

Creado por Antonio Gutiérrez
2022-Jul-10
CC0 1.0 Universal (CC0 1.0)
Public Domain Dedication 
