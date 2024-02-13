// ****************************************** Common parameters **********************************************
param namePrefix string = 'AzureBicepLearner'
targetScope = 'resourceGroup'


// ****************************************** STORAGE ACCOUNT ************************************************

param accessTier string = 'Hot'
param skuType string = 'Premium_LRS'
param storageKind string = 'StorageV2'

module storageAccount 'Modules/StorageAccount.bicep' = {
  name: 'bicepsa09'
  params: {
    accessTier: accessTier
    location: 'canadacentral'
    skutype: skuType
    storageKind: storageKind
    StorageName: 'sabicep09'
  }

}

output storageAccountId string = storageAccount.outputs.storageAccountId



// ****************************************** App Service Plan ************************************************

param appServicePlanSku string = 'F1'

module AppServicePlan 'Modules/AppServicePlan.bicep' = {
  name: '${namePrefix}-AppServicePlan'
  params: {
    appServicePlanName: '${namePrefix}-AppServicePlan'
    appServicePlanSku: appServicePlanSku
    location: 'canadacentral'
  }
}

output appServicePlanFarmId string = AppServicePlan.outputs.appServiePlanId





// ****************************************** Web Application ************************************************


module WebApplication 'Modules/WebApp.bicep' = {
  name: '${namePrefix}-WebApplication'
  params: {
    appServicePlanId: AppServicePlan.outputs.appServiePlanId
    location: 'canadacentral'
    webAppName: '${namePrefix}-WebApplication'
  }
}

output WebApplicationUrl string = WebApplication.outputs.webAppUrl
