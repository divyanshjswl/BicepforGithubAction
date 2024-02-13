param location string = 'canadacentral'
param name string = 'xyzzxy'
param accessTier string = 'Hot'
param skutype string = 'Premium_LRS'
param sakind string = 'StorageV2'


resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: name
  location: location
  kind: sakind
  sku: {
    name: skutype
  }
  properties: {
    accessTier: accessTier
  }
  tags: {
    Name: name
    owner: 'Divaynsh Jaiswal'
    Department: 'IT Infrastructure'
  }
}
