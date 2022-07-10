<#
    .DESCRIPTION
        Este script inicia el servicio de Power BI Embedded utilizando PowerShell 5.1, previo a su ejecución es
        necesario haber actualizado los módulos Az.Accounts y Az.PowerBIEmbedded en la Automation Account,
        así como haber generado las 4 variables utilizadas en el script y asignar los permisos adecuados a la cuenta
        administrada relacionada con el Automation Account

    .NOTES
        AUTOR: Antonio Gutiérrez 4nGut
        LASTEDIT: Jul 10, 2022
        CC0 1.0 Universal (CC0 1.0)
        Public Domain Dedication
#>

"Favor de hablitar los permisos RBAC a la identidad de sistema de esta cuenta de automatización y generar las variables utilizadas"

$tid = Get-AutomationVariable -Name 'TenantID'
$sid = Get-AutomationVariable -Name 'SubscriptionID'
$pbie = Get-AutomationVariable -Name 'pbie'
$pbierg = Get-AutomationVariable -Name 'pbierg'

try
{
    "Iniciando sesión en Azure..."
    Connect-AzAccount -Tenant $tid -Subscription $sid -Identity
}
catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}


try
{
	Resume-AzPowerBIEmbeddedCapacity -Name $pbie -ResourceGroupName $pbierg -PassThru
	Write-Output "Recurso Power BI Embedded Iniciado Exitosamente"
}
catch
{
	Write-Error -Message $_.Exception
	throw  $_.Exception
}