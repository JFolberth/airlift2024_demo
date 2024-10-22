@description('Location for all resources.')
param location string
@description('Base name that will appear for all resources.')
param baseName string = 'airliftazure'
@description('Three letter environment abreviation to denote environment that will appear in all resource names') 
param environmentName string = 'dev'

targetScope = 'subscription'

var regionReference = {
  centralus: 'cus'
  eastus: 'eus'
  westus: 'wus'
  westus2: 'wus2'
}
var nameSuffix = toLower('${baseName}-${environmentName}-${regionReference[location]}')
module resourceGroup 'br:mcr.microsoft.com/bicep/avm/res/resources/resource-group:0.3.0' ={
  name: '${baseName}_${regionReference[location]}'
  params:{
    name:  toLower('rg-${nameSuffix}')
    location: location
  }

}
