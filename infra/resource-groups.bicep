targetScope = 'subscription'

@minLength(3)
@maxLength(30)
param resourceGroupName string

param resourceGroupLocation string = 'centralus'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}
